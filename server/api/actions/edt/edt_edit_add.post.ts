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

    if (body.classe.length > body.numero.length) {
        for (
            let index: number = body.numero.length;
            index < body.classe.length;
            index++
        ) {
            try {
                const { data, error } = await supabase.from("EDT").insert([
                    {
                        CodeClasse: body.classe[index],
                        CodeElement: body.element,
                        IdEnseignant: body.enseignant,
                        NumeroSalle: body.salle,
                        Date: body.date,
                        Horaire: body.horaire,
                    },
                ]);

                if (errors.length < 1) errors.push(error);
                else if (errors[0] == null) errors[0] = error;
            } catch (sqlerror) {
                throw sqlerror;
            }
        }
        try {
            const { error } = await supabase
                .from("EDT")
                .update({
                    CodeClasse: body.classe[body.numero.length - 1],
                    CodeElement: body.element,
                    IdEnseignant: body.enseignant,
                    NumeroSalle: body.salle,
                    Date: body.date,
                    Horaire: body.horaire,
                })
                .eq("NumeroEdt", body.numero[body.numero.length - 1]);

            if (errors.length < 1) errors.push(error);
            else if (errors[0] == null) errors[0] = error;
        } catch (sqlError) {
            throw sqlError;
        }
    }
});
