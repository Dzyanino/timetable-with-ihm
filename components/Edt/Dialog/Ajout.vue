<script setup>
</script>

<template>
    <v-dialog v-model="ajouterDialog" persistent max-width="750px" transition="scroll-y-reverse-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>Ajouter</h3>
            </v-card-title>
            <v-card-text>
                <v-text-field label="test ajout"></v-text-field>
                <v-text-field label="jour"></v-text-field>
            </v-card-text>
            <v-card-actions class="d-flex justify-end">
                <v-btn @click="ajouterDialog = !ajouterDialog">fermer</v-btn>
                <v-btn>ok</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>