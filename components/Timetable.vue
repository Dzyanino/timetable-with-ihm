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
    jours: {
      lundi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
      mardi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
      mercredi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
      jeudi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
      vendredi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
      samedi: {
        prem: [],
        deux: [],
        trois: [],
        quatre: [],
        cinq: [],
        six: [],
      },
    },
  },
]);

const joursSemaine = [
  "lundi",
  "mardi",
  "mercredi",
  "jeudi",
  "vendredi",
  "samedi",
];
const dateActuelle = ref(new Date("2024-04-25"));
const debutSemaine = ref(null);
const finSemaine = ref(null);

const debutLisible = ref("-");
const finLisible = ref("-");

const niveau = ref("L2");

const editerDialog = ref(false);
const ajouterDialog = ref(false);
// CONSTANTES ----------------------------------------------------------------------------------
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// MADE FONCTIONS -----------------------------------------------------------------------------------
const dateLisible = (date) => {
  /*   DD MMMM   */
  const options = { year: "numeric", month: "long", day: "numeric" };
  return date.toLocaleString("fr-FR", options);
};

const formatterDate = (date) => {
  /*   YYYY-MM-DD  */
  const annee = date.getFullYear();
  const mois = (date.getMonth() + 1).toString().padStart(2, "0");
  const jour = date.getDate().toString().padStart(2, "0");

  return annee + "-" + mois + "-" + jour;
};

const prendreSemaine = (actualDate) => {
  const numeroJour = ref(actualDate.getDay());

  debutSemaine.value = new Date(actualDate);
  debutSemaine.value.setDate(actualDate.getDate() - numeroJour.value + 1);

  finSemaine.value = new Date(actualDate);
  finSemaine.value.setDate(actualDate.getDate() + (6 - numeroJour.value));
};

