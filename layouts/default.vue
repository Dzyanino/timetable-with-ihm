<template>
    <UHorizontalNavigation :links="navItems"
        class="border-b border-gray-200 dark:border-gray-800 px-4 md:px-8 lg:px-16 xl:px-48" />
    <div class="mx-auto px-2 md:px-4 lg:px-6">
        <slot />
    </div>
</template>

<script setup>
import { ref } from 'vue';

const navItems = ref([
    [
        { label: "Yoo", icon: "i-heroicons-home", to: "/" },
    ],
    [
        { label: "Emploi du temps", icon: "i-heroicons-table-cells", to: "emploidutemps" },
        { label: "Enseignants", icon: "i-heroicons-academic-cap", to: "enseignants" },
        { label: "Salles", icon: "i-heroicons-building-office", to: "salles" },
        { label: "Cours", icon: "i-heroicons-book-open", to: "cours" }
    ],
    [
        { to: "help", label: "Aide", icon: "i-heroicons-question-mark-circle" },
        { to: "about", label: "A propos", icon: "i-heroicons-information-circle" }
    ]
]);
</script>
