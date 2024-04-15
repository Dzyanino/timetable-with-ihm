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
        { label: "Yoo", icon: "i-heroicons-home", to: "/", class: "border-spacing-x-28" },
    ],
    [
        { label: "Emploi du temps", icon: "i-heroicons-table-cells", to: "emploidutemps", class: "border-spacing-x-28" },
        { label: "Enseignants", icon: "i-heroicons-academic-cap", to: "enseignants", class: "border-spacing-x-28" },
        { label: "Salles", icon: "i-heroicons-building-office", to: "salles", class: "border-spacing-x-28" },
        { label: "Cours", icon: "i-heroicons-book-open", to: "cours", class: "border-spacing-x-28" }
    ],
    [
        { to: "help", label: "Aide", icon: "i-heroicons-question-mark-circle", class: "border-spacing-x-28" },
        { to: "about", label: "A propos", icon: "i-heroicons-information-circle", class: "border-spacing-x-28" }
    ]
]);
</script>
