<script setup>
const props = defineProps({
    modelValue: {
        type: Boolean,
        default: false,
    }
});
</script>

<template>
    <v-menu :model-value="modelValue">
        <v-list>
            <v-list-item link>
                <v-list-item-title>Editer</v-list-item-title>
            </v-list-item>
            <v-list-item link>
                <v-list-item-title class="text-error">Supprimer</v-list-item-title>
            </v-list-item>
        </v-list>
    </v-menu>
</template>