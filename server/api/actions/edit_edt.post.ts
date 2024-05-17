import { serverSupabaseClient } from "#supabase/server";

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    for (let index = 0; index < body.numero.length; index++) {
        const { error } = await supabase
            .from("EDT")
            .update({
                CodeClasse: body.classe[index],
                CodeElement: body.element,
                IdEnseignant: body.enseignant,
                NumeroSalle: body.salle,
            })
            .eq("NumeroEdt", body.numero[index]);
    }
    return "ok";
});
