<template>
  <v-container fluid class="px-2 px-md-4 px-lg-8">
    <Timetable />
  </v-container>
</template>

<script setup>
useHead({
  title: "Emploi du temps",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
