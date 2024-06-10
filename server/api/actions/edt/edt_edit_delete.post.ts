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
                    .eq("NumeroEdt", haveToDelete[0].NumeroEdt)
                    .neq("CodeClasse", body.classe[0]);

                if (errors.length < 1) errors.push(error);
                else if (errors[0] == null) errors[0] = error;
            } catch (sqlError) {
                throw sqlError;
            }

            body.numero.forEach(async (num: number) => {
                if (num != haveToDelete[0].NumeroEdt) {
                    try {
                        const { error } = await supabase
                            .from("EDT")
                            .update({
                                CodeClasse: body.classe[0],
                                CodeElement: body.element,
                                IdEnseignant: body.enseignant,
                                NumeroSalle: body.salle,
                                Date: body.date,
                                Horaire: body.horaire,
                            })
                            .eq("NumeroEdt", num)
                            .eq("CodeClasse", body.classe[0]);

                        if (errors.length < 1) errors.push(error);
                        else if (errors[0] == null) errors[0] = error;
                    } catch (sqlError) {
                        throw sqlError;
                    }
                }
            });
        }
    }
});
