import '@mdi/font/css/materialdesignicons.css'
// import { VCalendar } from 'vuetify/labs/VCalendar'

import 'vuetify/styles'
import { createVuetify } from 'vuetify'

export default defineNuxtPlugin( (app) => {
    const vuetify = createVuetify({})
    app.vueApp.use(vuetify)
})