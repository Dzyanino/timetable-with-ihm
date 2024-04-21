// https://nuxt.com/docs/api/configuration/nuxt-config

export default defineNuxtConfig({
  app: {
    head: {
      charset: "utf-8",
      viewport: "width=device-width, initial-scale=1",
    },
    layoutTransition: { name: 'layout', mode: 'out-in' },
    pageTransition: { name: 'slide', mode: 'out-in' }
  },

  devtools: { enabled: false },
  modules: ["vuetify-nuxt-module"],//"@nuxtjs/supabase", 
  vuetify: {
    vuetifyOptions: {
      directives: true,
      icons: {
        defaultSet: "mdi",
      }
    }
  }
})