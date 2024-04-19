// https://nuxt.com/docs/api/configuration/nuxt-config

import vuetify, { transformAssetUrls } from 'vite-plugin-vuetify'

export default defineNuxtConfig({
  app: {
    head: {
      charset: "utf-8",
      viewport: "width=device-width, initial-scale=1",
    },
    layoutTransition: { name: 'layout', mode: 'out-in' },
    pageTransition: { name: 'slide', mode: 'out-in' }
  },
  build: {
    transpile: ['vuetify'],
  },
  modules: [
    (_options, nuxt) => {
      nuxt.hooks.hook('vite:extendConfig', (config) => {
        // @ts-expect-error
        config.plugins.push(vuetify({ autoImport: true }))
      })
    },
  ],
  vite: {
    vue: {
      template: {
        transformAssetUrls,
      },
    },
  },
  devtools: { enabled: false },
  // runtimeConfig: {
  //   dbName: process.env.DATABASE_NAME,
  //   username: process.env.USERNAME,
  //   password: process.env.PASSWORD,
  //   host: process.env.HOST,
  //   dialect: process.env.DIALECT,
  // },
  // nitro: {
  //   plugins: ["~/server/index.ts"],
  // },
})
