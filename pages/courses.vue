<template>
  <div>
    <p>courses</p>
    <NuxtWelcome />
  </div>
</template>

<script setup>
useHead({
  title: "Cours",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
