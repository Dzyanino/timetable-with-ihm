<script setup>
</script>

ScriptCompileContext
<template>
    <v-dialog v-model="editerDialog" persistent max-width="750px" transition="scroll-y-reverse-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>Editer</h3>
            </v-card-title>
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="5">
                        <v-autocomplete v-model="classeChoisie" :items="classes" item-props="Titre"
                            item-value="CodeClasse" variant="outlined" density="default" multiple chips
                            auto-select-first clear-on-select no-data-text="Vide..." label="Classe" />
                    </v-col>
                    <v-col cols="12" md="7">
                        <!-- <v-text-field label="Date" type="date"></v-text-field> -->
                        <v-menu :close-on-content-click="false" transition="scale-transition" lazy offset-y>
                            <template v-slot:activator="{ props }">
                                <v-text-field v-model="dateChoisie" variant="outlined" density="default"
                                    append-inner-icon="mdi-calendar" no-title hide-details readonly
                                    v-bind="props"></v-text-field>
                            </template>
                            <v-date-picker first-day-of-week="1" v-model="dateChoisieFull"></v-date-picker>
                        </v-menu>
                    </v-col>
                    <v-col cols="12">
                        <v-autocomplete v-model="uniteChoisie" :items="unites" item-props="Titre" item-value="CodeUnite"
                            variant="outlined" density="default" auto-select-first no-data-text="Vide..."
                            label="Unité d'enseignement" @click="elementChoisi = null"
                            @update:model-value="varierElement" />
                    </v-col>
                    <v-col cols="12">
                        <v-autocomplete :disabled="(uniteChoisie == null)" v-model="elementChoisi" :items="elements"
                            item-props="Titre" item-value="CodeElement" variant="outlined" density="default"
                            auto-select-first no-data-text="Vide..." label="Element constitutif" />
                    </v-col>
                    <v-col cols="12" md="8">
                        <v-autocomplete v-model="enseignantChoisi" :items="enseignants" item-props="Titre"
                            item-value="IdEnseignant" variant="outlined" density="default" auto-select-first
                            no-data-text="Vide..." label="Enseignant" />
                    </v-col>
                    <v-col cols="12" md="4">
                        <v-autocomplete v-model="salleChoisie" :items="salles" item-title="NumeroSalle"
                            item-value="NumeroSalle" variant="outlined" density="default" auto-select-first
                            no-data-text="Vide..." label="Salle" />
                    </v-col>
                </v-row>
            </v-card-text>
            <v-card-actions class="d-flex justify-end">
                <v-btn @click="editerDialog = !editerDialog">fermer</v-btn>
                <v-btn @click="editerEdt">ok</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>