import { serverSupabaseClient } from "#supabase/server";

let errors = [];

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    let actualEDT = null;
    try {
        const { data: EDT, error } = await supabase
            .from("EDT")
            .select("*")
            .eq("Date", body.date)
            .eq("NumeroSalle", body.salle)
            .eq("CodeElement", body.element)
            .eq("IdEnseignant", body.enseignant);
        actualEDT = EDT;
    } catch (err) {
        throw err;
    }

    if (body.classe.length < body.numero.length) {
        if (!!actualEDT) {
            const haveToDelete = actualEDT.filter((e) => {
                return (
                    body.numero.includes(e.NumeroEdt) &&
                    !body.numero.includes(e.CodeClasse)
                );
            });

            try {
                const { error } = await supabase
                    .from("EDT")
                    .delete()
                    .eq("NumeroEdt")
                    .neq("CodeClasse", body.classe[0]);

                errors.push(error);
            } catch (sqlError) {
                throw sqlError;
            }

            body.numero.forEach(async (num: number) => {
                try {
                    const { error } = await supabase
                        .from("EDT")
                        .update({
                            CodeClasse: body.classe[0],
                            CodeElement: body.element,
                            IdEnseignant: body.enseignant,
                            NumeroSalle: body.salle,
                        })
                        .eq("NumeroEdt", num)
                        .eq("CodeClasse", body.classe[0]);

                    errors.push(error);
                } catch (sqlError) {
                    throw sqlError;
                }
            });
        }
    } else if (body.classe.length > body.numero.length) {
        for (
            let index = body.numero.length;
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
                    },
                ]);
            } catch (sqlerror) {
                throw sqlerror;
            }
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