const fusionnerSimilaire = (data) => {
  const dataFusionnee = data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.Date}-${actuelle.Horaire}-${actuelle.NumeroSalle}-${actuelle.IdEnseignant}-${actuelle.CodeElement}`;
    const donneesExistantes = accumulee[key];

    if (!donneesExistantes) {
      accumulee[key] = {
        NumeroEdt: [actuelle.NumeroEdt],
        ...actuelle,
        Classe: [
          actuelle.appelationparcours +
            (actuelle.CodeGroupe == null ? "" : " " + actuelle.CodeGroupe),
        ],
      };
    } else if (actuelle.CodeParcours === donneesExistantes.CodeParcours) {
      donneesExistantes.NumeroEdt = [
        donneesExistantes.NumeroEdt,
        actuelle.NumeroEdt,
      ];
      donneesExistantes.Classe[donneesExistantes.Classe.length - 1] =
        donneesExistantes.Classe[donneesExistantes.Classe.length - 1] +
        "/" +
        actuelle.CodeGroupe;
    } else {
      accumulee[key] = {
        NumeroEdt: [donneesExistantes.NumeroEdt, actuelle.NumeroEdt],
        ...actuelle,
        Classe: [
          donneesExistantes.appelationparcours +
            (donneesExistantes.CodeGroupe == null
              ? ""
              : " " + donneesExistantes.CodeGroupe),
          actuelle.appelationparcours +
            (actuelle.CodeGroupe == null ? "" : " " + actuelle.CodeGroupe),
        ],
      };
    }

    return accumulee;
  }, {});

  return dataFusionnee;
};

const transformerDonnees = (data) => {
  const matin = data.filter((edt) => edt.Horaire < 4);
  const aprem = data.filter((edt) => edt.Horaire >= 4);

  const matinFusionne = Object.values(fusionnerSimilaire(matin));
  const apremFusionne = Object.values(fusionnerSimilaire(aprem));

  console.log(matinFusionne);
  console.log(apremFusionne);
};

const initDonnees = async () => {
  const { edt } = await $fetch("/api/edt", {
    method: "POST",
    body: {
      niveau: niveau.value,
      debutSemaine: formatterDate(debutSemaine.value),
      finSemaine: formatterDate(finSemaine.value),
    },
  });
  transformerDonnees(edt);
};
// MADE FONCTIONS -----------------------------------------------------------------------------------

onBeforeMount(() => {
  prendreSemaine(dateActuelle.value);
  debutLisible.value = dateLisible(debutSemaine.value);
  finLisible.value = dateLisible(finSemaine.value);
});
onMounted(async () => {
  await initDonnees();
});
</script>

<template>
  <div>
    <v-row class="border-lg rounded-lg">
      <v-col cols="12" sm="3" class="text-center text-overline text-md-button">
        <h2>{{ niveau }}</h2>
      </v-col>
      <v-col
        cols="12"
        sm="7"
        class="text-center text-overline text-md-button d-flex flex-column flex-sm-row align-center justify-center justify-sm-space-evenly"
      >
        <h2>{{ debutLisible }}</h2>
        <h2>-</h2>
        <h2>{{ finLisible }}</h2>
      </v-col>
      <v-col cols="12" sm="2">
        <v-btn color="success">Ajouter</v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <v-data-table
          sticky
          :headers="tableHeaders"
          :items="tableItems"
          class="border-t border-e border-b rounded mb-4"
          color="green"
        >
          <template v-slot:headers="{ columns }">
            <tr>
              <td
                class="border-s border-b text-center text-overline"
                width="75px"
              >
                #
              </td>
              <template v-for="column in columns" :key="column.key">
                <td
                  class="border-s border-b text-center text-overline"
                  width="250px"
                >
                  <span>{{ column.title }}</span>
                </td>
              </template>
            </tr>
          </template>
          <!-- dffffffffffffffffffffffffffffffffff -->

          <template v-slot:bottom></template>
        </v-data-table>
      </v-col>
    </v-row>
  </div>

  <v-dialog
    v-model="editerDialog"
    persistent
    max-width="750px"
    transition="fab-transition"
  >
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

  <v-dialog
    v-model="ajouterDialog"
    persistent
    max-width="750px"
    transition="slide-y-reverse-transition"
  >
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
  height: 124px;
}

.cellule-hover:hover {
  background-color: #f0f0f0;
}

/* 
          <template v-slot:item="{ item }">
            <tr>
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[0] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].prem.length > 0"
                      v-for="horaire in item[jour].prem"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[1] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].deux.length > 0"
                      v-for="horaire in item[jour].deux"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[2] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].trois.length > 0"
                      v-for="horaire in item[jour].trois"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[3] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].quatre.length > 0"
                      v-for="horaire in item[jour].quatre"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[4] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].cinq.length > 0"
                      v-for="horaire in item[jour].cinq"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
              <td class="border-s px-1">
                <div class="d-flex flex-row align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ item.heures[5] }}
                  </v-sheet>
                </div>
              </td>
              <template v-for="(jour, index) in joursSemaine" :key="index">
                <td class="border-s bg-grey-lighten-5 px-0">
                  <div
                    class="d-flex flex-row align-center justify-center w-100"
                  >
                    <template
                      v-if="item[jour].six.length > 0"
                      v-for="horaire in item[jour].six"
                      :key="horaire.id"
                    >
                      <v-card
                        class="elevation-0 rounded-0 cellule-hover"
                        width="100%"
                        @click="editerDialog = !editerDialog"
                      >
                        <v-card-title
                          class="d-flex align-center justify-center text-body-1 font-weight-light"
                        >
                          <template
                            v-for="(grp, index) in horaire.groupe"
                            :key="index"
                          >
                            <template v-if="index == 0">
                              <span>{{ grp }}</span>
                            </template>
                            <template v-else>
                              <span>-</span>
                              <span> {{ grp }}</span>
                            </template>
                          </template>
                        </v-card-title>

                        <v-card-text
                          class="d-flex flex-column align-center justify-center"
                        >
                          <span
                            class="text-center text-uppercase font-weight-bold"
                            >{{ horaire.matiere }}</span
                          >
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
 */
</style>
