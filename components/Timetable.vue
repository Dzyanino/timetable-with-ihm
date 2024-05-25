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

const joursSemaine = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"];
const dateActuelle = ref(new Date());
const debutSemaine = ref(null);
const finSemaine = ref(null);

const debutLisible = ref("-");
const finLisible = ref("-");

const niveaux = ["L1", "L2", "L3", "M1", "M2"];
let indexNiveau = 0;
const niveau = ref(niveaux[indexNiveau]);

const classes = ref([]);
const elementsNonFiltres = ref([]);
const elements = ref([]);
const unites = ref([]);
const enseignants = ref([]);
const salles = ref([]);

const edtChoisi = ref(null);
const classeChoisie = ref(null);
const elementChoisi = ref(null);
const uniteChoisie = ref(null);
const enseignantChoisi = ref(null);
const salleChoisie = ref(null);
const dateChoisie = ref(null);

const tableLoading = ref(false);
// const datePickerMenu = ref(false);
const editerDialog = ref(false);
const ajouterDialog = ref(false);
// CONSTANTES ----------------------------------------------------------------------------------





// MADE FONCTIONS -----------------------------------------------------------------------------------
const comparerArray = (arr1, arr2) => {
  /*   (array1 === array2) ?   */
  return ((arr1.length === arr2.length) && arr1.every((element, index) => element === arr2[index]));
};
const transformerArray = (data) => {
  /*   Data ==> Data[]   */
  const tableau = Object.values(data);
  return tableau;
};


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
        CodesClasses: [actuelle.CodeClasse],
        Classe: [
          (actuelle.appelationparcours || "") + ((!!actuelle.appelationparcours && !!actuelle.CodeGroupe) ? " " : "") + (actuelle.CodeGroupe || ""),
        ],
      };
    } else if (actuelle.CodeParcours === donneesExistantes.CodeParcours) {
      donneesExistantes.AllNumeroEdt = [
        donneesExistantes.NumeroEdt,
        actuelle.NumeroEdt,
      ];
      donneesExistantes.CodesClasses = [donneesExistantes.CodeClasse, actuelle.CodeClasse];
      donneesExistantes.Classe[donneesExistantes.Classe.length - 1] =
        donneesExistantes.Classe[donneesExistantes.Classe.length - 1] +
        "/" +
        actuelle.CodeGroupe;
    } else {
      accumulee[key] = {
        AllNumeroEdt: [donneesExistantes.NumeroEdt, actuelle.NumeroEdt],
        ...actuelle,
        CodesClasses: [donneesExistantes.CodeClasse, actuelle.CodeClasse],
        Classe: [
          (donneesExistantes.appelationparcours || "") + ((!!donneesExistantes.appelationparcours && !!donneesExistantes.CodeGroupe) ? " " : "") + (donneesExistantes.CodeGroupe || ""),
          (actuelle.appelationparcours || "") + ((!!actuelle.appelationparcours && !!actuelle.CodeGroupe) ? " " : "") + (actuelle.CodeGroupe || ""),
        ],
      };
    }

    return accumulee;
  }, {});

  return transformerArray(dataFusionnee);
};
const remplirTableItems = async (data) => {
  /*   tableItems[] ==> tableItems[...]   */
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
  /*   BDD[...] ==> edt[...]   */
  tableLoading.value = true;
  const { edt_ } = await $fetch("/api/edt_", {
    method: "POST",
    body: {
      niveau: niveau.value,
      debutSemaine: formatterDate(debutSemaine.value),
      finSemaine: formatterDate(finSemaine.value),
    },
  });
  setTimeout(async () => {
    await remplirTableItems(await fusionnerSimilaire(edt_));
    tableLoading.value = false;
  }, 750)
};
const retrieveMainData = async () => {
  /*   Retrieve EDT   */
  prendreSemaine(dateActuelle.value);
  debutLisible.value = dateLisible(debutSemaine.value);
  finLisible.value = dateLisible(finSemaine.value);

  await initDonnees();
}


