<script setup>
const props = defineProps({
    modelValue: {
        type: Boolean,
        required: true,
        default: false,
    },
    titre: {
        type: String,
        default: "Information",
    },
    message: {
        type: String,
        default: "",
    }
})
</script>

<template>
    <v-dialog :model-value="modelValue" persistent max-width="750px" transition="scroll-y-reverse-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>{{ titre }}</h3>
            </v-card-title>
            <v-card-text>
                <span>{{ message }}</span>
            </v-card-text>
            <v-card-actions>
                <v-btn @click="$emit('close-dialog')">fermer</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>