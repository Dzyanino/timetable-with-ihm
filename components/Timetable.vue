<script setup>
// CONSTANTES ----------------------------------------------------------------------------------
const tableHeaders = ref([
  {
    title: "#",
    key: "#",
    sortable: false,
    minWidth: "75px",
  },
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
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
      },
      mardi: {
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
      },
      mercredi: {
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
      },
      jeudi: {
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
      },
      vendredi: {
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
      },
      samedi: {
        "1": [],
        "2": [],
        "3": [],
        "4": [],
        "5": [],
        "6": [],
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
const dateActuelle = ref(new Date());
const debutSemaine = ref(null);
const finSemaine = ref(null);

const debutLisible = ref("-");
const finLisible = ref("-");

const niveaux = ["L1", "L2", "L3", "M1", "M2"];
let indexNiveau = 0;
const niveau = ref(niveaux[indexNiveau]);

const editerDialog = ref(false);
const ajouterDialog = ref(false);
const tableLoading = ref(false);
// CONSTANTES ----------------------------------------------------------------------------------





// MADE FONCTIONS -----------------------------------------------------------------------------------
const dateLisible = (date) => {
  /*   DD MMMM   */
  const options = { month: "long", day: "numeric" };//year: "numeric", 
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
  /* XX XXXX - XX XXXX */
  const numeroJour = ref(actualDate.getDay());

  debutSemaine.value = new Date(actualDate);
  debutSemaine.value.setDate(actualDate.getDate() - numeroJour.value + 1);

  finSemaine.value = new Date(actualDate);
  finSemaine.value.setDate(actualDate.getDate() + (6 - numeroJour.value));
};



const fusionnerSimilaire = async (data) => {
  /* Meme cours, classes differentes */
  const dataFusionnee = await data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.Date}-${actuelle.Horaire}-${actuelle.NumeroSalle}-${actuelle.IdEnseignant}-${actuelle.CodeElement}`;
    const donneesExistantes = accumulee[key];

    if (!donneesExistantes) {
      accumulee[key] = {
        AllNumeroEdt: [actuelle.NumeroEdt],
        ...actuelle,
        Classe: [
          (actuelle.appelationparcours || "") + ((!!actuelle.appelationparcours && !!actuelle.CodeGroupe) ? " " : "") + (actuelle.CodeGroupe || ""),
        ],
      };
    } else if (actuelle.CodeParcours === donneesExistantes.CodeParcours) {
      donneesExistantes.AllNumeroEdt = [
        donneesExistantes.NumeroEdt,
        actuelle.NumeroEdt,
      ];
      donneesExistantes.Classe[donneesExistantes.Classe.length - 1] =
        donneesExistantes.Classe[donneesExistantes.Classe.length - 1] +
        "/" +
        actuelle.CodeGroupe;
    } else {
      accumulee[key] = {
        AllNumeroEdt: [donneesExistantes.NumeroEdt, actuelle.NumeroEdt],
        ...actuelle,
        Classe: [
          (donneesExistantes.appelationparcours || "") + ((!!donneesExistantes.appelationparcours && !!donneesExistantes.CodeGroupe) ? " " : "") + (donneesExistantes.CodeGroupe || ""),
          (actuelle.appelationparcours || "") + ((!!actuelle.appelationparcours && !!actuelle.CodeGroupe) ? " " : "") + (actuelle.CodeGroupe || ""),
        ],
      };
    }

    return accumulee;
  }, {});

  return dataFusionnee;
};
const transformerDonnees = async (data) => {
  const edtTransformee = Object.values(await fusionnerSimilaire(data));
  return edtTransformee;
};
const remplirTableItems = async (data) => {
  let i = 0;
  for (const jours in tableItems.value[0].jours) {
    if (Object.hasOwnProperty.call(tableItems.value[0].jours, jours)) {
      const jour = tableItems.value[0].jours[jours];
      let j = 0;

      for (const horaires in jour) {
        if (Object.hasOwnProperty.call(jour, horaires)) {
          const creneau = jour[horaires];
          creneau.length = 0;
          const edt = data.filter((ele) => {
            const day = new Date(ele.Date).getDay();
            return day == i + 1 && ele.Horaire == j + 1;
          });
          await creneau.push(edt);
          j++;
        }
      }
      i++;
    }
  }
  // console.log(tableItems.value[0].jours);
};
const initDonnees = async () => {
  tableLoading.value = true;
  const { edt } = await $fetch("/api/edt", {
    method: "POST",
    body: {
      niveau: niveau.value,
      debutSemaine: formatterDate(debutSemaine.value),
      finSemaine: formatterDate(finSemaine.value),
    },
  });
  setTimeout(async () => {
    await remplirTableItems(await transformerDonnees(edt))
    tableLoading.value = false;
  }, 750)
};


const changerNiveau = async (sens) => {
  if (sens == "plus") {
    (indexNiveau >= 4) ? indexNiveau = 0 : indexNiveau++;
    niveau.value = niveaux[indexNiveau];
  }
  else if (sens == "moins") {
    (indexNiveau <= 0) ? indexNiveau = 4 : indexNiveau--;
    niveau.value = niveaux[indexNiveau];
  }

  await initDonnees();
};
const changerSemaine = async (sens) => {
  if (sens == "plus") {
    dateActuelle.value.setDate(dateActuelle.value.getDate() + 7);
  }
  else if (sens == "moins") {
    dateActuelle.value.setDate(dateActuelle.value.getDate() - 7);
  }

  prendreSemaine(dateActuelle.value);
  debutLisible.value = dateLisible(debutSemaine.value);
  finLisible.value = dateLisible(finSemaine.value);

  await initDonnees();
};
// MADE FONCTIONS -----------------------------------------------------------------------------------




// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
onBeforeMount(async () => {
  prendreSemaine(dateActuelle.value);
  debutLisible.value = dateLisible(debutSemaine.value);
  finLisible.value = dateLisible(finSemaine.value);
  await initDonnees();
});
// onMounted(async () => {
// });
// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
</script>

<template>
  <div>
    <v-row class="bg-white border rounded-lg mx-auto">

      <v-col cols="12" sm="3"
        class="text-center text-overline text-md-button d-flex flex-row align-center justify-space-around">
        <v-btn variant="text" icon="mdi-chevron-left" @click="changerNiveau('moins')" />
        <h2>{{ niveau }}</h2>
        <v-btn variant="text" icon="mdi-chevron-right" @click="changerNiveau('plus')" />
      </v-col>

      <ClientOnly>
        <v-col cols="12" sm="7" class="d-flex flex-row align-center justify-space-around">
          <v-btn variant="text" icon="mdi-chevron-left" @click="changerSemaine('moins')" />
          <div
            class="text-center text-overline text-md-button d-flex flex-column flex-sm-row align-center justify-space-evenly">
            <h2>{{ debutLisible }}<span v-if="debutSemaine.getFullYear() != finSemaine.getFullYear()">{{ " " +
          debutSemaine.getFullYear() }}</span></h2>
            <h2>-</h2>
            <h2>{{ finLisible }}<span>{{ " " + finSemaine.getFullYear() }}</span></h2>
          </div>
          <v-btn variant="text" icon="mdi-chevron-right" @click="changerSemaine('plus')" />
        </v-col>
      </ClientOnly>

      <v-col cols="12" sm="2">
        <v-btn color="success">Ajouter</v-btn>
      </v-col>

    </v-row>
    <v-row>
      <v-col cols="12">
        <v-data-table :loading="tableLoading" loading-text="aksdjfjaklsdjf" :headers="tableHeaders" :items="tableItems"
          class="border-t border-e border-b rounded mb-4" color="green">

          <template v-slot:headers="{ columns }">
            <tr>
              <template v-for="(column, numero) in columns" :key="column.key">
                <template v-if="numero == 0">
                  <td class="border-s border-b text-center text-overline" width="75px">
                    {{ column.title }}
                  </td>
                </template>
                <template v-else>
                  <td class="border-s border-b text-center text-overline" width="250px">
                    <span>{{ column.title }}</span>
                  </td>
                </template>
              </template>
            </tr>
          </template>

          <template v-slot:item="{ item }">
            <tr v-for="(heure, index) in item.heures" :key="index">

              <td class="border-s px-1">
                <div class="d-flex align-center justify-center">
                  <v-sheet width="50px" class="text-center text-overline">
                    {{ heure }}
                  </v-sheet>
                </div>
              </td>

              <template v-for="jour in joursSemaine" :key="jour">
                <td class="border-s bg-grey-lighten-5 pa-0">
                  <div class="d-flex flex-row align-center justify-space-evenly empty-cell-width">
                    <ClientOnly>
                      <template v-if="item.jours[jour][index + 1][0].length > 0">
                        <template v-for="horaire in item.jours[jour][index + 1][0]" :key="horaire.NumeroEdt">
                          <v-card hover flat class="flex-grow-1 rounded-0" @click="editerDialog = !editerDialog">
                            <v-card-title class="d-flex align-center justify-center text-body-1 font-weight-light">
                              <template v-for="(classe, occ) in horaire.Classe" :key="occ">
                                <template v-if="occ == 0">
                                  <span>{{ classe }}</span>
                                </template>
                                <template v-else>
                                  <span>-</span>
                                  <span>{{ classe }}</span>
                                </template>
                              </template>
                            </v-card-title>

                            <v-card-text class="d-flex flex-column align-center justify-center text-wrap">
                              <span class="text-center text-uppercase font-weight-bold">
                                {{ horaire.appelationelement }}
                              </span>
                              <span>{{ horaire.appelationenseignant }}</span>
                              <span>{{ horaire.NumeroSalle }}</span>
                            </v-card-text>
                          </v-card>
                        </template>
                      </template>
                      <template v-else>
                        <div class="empty-cell-width"></div>
                      </template>
                    </ClientOnly>
                  </div>
                </td>
              </template>

            </tr>
          </template>

          <template v-slot:loading>
            <v-row>
              <v-col cols="12" class="text-center">
                <span class="text-subtitle-1">Veuillez patienter...</span>
              </v-col>
            </v-row>
          </template>

          <template v-slot:bottom></template>
        </v-data-table>
      </v-col>
    </v-row>
  </div>

  <v-dialog v-model="editerDialog" persistent max-width="750px" transition="scroll-x-reverse-transition">
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

  <v-dialog v-model="ajouterDialog" persistent max-width="750px" transition="scroll-x-reverse-transition">
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
  min-width: 250px !important;
  min-height: 124px;
}

/* .cellule-hover:hover {
  background-color: #f0f0f0;
} */

/* 
<v-card class="elevation-0 rounded-0 empty-cell-width bg-transparent">
    <v-card-text class="text-center">
        <v-btn size="small" variant="tonal" color="primary" prepend-icon="mdi-plus" @click="ajouterDialog = !ajouterDialog">
            {{ index }}
        </v-btn>
    </v-card-text>
</v-card>
 */
</style>
