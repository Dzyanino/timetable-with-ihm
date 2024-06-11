import { serverSupabaseClient } from "#supabase/server";

let errors: null | object[] = [];

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    let actualEDT: null | object[] = [];
    try {
        const { data: EDT, error } = await supabase
            .from("EDT")
            .select("*")
            .eq("Date", body.date)
            .eq("NumeroSalle", body.salle)
            .eq("CodeElement", body.element)
            .eq("IdEnseignant", body.enseignant)
            .eq("Horaire", body.horaire);

        actualEDT = EDT;

        if (errors.length < 1) errors.push(error);
        else if (errors[0] == null) errors[0] = error;
    } catch (err) {
        throw err;
    }
    if (body.classe.length < body.numero.length) {
        body.numero.forEach(async (num: number, index: number) => {
            if (!!body.classe[index]) {
                try {
                    const { error } = await supabase
                        .from("EDT")
                        .update({
                            CodeClasse: body.classe[index],
                            CodeElement: body.element,
                            IdEnseignant: body.enseignant,
                            NumeroSalle: body.salle,
                            Date: body.date,
                            Horaire: body.horaire,
                        })
                        .eq("NumeroEdt", num)
                        .eq("CodeClasse", body.classe[index]);

                    if (errors.length < 1) errors.push(error);
                    else if (errors[0] == null) errors[0] = error;
                } catch (sqlError) {
                    throw sqlError;
                }
            }
        });
        if (actualEDT.length > 0) {
            const haveToDelete: object[] = actualEDT.filter((e) => {
                return (
                    body.numero.includes(e.NumeroEdt) &&
                    !body.classe.includes(e.CodeClasse)
                );
            });

            try {
                const { error } = await supabase
                    .from("EDT")
                    .delete()
                    .eq("NumeroEdt", haveToDelete[0].NumeroEdt);

                if (errors.length < 1) errors.push(error);
                else if (errors[0] == null) errors[0] = error;
            } catch (sqlError) {
                throw sqlError;
            }
        }
    }
    return errors;
});
