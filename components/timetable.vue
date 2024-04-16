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
        <v-data-table sticky density="comfortable" :headers="tableHeaders" :items="tableItems" class="border rounded-lg"
            color="green">

            <template v-slot:headers="{ columns }">
                <tr>
                    <td class="border-b text-center text-overline" width="250px">#</td>
                    <template v-for="column in columns" :key="column.key">
                        <td class="border-b text-center text-overline" width="250px">
                            <span>{{ column.title }}</span>
                        </td>
                    </template>
                </tr>
            </template>

            <template v-slot:item="{ item }">

                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[0] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            
                            <template v-for="lundi in tableItems[0].lundi.prem" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.prem" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.prem" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.prem" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.prem" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.prem" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[1] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="lundi in tableItems[0].lundi.deux" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.deux" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.deux" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.deux" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.deux" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.deux" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[2] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="lundi in tableItems[0].lundi.trois" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.trois" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.trois" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.trois" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.trois" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.trois" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td colspan="7"></td>
                </tr>
                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[3] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="lundi in tableItems[0].lundi.quatre" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.quatre" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.quatre" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.quatre" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.quatre" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.quatre" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[4] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="lundi in tableItems[0].lundi.cinq" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.cinq" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.cinq" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.cinq" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.cinq" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.cinq" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td class="border-e text-center text-overline">{{ tableItems[0].heures[5] }}</td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="lundi in tableItems[0].lundi.six" :key="lundi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in lundi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ lundi.matiere }}</span>
                                        <span>{{ lundi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ lundi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mardi in tableItems[0].mardi.six" :key="mardi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mardi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mardi.matiere }}</span>
                                        <span>{{ mardi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mardi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="mercredi in tableItems[0].mercredi.six" :key="mercredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in mercredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ mercredi.matiere }}</span>
                                        <span>{{ mercredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ mercredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="jeudi in tableItems[0].jeudi.six" :key="jeudi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in jeudi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ jeudi.matiere }}</span>
                                        <span>{{ jeudi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ jeudi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="vendredi in tableItems[0].vendredi.six" :key="vendredi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in vendredi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ vendredi.matiere }}</span>
                                        <span>{{ vendredi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ vendredi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                    <td class="border-e">
                        <div class="d-flex flex-row align-center justify-center">
                            <template v-for="samedi in tableItems[0].samedi.six" :key="samedi.id">
                                <v-card class="elevation-0 rounded-0 bg-red-lighten-5">
                                    <v-card-title class="d-flex align-center justify-space-evenly font-weight-light">
                                        <template v-for="grp in samedi.groupe" :key="grp">
                                            <span>{{ grp }}</span>
                                        </template>
                                    </v-card-title>

                                    <v-card-text class="d-flex flex-column align-center justify-space-evenly">
                                        <span class="text-button">{{ samedi.matiere }}</span>
                                        <span>{{ samedi.prof }}</span>
                                    </v-card-text>

                                    <v-card-actions class="d-flex align-center justify-center">{{ samedi.salle
                                        }}</v-card-actions>

                                </v-card>
                            </template>
                        </div>
                    </td>
                </tr>

            </template>

            <template v-slot:bottom></template>
        </v-data-table>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const tableHeaders = ref([
    {
        title: "Lundi",
        key: "lun",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
    },
    {
        title: "Mardi",
        key: "mar",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
    },
    {
        title: "Mercredi",
        key: "mer",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
    },
    {
        title: "Jeudi",
        key: "jeu",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
    },
    {
        title: "Vendredi",
        key: "ven",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
    },
    {
        title: "Samedi",
        key: "sam",
        sortable: false,
        width: "300px",
        minWidth: "250px",
        maxWidth: "5000px",
        nowrap: false,
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