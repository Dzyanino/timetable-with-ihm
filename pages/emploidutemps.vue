<template>
    <v-container fluid class="px-2 px-md-4 px-lg-8">
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
