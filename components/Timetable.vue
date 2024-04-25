<script setup>

// CONSTANTES ----------------------------------------------------------------------------------
const tableHeaders = ref([
    {
        title: "Lundi",
        key: "lun",
        sortable: false,
        minWidth: "250px",
    },
    {
        title: "Mardi",
        key: "mar",
        sortable: false,
        minWidth: "250px",
    },
    {
        title: "Mercredi",
        key: "mer",
        sortable: false,
        minWidth: "250px",
    },
    {
        title: "Jeudi",
        key: "jeu",
        sortable: false,
        minWidth: "250px",
    },
    {
        title: "Vendredi",
        key: "ven",
        sortable: false,
        minWidth: "250px",
    },
    {
        title: "Samedi",
        key: "sam",
        sortable: false,
        minWidth: "250px",
    },
]);
const tableItems = ref([
    {
        heures: [
            "07:30 - 09:00",
            "09:00 - 10:30",
            "10:30 - 12:00",
            "13:30 - 15:00",
            "15:00 - 16:30",
            "16:30 - 18:00",
        ],
        lundi: {
            prem: [
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
            deux: [],
            trois: [],
            quatre: [],
            cinq: [],
            six: [],
        },
        mardi: {
            prem: [],
            deux: [],
            trois: [
                // { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
            ],
            quatre: [],
            cinq: [],
            six: [],
        },
        mercredi: {
            prem: [],
            deux: [
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
            trois: [],
            quatre: [],
            cinq: [
                // { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
                // { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
            six: [
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
            ],
        },
        jeudi: {
            prem: [
                { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            deux: [],
            trois: [
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
            ],
            quatre: [
                // { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
            cinq: [],
            six: [
                // { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },

            ],
        },
        vendredi: {
            prem: [],
            deux: [],
            trois: [
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
            ],
            quatre: [],
            cinq: [
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
                { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            six: [],
        },
        samedi: {
            prem: [],
            deux: [],
            trois: [],
            quatre: [
                { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            cinq: [],
            six: [
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
        },
    }
]);

const joursSemaine = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];
const dateActuelle = ref(new Date());
const debutSemaine = ref(null);
const finSemaine = ref(null);

const niveau = ref("L1");

const editerDialog = ref(false);
const ajouterDialog = ref(false);
// CONSTANTES ----------------------------------------------------------------------------------
//
//
//
//
//
//
// MADE FONCTIONS -----------------------------------------------------------------------------------
const formatterDate = (date) => {
    const annee = date.getFullYear();
    const mois = (date.getMonth() + 1).toString().padStart(2, '0');
    const jour = date.getDate().toString().padStart(2, '0');

    return annee + '-' + mois + '-' + jour;
};

const prendreSemaine = (actualDate) => {
    const numeroJour = ref(actualDate.getDay());

    debutSemaine.value = new Date(actualDate);
    debutSemaine.value.setDate(actualDate.getDate() - numeroJour.value + 1);
    debutSemaine.value = formatterDate(debutSemaine.value);

    finSemaine.value = new Date(actualDate);
    finSemaine.value.setDate(actualDate.getDate() + (6 - numeroJour.value));
    finSemaine.value = formatterDate(finSemaine.value);
};

const initDonnees = async () => {
    const { edt } = await $fetch('/api/edt',
    {
        method: "POST",
        body: {
            niveau: niveau.value,
            debutSemaine: debutSemaine.value,
            finSemaine: finSemaine.value
        }
    });
};

// const fillTable = (data) => {
//     tableItems.value[0].lundi.prem[0] = data
// };
// MADE FONCTIONS -----------------------------------------------------------------------------------

onMounted(async () => {
    prendreSemaine(dateActuelle.value);
    await initDonnees();
    // fillTable(edt);
})

</script>

<template>
    <div>
        <v-row class="pb-2">
            <v-col cols="12" md="4" offset-md="2" class="text-center text-button">
                <h2>L1</h2>
            </v-col>
            <v-col cols="12" md="4" class="text-center text-button">
                <h2>15 Avril - 21 Avril</h2>
            </v-col>
        </v-row>
        <v-data-table sticky :headers="tableHeaders" :items="tableItems" class="border-t border-e border-b rounded mb-4"
            color="green">

            <template v-slot:headers="{ columns }">
                <tr>
                    <td class="border-s border-b text-center text-overline" width="150px">#</td>
                    <template v-for="column in columns" :key="column.key">
                        <td class="border-s border-b text-center text-overline" width="250px">
                            <span>{{ column.title }}</span>
                        </td>
                    </template>
                </tr>
            </template>

            <template v-slot:item="{ item }">
                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[0] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].prem.length > 0" v-for="horaire in item[jour].prem"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-if="horaire.groupe.length > 0" v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>

                                            <template v-else>
                                                <span>{{ horaire.niveau }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[1] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].deux.length > 0" v-for="horaire in item[jour].deux"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[2] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].trois.length > 0" v-for="horaire in item[jour].trois"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td colspan="7" class="border-s"></td>
                </tr>

                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[3] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].quatre.length > 0" v-for="horaire in item[jour].quatre"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[4] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].cinq.length > 0" v-for="horaire in item[jour].cinq"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-s">
                        <div class="d-flex flex-row align-center justify-center">
                            <v-sheet width="125px" class="text-center text-overline">
                                {{ item.heures[5] }}
                            </v-sheet>
                        </div>
                    </td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-s bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-if="item[jour].six.length > 0" v-for="horaire in item[jour].six"
                                    :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0 cellule-hover" width="100%"
                                        @click="editerDialog = !editerDialog">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-center">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere
                                                }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>
                                    </v-card>
                                </template>
                                <template v-else>
                                    <div class="empty-cell-width"></div>
                                    <!-- <v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
                                        <v-card-text class="text-center">
                                            <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
                                                {{ index }}
                                            </v-btn>
                                        </v-card-text>
                                    </v-card> -->
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
            </template>

            <template v-slot:bottom></template>
        </v-data-table>
    </div>

    <v-dialog v-model="editerDialog" persistent max-width="750px" transition="fab-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>Editer</h3>
            </v-card-title>
            <v-card-text>
                <v-text-field variant="outlined" label="temps"></v-text-field>
            </v-card-text>
            <v-card-actions class="d-flex justify-end">
                <v-btn @click="editerDialog = !editerDialog">fermer</v-btn>
                <v-btn>ok</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

    <v-dialog v-model="ajouterDialog" persistent max-width="750px" transition="slide-y-reverse-transition">
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

<style>
.empty-cell-width {
    width: 250px;
    /* height: 124px; */
}

.cellule-hover:hover {
    background-color: #f0f0f0;
}
</style>
