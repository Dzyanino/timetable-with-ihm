<template>
    <div>
        <v-row class="py-2">
            <v-col cols="12" md="4" offset-md="2" class="text-center text-button">
                <h2>L1</h2>
            </v-col>
            <v-col cols="12" md="4" class="text-center text-button">
                <h2>15 Avril - 21 Avril</h2>
            </v-col>
        </v-row>
        <v-data-table sticky :headers="tableHeaders" :items="tableItems" class="border rounded-lg mb-4" color="green">

            <template v-slot:headers="{ columns }">
                <tr>
                    <td class="border-b text-center text-overline" width="150px">#</td>
                    <template v-for="column in columns" :key="column.key">
                        <td class="border-b text-center text-overline" width="250px">
                            <span>{{ column.title }}</span>
                        </td>
                    </template>
                </tr>
            </template>

            <template v-slot:item="{ item }">
                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[0] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].prem" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[1] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].deux" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[2] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].trois" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td colspan="7"></td>
                </tr>

                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[3] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].quatre" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[4] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].cinq" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
                <tr>
                    <td class="border-e text-center text-overline">{{ item.heures[5] }}</td>
                    <template v-for="(jour, index) in joursSemaine" :key="index">
                        <td class="border-e bg-grey-lighten-5 px-0">
                            <div class="d-flex flex-row align-center justify-center">
                                <template v-for="horaire in item[jour].six" :key="horaire.id">
                                    <v-card class="elevation-0 rounded-0">
                                        <v-card-title
                                            class="d-flex align-center justify-space-evenly font-weight-light">
                                            <template v-for="grp in horaire.groupe" :key="grp">
                                                <span>{{ grp }}</span>
                                            </template>
                                        </v-card-title>

                                        <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                            <span class="text-center text-uppercase font-weight-bold">{{ horaire.matiere }}</span>
                                            <span>{{ horaire.prof }}</span>
                                            <span>{{ horaire.salle }}</span>
                                        </v-card-text>

                                        <!-- <v-card-actions class="d-flex align-center justify-center">{{ horaire.salle
                                            }}</v-card-actions> -->
                                    </v-card>
                                </template>
                            </div>
                        </td>
                    </template>
                </tr>
            </template>

            <template v-slot:bottom></template>
        </v-data-table>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const joursSemaine = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];

const tableHeaders = ref([
    {
        title: "Lundi",
        key: "lun",
        sortable: false,
        width: "300px",
    },
    {
        title: "Mardi",
        key: "mar",
        sortable: false,
        width: "300px",
    },
    {
        title: "Mercredi",
        key: "mer",
        sortable: false,
        width: "300px",
    },
    {
        title: "Jeudi",
        key: "jeu",
        sortable: false,
        width: "300px",
    },
    {
        title: "Vendredi",
        key: "ven",
        sortable: false,
        width: "300px",
    },
    {
        title: "Samedi",
        key: "sam",
        sortable: false,
        width: "300px",
    },
])

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
                { id: 1, groupe: ["IG"], matiere: "Ass App", prof: "Michel", salle: "001" },
                { id: 2, groupe: ["GB", "ASR"], matiere: "Comptabilité", prof: "Hanta", salle: "004" },
            ],
            deux: [
                { id: 3, groupe: ["GB"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            trois: [
                { id: 3, groupe: ["ASR", "IG"], matiere: "Admin Unix", prof: "Clément", salle: "104" },
            ],
            quatre: [],
            cinq: [],
            six: [],
        },
        mardi: {
            prem: [
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
                { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            deux: [],
            trois: [
                { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
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
                { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
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
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
            cinq: [],
            six: [
                { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
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
                // { id: 5, groupe: ["IG"], matiere: "Algo", prof: "Cyprien", salle: "012" },
            ],
            cinq: [],
            six: [
                // { id: 6, groupe: ["GB", "IG"], matiere: "C#", prof: "Ferdinand", salle: "210" },
                // { id: 4, groupe: ["ASR"], matiere: "VPN", prof: "Siaka", salle: "106" },
            ],
        },
    }
])
</script>

<style>
.empty-cell-width {
    width: 250px;
}
</style>