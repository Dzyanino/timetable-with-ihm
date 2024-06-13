<template>
  <div>
    <p>teachers</p>
    <NuxtWelcome />
  </div>
</template>

<script setup>
useHead({
  title: "Enseignants",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
