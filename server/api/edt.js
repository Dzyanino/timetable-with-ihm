import { serverSupabaseClient } from '#supabase/server';

export default eventHandler(async (event) => {
    if (event.method === "POST") {
        const supabase = await serverSupabaseClient(event)

        const { data } = await supabase.from('edt_view')
        .select('*')
        .eq('CodeNiveau', 'L1')
        .gte('Date', '2024-04-26')
        .lte('Date', '2024-04-30');
        return { edt: data };
    }
    else return null;
})