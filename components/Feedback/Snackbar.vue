<script setup>
const props = defineProps({
    modelValue: {
        type: Boolean,
        default: false
    },
    color: {
        type: String,
        default: "primary"
    },
    message: {
        type: String,
        default: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ea rerum asperiores quia consectetur velit, laudantium suscipit incidunt illo voluptates praesentium numquam eos repudiandae nostrum autem dolorem expedita mollitia dignissimos? Dolorem."
    },
    timeout: {
        type: Number,
        default: 3000
    }
})
</script>

<template>
    <v-snackbar :model-value="modelValue" :color="color" transition="slide-y-reverse-transition" :timeout="timeout">
        <template v-slot:text>
            <span>{{ message }}</span>
        </template>
        <template v-slot:actions>
            <v-btn variant="text" @click.native="$emit('close')">Fermer</v-btn>
        </template>
    </v-snackbar>
</template>