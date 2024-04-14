<template>
    <div>
        <UHorizontalNavigation />
        <UButton label="from index" color="red" variant="outline" icon="i-heroicons-magnifying-glass" />
        <UIcon name="i-heroicons-rocket-launch" />
    </div>
</template>

<script setup>
import { ref } from 'vue';
const item = ref([
    { label: "Yo" },
    { label: "Nice" }
])
</script>
