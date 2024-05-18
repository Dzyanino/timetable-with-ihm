import { serverSupabaseClient } from "#supabase/server";

let errors = [];

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    if (body.classe.length < body.numero.length) {
        try {
            const { error } = await supabase
                .from("EDT")
                .delete()
                .or(
                    "NumeroEdt.eq." +
                        body.numero[0] +
                        ",NumeroEdt.eq." +
                        body.numero[1]
                )
                .neq("CodeClasse", body.classe[0]);

            errors.push(error);
        } catch (sqlError) {
            throw sqlError;
        }

        try {
            const { error } = await supabase
                .from("EDT")
                .update({
                    CodeClasse: body.classe[0],
                    CodeElement: body.element,
                    IdEnseignant: body.enseignant,
                    NumeroSalle: body.salle,
                })
                .or(
                    "NumeroEdt.eq." +
                        body.numero[0] +
                        ",NumeroEdt.eq." +
                        body.numero[1]
                )
                .eq("CodeClasse", body.classe[0]);

            errors.push(error);
        } catch (sqlError) {
            throw sqlError;
        }
    } else if (body.classe.length > body.numero.length) {
        try {
            const { error } = await supabase
                .from("EDT")
                .insert({
                    CodeClasse: body.classe[index],
                    CodeElement: body.element,
                    IdEnseignant: body.enseignant,
                    NumeroSalle: body.salle,
                });
        } catch (sqlerror) {
            throw sqlerror;
        }
    } else {
        for (let index = 0; index < body.numero.length; index++) {
            try {
                const { error } = await supabase
                    .from("EDT")
                    .update({
                        CodeClasse: body.classe[index],
                        CodeElement: body.element,
                        IdEnseignant: body.enseignant,
                        NumeroSalle: body.salle,
                    })
                    .eq("NumeroEdt", body.numero[index]);

                errors.push(error);
            } catch (sqlError) {
                throw sqlError;
            }
        }
    }

    return errors;
});
