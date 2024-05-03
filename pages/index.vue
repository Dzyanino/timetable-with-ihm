<template>
  <div align="center">
    <v-btn
      to="/emploidutemps"
      text="Getting started"
      append-icon="mdi-arrow-right"
    />
  </div>
</template>

<script setup>
useHead({
  title: "FOTOANA",
  meta: [
    {
      name: "description",
      content:
        "A beautiful and easy to use web application for managing your college's timetable",
    },
  ],
});
</script>
