<script setup>
const propss = defineProps({
    modelValue: {
        type: Boolean,
        default: false
    },
    choosed: {
        type: Object,
        required: true
    },
    allData: {
        type: Object,
    }
});

const menu = ref(false);
const formattedDate = computed(() => {
    return propss.choosed.dateChoisieFull ? propss.choosed.dateChoisieFull.toLocaleDateString("fr") : "";
});
</script>

<template>
    <v-dialog :model-value="modelValue" persistent max-width="750px" transition="scroll-y-reverse-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>Editer</h3>
            </v-card-title>
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="4">
                        <v-autocomplete v-model="choosed.classeChoisie" :items="allData.classes" item-props="Titre"
                            item-value="CodeClasse" variant="outlined" density="default" no-data-text="Vide..."
                            label="Classe" multiple chips auto-select-first clear-on-select />
                    </v-col>
                    <v-col cols="12" md="4">
                        <v-menu v-model="menu" :close-on-content-click="false" transition="scale-transition" lazy
                            offset-y>
                            <template v-slot:activator="{ props }">
                                <v-text-field v-model="formattedDate" variant="outlined" density="default"
                                    append-inner-icon="mdi-calendar" v-bind="props" hide-details readonly />
                            </template>
                            <v-date-picker title="Choisissez une date" first-day-of-week="1"
                                v-model="choosed.dateChoisieFull">
                                <template v-slot:actions>
                                    <v-btn @click="menu = !menu">Fermer</v-btn>
                                </template>
                            </v-date-picker>
                        </v-menu>
                    </v-col>
                    <v-col cols="12" md="4">
                        <v-autocomplete v-model="choosed.horaireChoisi" :items="allData.horaires" variant="outlined"
                            density="default" no-data-text="Vide..." label="Heure" auto-select-first clear-on-select />
                    </v-col>
                    <v-col cols="12">
                        <v-autocomplete v-model="choosed.uniteChoisie" :items="allData.unites" item-props="Titre"
                            item-value="CodeUnite" variant="outlined" density="default" no-data-text="Vide..."
                            label="Unité d'enseignement" @update:model-value="$emit('varier-element')"
                            auto-select-first />
                    </v-col>
                    <v-col cols="12">
                        <v-autocomplete :disabled="(choosed.uniteChoisie == null)" v-model="choosed.elementChoisi"
                            :items="allData.elements" item-props="Titre" item-value="CodeElement" variant="outlined"
                            density="default" auto-select-first no-data-text="Vide..." label="Element constitutif" />
                    </v-col>
                    <v-col cols="12" md="8">
                        <v-autocomplete v-model="choosed.enseignantChoisi" :items="allData.enseignants"
                            item-props="Titre" item-value="IdEnseignant" variant="outlined" density="default"
                            auto-select-first no-data-text="Vide..." label="Enseignant" />
                    </v-col>
                    <v-col cols="12" md="4">
                        <v-autocomplete v-model="choosed.salleChoisie" :items="allData.salles" item-title="NumeroSalle"
                            item-value="NumeroSalle" variant="outlined" density="default" auto-select-first
                            no-data-text="Vide..." label="Salle" />
                    </v-col>
                </v-row>
            </v-card-text>
            <v-card-actions class="d-flex justify-end">
                <v-btn @click="$emit('close-dialog')">fermer</v-btn>
                <v-btn @click="$emit('add-edt')">ok</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>