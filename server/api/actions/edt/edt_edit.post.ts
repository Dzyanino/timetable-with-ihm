import { serverSupabaseClient } from "#supabase/server";

let errors: null | object[] = [];

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    for (let index: number = 0; index < body.numero.length; index++) {
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
                .eq("NumeroEdt", body.numero[index]);

            if (errors.length < 1) errors.push(error);
            else if (errors[0] == null) errors[0] = error;
        } catch (sqlError) {
            throw sqlError;
        }
    }

    return errors;
});
