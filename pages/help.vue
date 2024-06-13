<template>
  <div>
    <p>help</p>
    <NuxtWelcome />
  </div>
</template>

<script setup>
useHead({
  title: "Aide",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
