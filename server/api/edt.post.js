import { serverSupabaseClient } from '#supabase/server';

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    const { data } = await supabase.from('edt_view')
    .select('*')
    .eq('CodeNiveau', body.niveau)
    .gte('Date', body.debutSemaine)
    .lte('Date', body.finSemaine);

    return { edt: data };
})