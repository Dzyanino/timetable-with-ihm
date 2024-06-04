// https://nuxt.com/docs/api/configuration/nuxt-config

export default defineNuxtConfig({
    devtools: { enabled: false },
    // ssr: false,

    app: {
        head: {
            charset: "utf-8",
            viewport: "width=device-width, initial-scale=1",
        },
        layoutTransition: { name: "layout", mode: "out-in" },
        pageTransition: { name: "slide", mode: "out-in" },
    },

    modules: ["@nuxtjs/supabase", "vuetify-nuxt-module", "nuxt-lodash"],

    supabase: {
        url: process.env.SUPABASE_URL,
        key: process.env.SUPABASE_KEY,
        // serviceKey: process.env.SUPABASE_SERVICE_KEY,
        redirect: false,
    },

    vuetify: {
        vuetifyOptions: {
            directives: true,
            locale: {
                locale: "fr",
            },
            // date: {
            //   locale: {
            //     fr: "fr-FR"
            //   }
            // },
            icons: {
                defaultSet: "mdi",
            },
        },
    },
});
