<template>
  <div>
    <p>rooms</p>
    <NuxtWelcome />
  </div>
</template>

<script setup>
useHead({
  title: "Salles",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
