import { serverSupabaseClient } from "#supabase/server";

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    const { data } = await supabase
        .from("Salle")
        .select("*")
    
    return { salle: data };
});
