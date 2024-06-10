import { serverSupabaseClient } from "#supabase/server";

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    const { data } = await supabase
        .from("classe_view")
        .select("*")
        .eq("CodeNiveau", body.niveau);

    return { view_classe: data };
});
