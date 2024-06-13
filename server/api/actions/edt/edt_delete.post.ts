import { serverSupabaseClient } from "#supabase/server";

let errors: null | object[] = [];

export default eventHandler(async (event) => {
    const supabase = await serverSupabaseClient(event);
    const body = await readBody(event);

    for (let index: number = 0; index < body.numero.length; index++) {
        try {
            const { error } = await supabase
                .from("EDT")
                .delete()
                .eq("NumeroEdt", body.numero[index]);

            if (errors.length < 1) errors.push(error);
            else if (errors[0] == null) errors[0] = error;
        } catch (sqlerror) {
            throw sqlerror;
        }
    }
    return errors;
});
