<template>
    <v-container fluid>
      <Timetable />
    </v-container>
</template>

<script setup>
import Timetable from '../components/timetable.vue';

useHead({
  title: "Emploi du temps"
})

definePageMeta({
  layout: "main-layout",
})
</script>
