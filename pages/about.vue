<template>
  <div>
    <p>about</p>
    <NuxtWelcome />
  </div>
</template>

<script setup>
useHead({
  title: "A propos",
});

definePageMeta({
  layout: "main-layout",
  pageTransition: {
    name: "slide",
  },
});
</script>