const nommerClasse = async (data) => {
  /*   [L1, IG, Gr1] ==> [L1 IG Gr1]   */
  const classeNommee = await data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.CodeClasse}`;

    accumulee[key] = {
      ...actuelle,
      Titre: {
        title: (actuelle.Abbreviation || "") + ((!!actuelle.Abbreviation && !!actuelle.CodeGroupe) ? " " : "") + (actuelle.CodeGroupe || ""),
        subtitle: actuelle.CodeNiveau,
      },
    };

    return accumulee;
  }, {});

  return transformerArray(classeNommee);
};
const nommerUnite = async (data) => {
  /*   [Electroniques, L1] ==> [Electronique L1]   */
  const uniteNomme = await data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.CodeUnite}`;

    accumulee[key] = {
      ...actuelle,
      Titre: {
        title: (actuelle.Designation || ""),
        subtitle: (actuelle.Niveau || ""),
      },
    };

    return accumulee;
  }, {});

  return transformerArray(uniteNomme);
};
const nommerElement = async (data) => {
  /*   [Genie Logiciel, GLog] ==> [Glog - Genie Logiciel]   */
  const elementNomme = await data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.CodeElement}`;

    accumulee[key] = {
      ...actuelle,
      Titre: {
        title: (actuelle.Appelation || ""),
        subtitle: (actuelle.Designation || ""),
      },
    };

    return accumulee;
  }, {});

  return transformerArray(elementNomme);
};
const nommerEnseignant = async (data) => {
  /*   [Gilante GESAZAFY, Gilante] ==> [Gilante GESAZAFY - Gilante]   */
  const enseignantNomme = await data.reduce((accumulee, actuelle) => {
    const key = `${actuelle.IdEnseignant}`;

    accumulee[key] = {
      ...actuelle,
      Titre: {
        title: (actuelle.Appelation || ""),
        subtitle: (actuelle.Nom || "") + ((!!actuelle.Nom && !!actuelle.Prenom) ? " " : "") + (actuelle.Prenom || ""),
      },
    };

    return accumulee;
  }, {});

  return transformerArray(enseignantNomme);
};
const retrieveOtherData = async () => {
  const { classe_ } = await $fetch("/api/classe_", {
    method: "POST",
    body: {
      niveau: niveau.value,
    },
  });

  const { unite } = await $fetch("/api/unite", {
    method: "POST",
    body: {
      niveau: niveau.value,
    },
  });

  const { element } = await $fetch("/api/element", {
    method: "POST",
  });

  const { enseignant } = await $fetch("/api/enseignant", {
    method: "POST",
  });

  const { salle } = await $fetch("/api/salle", {
    method: "POST",
  });

  classes.value = await nommerClasse(classe_);
  unites.value = await nommerUnite(unite);
  elementsNonFiltres.value = await nommerElement(element);
  enseignants.value = await nommerEnseignant(enseignant);
  salles.value = salle;
};


const changerNiveau = async (sens) => {
  /* L1 => L2 => L3 => ... */
  if (sens == "plus") {
    (indexNiveau >= 4) ? indexNiveau = 0 : indexNiveau++;
    niveau.value = niveaux[indexNiveau];
  }
  else if (sens == "moins") {
    (indexNiveau <= 0) ? indexNiveau = 4 : indexNiveau--;
    niveau.value = niveaux[indexNiveau];
  }

  await initDonnees();
  await retrieveOtherData();
};
const changerSemaine = async (sens) => {
  /* dateActuelle +/- 7  */
  if (sens == "plus") {
    dateActuelle.value.setDate(dateActuelle.value.getDate() + 7);
  }
  else if (sens == "moins") {
    dateActuelle.value.setDate(dateActuelle.value.getDate() - 7);
  }
  await retrieveMainData();
};


const varierElement = () => {
  elements.value = elementsNonFiltres.value.filter((ele) => {
    return uniteChoisie.value == ele.CodeUnite;
  });
};
const afficherEditerDialog = (jour, heure, numero) => {
  const choosen = tableItems.value[0].jours[joursSemaine[new Date(jour).getDay() - 1]][heure][0].filter((ele) => {
    return comparerArray(ele.AllNumeroEdt, numero);
  });

  const element = elementsNonFiltres.value.filter((ele) => ele.CodeElement == choosen[0].CodeElement);
  const unite = unites.value.filter((uni) => uni.CodeUnite == element[0].CodeUnite);

  uniteChoisie.value = unite[0].CodeUnite;
  varierElement();

  edtChoisi.value = choosen[0].AllNumeroEdt;
  classeChoisie.value = choosen[0].CodesClasses;
  elementChoisi.value = element[0].CodeElement;
  enseignantChoisi.value = choosen[0].IdEnseignant;
  salleChoisie.value = choosen[0].NumeroSalle;
  dateChoisie.value = new Date(choosen[0].Date);

  editerDialog.value = !editerDialog.value;
};

const editerEdt = async () => {
  const editer = await $fetch("/api/actions/edit_edt", {
    method: "POST",
    body: {
      numero: edtChoisi.value,
      classe: classeChoisie.value,
      element: elementChoisi.value,
      enseignant: enseignantChoisi.value,
      salle: salleChoisie.value,
      date: dateChoisie.value,
    }
  });
  console.log(editer);
}
// MADE FONCTIONS -----------------------------------------------------------------------------------




// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
onBeforeMount(async () => {
  await retrieveMainData();
  await retrieveOtherData();
});
// onMounted(async () => {
// });
// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
</script>

<template>
  <div>
    <v-row class="bg-white border rounded-lg mx-auto">

      <v-col cols="12" sm="2"
        class="text-center text-overline text-md-button d-flex flex-row align-center justify-space-around">
        <v-btn variant="text" icon="mdi-chevron-left" :disabled="indexNiveau == 0" @click="changerNiveau('moins')" />
        <h2 class="flex-grow-1">{{ niveau }}</h2>
        <v-btn variant="text" icon="mdi-chevron-right" :disabled="indexNiveau == (niveaux.length - 1)"
          @click="changerNiveau('plus')" />
      </v-col>

      <v-col cols="12" sm="7" class="d-flex flex-row align-center justify-space-around">
        <v-btn variant="text" icon="mdi-chevron-left" @click="changerSemaine('moins')" />
        <ClientOnly>
          <div
            class="flex-grow-1 text-center text-overline text-md-button d-flex flex-column flex-md-row align-center justify-space-evenly">
            <h2>
              {{ debutLisible }}
              <span v-if="debutSemaine.getFullYear() != finSemaine.getFullYear()">
                {{ " " + debutSemaine.getFullYear() }}
              </span>
            </h2>
            <h2>-</h2>
            <h2>{{ finLisible }}<span>{{ " " + finSemaine.getFullYear() }}</span></h2>
          </div>
        </ClientOnly>
        <v-btn variant="text" icon="mdi-chevron-right" @click="changerSemaine('plus')" />
      </v-col>

      <!-- <v-col cols="12" sm="2">
        <v-select model-value="dateActuelle" density="compact" variant="outlined" @click="datePickerMenu = !datePickerMenu">
        </v-select>
        <v-menu v-model="datePickerMenu" class="align-center justify-center">
          <v-date-picker v-model="dateActuelle"></v-date-picker>
        </v-menu>
      </v-col> -->
      <v-col cols="12" sm="1">
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
                  <div class="d-flex flex-row align-stretch justify-space-evenly empty-cell-width">
                    <ClientOnly>
                      <template v-if="item.jours[jour][index + 1][0].length > 0">
                        <template v-for="horaire in item.jours[jour][index + 1][0]" :key="horaire.NumeroEdt">
                          <v-card hover flat class="flex-grow-1 rounded-0" height="100%"
                            @click="afficherEditerDialog(horaire.Date, horaire.Horaire, horaire.AllNumeroEdt)">
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

  <v-dialog v-model="editerDialog" persistent max-width="750px" transition="scroll-y-reverse-transition">
    <v-card>
      <v-card-title class="text-button">
        <h3>Editer</h3>
      </v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="12" md="5">
            <v-autocomplete v-model="classeChoisie" :items="classes" item-props="Titre" item-value="CodeClasse"
              variant="outlined" multiple chips auto-select-first clear-on-select no-data-text="Vide..."
              label="Classe" />
          </v-col>
          <v-col cols="12" md="7">
            <v-date-picker v-model="dateChoisie" :landscape="true" :reactive="true"></v-date-picker>
          </v-col>
          <v-col cols="12">
            <v-autocomplete v-model="uniteChoisie" :items="unites" item-props="Titre" item-value="CodeUnite"
              variant="outlined" auto-select-first no-data-text="Vide..." label="Unité d'enseignement"
              @click="elementChoisi = null" @update:model-value="varierElement" />
          </v-col>
          <v-col cols="12">
            <v-autocomplete :disabled="(uniteChoisie == null)" v-model="elementChoisi" :items="elements"
              item-props="Titre" item-value="CodeElement" variant="outlined" auto-select-first no-data-text="Vide..."
              label="Element constitutif" />
          </v-col>
          <v-col cols="12" md="8">
            <v-autocomplete v-model="enseignantChoisi" :items="enseignants" item-props="Titre" item-value="IdEnseignant"
              variant="outlined" auto-select-first no-data-text="Vide..." label="Enseignant" />
          </v-col>
          <v-col cols="12" md="4">
            <v-autocomplete v-model="salleChoisie" :items="salles" item-title="NumeroSalle" item-value="NumeroSalle"
              variant="outlined" auto-select-first no-data-text="Vide..." label="Salle" />
          </v-col>
        </v-row>
      </v-card-text>
      <v-card-actions class="d-flex justify-end">
        <v-btn @click="editerDialog = !editerDialog">fermer</v-btn>
        <v-btn @click="editerEdt">ok</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>

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
