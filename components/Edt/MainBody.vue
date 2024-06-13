<script setup>
// CONSTANTES ----------------------------------------------------------------------------------
const tableHeaders = [
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
];
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

const journaux = ref({
    joursSemaine: ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
    dateActuelle: new Date(),
    debutSemaine: null,
    finSemaine: null,
    debutLisible: "-",
    finLisible: "-",
})

let indexNiveau = 0;
const niveaux = ["L1", "L2", "L3", "M1", "M2"];
const horaires = { "07:30 - 09:00": 1, "09:00 - 10:30": 2, "10:30 - 12:00": 3, "13:30 - 15:00": 4, "15:00 - 16:30": 5, "16:30 - 18:00": 6 }
const niveau = ref(niveaux[indexNiveau]);

const elementsNonFiltres = ref([]);
const allData = ref({
    classes: [],
    elements: [],
    unites: [],
    enseignants: [],
    salles: [],
    horaires: tableItems.value[0].heures,
});

const edtChoisi = ref(null);
const choosenOne = ref({
    classeChoisie: null,
    elementChoisi: null,
    uniteChoisie: null,
    enseignantChoisi: null,
    salleChoisie: null,
    dateChoisie: null,
    dateChoisieFull: null,
    horaireChoisi: null,
});

const addOne = ref({
    classeChoisie: null,
    elementChoisi: null,
    uniteChoisie: null,
    enseignantChoisi: null,
    salleChoisie: null,
    dateChoisie: null,
    dateChoisieFull: null,
    horaireChoisi: null,
});

const tableLoading = ref(true);
const sure = ref(false);
const editerDialog = ref(false);
const ajouterDialog = ref(false);

const snackbarProps = ref({
    seen: false,
    color: "primary",
    message: ""
});
const notifProps = ref({
    seen: false,
    titre: "",
    message: ""
});


const pdfSection = ref(null);

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

    journaux.value.debutSemaine = new Date(actualDate);
    journaux.value.debutSemaine.setDate(actualDate.getDate() - numeroJour.value + 1);

    journaux.value.finSemaine = new Date(actualDate);
    journaux.value.finSemaine.setDate(actualDate.getDate() + (6 - numeroJour.value));
};
const dateLisible = (date) => {
    /*   DD MMMM   */
    if (!!date) {
        const options = { month: "long", day: "numeric" };//year: "numeric", 
        return date.toLocaleString("fr-FR", options);
    }
    else return 'DD MMMM';
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
const initDonnees = useDebounce(async () => {
    /*   BDD[...] ==> edt[...]   */
    tableLoading.value = true;
    const { view_edt } = await $fetch("/api/views/v-edt", {
        method: "POST",
        body: {
            niveau: niveau.value,
            debutSemaine: formatterDate(journaux.value.debutSemaine),
            finSemaine: formatterDate(journaux.value.finSemaine),
        },
    });
    if (!!view_edt) {
        setTimeout(async () => {
            await remplirTableItems(await fusionnerSimilaire(view_edt));
            tableLoading.value = false;
        }, 750);
    }
}, 1000);
const retrieveMainData = async () => {
    /*   Retrieve EDT   */
    prendreSemaine(journaux.value.dateActuelle);
    journaux.value.debutLisible = dateLisible(journaux.value.debutSemaine);
    journaux.value.finLisible = dateLisible(journaux.value.finSemaine);
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
const retrieveOtherData = useDebounce(async () => {
    const { view_classe } = await $fetch("/api/views/v-classe", {
        method: "POST",
        body: {
            niveau: niveau.value,
        },
    });

    const { unite } = await $fetch("/api/data/unite", {
        method: "POST",
        body: {
            niveau: niveau.value,
        },
    });

    const { element } = await $fetch("/api/data/element", {
        method: "POST",
    });

    const { enseignant } = await $fetch("/api/data/enseignant", {
        method: "POST",
    });

    const { salle } = await $fetch("/api/data/salle", {
        method: "POST",
    });

    allData.value.classes = await nommerClasse(view_classe);
    allData.value.unites = await nommerUnite(unite);
    elementsNonFiltres.value = await nommerElement(element);
    allData.value.enseignants = await nommerEnseignant(enseignant);
    allData.value.salles = salle;
}, 500);


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
        journaux.value.dateActuelle.setDate(journaux.value.dateActuelle.getDate() + 7);
    }
    else if (sens == "moins") {
        journaux.value.dateActuelle.setDate(journaux.value.dateActuelle.getDate() - 7);
    }
    await retrieveMainData();
};


const varierElement = () => {
    if (editerDialog.value == true) {
        allData.value.elements = elementsNonFiltres.value.filter((ele) => {
            return choosenOne.value.uniteChoisie == ele.CodeUnite;
        });
        choosenOne.value.elementChoisi = null
    }
    else if (ajouterDialog.value == true) {
        allData.value.elements = elementsNonFiltres.value.filter((ele) => {
            return addOne.value.uniteChoisie == ele.CodeUnite;
        });
        addOne.value.elementChoisi = null
    }
};
const afficherEditerDialog = (jour, heure, numero) => {
    const choosen = tableItems.value[0].jours[journaux.value.joursSemaine[new Date(jour).getDay() - 1]][heure][0].filter((ele) => {
        return comparerArray(ele.AllNumeroEdt, numero);
    });

    const element = elementsNonFiltres.value.filter((ele) => ele.CodeElement == choosen[0].CodeElement);
    const unite = allData.value.unites.filter((uni) => uni.CodeUnite == element[0].CodeUnite);

    choosenOne.value.uniteChoisie = unite[0].CodeUnite;
    varierElement();

    edtChoisi.value = choosen[0].AllNumeroEdt;
    choosenOne.value.classeChoisie = choosen[0].CodesClasses;
    choosenOne.value.elementChoisi = element[0].CodeElement;
    choosenOne.value.enseignantChoisi = choosen[0].IdEnseignant;
    choosenOne.value.salleChoisie = choosen[0].NumeroSalle;
    choosenOne.value.dateChoisie = choosen[0].Date;
    choosenOne.value.dateChoisieFull = new Date(choosenOne.value.dateChoisie);
    choosenOne.value.horaireChoisi = tableItems.value[0].heures[choosen[0].Horaire - 1];

    editerDialog.value = !editerDialog.value;
};

const dbCompatibleDate = (date) => {
    const compatibleDate = [date.getFullYear(), (date.getMonth() + 1).toString().padStart(2, "0"), date.getDate()];
    return compatibleDate.join("-");
};


const editerEdt = async () => {
    const chemin = choosenOne.value.classeChoisie.length < edtChoisi.value.length ? "edt_edit_delete" : choosenOne.value.classeChoisie.length > edtChoisi.value.length ? "edt_edit_add" : "edt_edit";

    const editer = await $fetch("/api/actions/edt/" + chemin, {
        method: "POST",
        body: {
            numero: edtChoisi.value,
            classe: choosenOne.value.classeChoisie,
            element: choosenOne.value.elementChoisi,
            enseignant: choosenOne.value.enseignantChoisi,
            salle: choosenOne.value.salleChoisie,
            date: dbCompatibleDate(choosenOne.value.dateChoisieFull),
            horaire: horaires[choosenOne.value.horaireChoisi],
        }
    });

    editerDialog.value = false;

    if (editer[0] != null) {
        notifProps.value.titre = "Erreur";
        notifProps.value.message = "Une erreur est survenue. Veuillez réessayer";
        notifProps.value.seen = true;
    } else {
        snackbarProps.value.message = "Modification effectuée";
        snackbarProps.value.color = "success"
        snackbarProps.value.seen = true;

        setTimeout(async () => { await initDonnees() }, 250);
    }
};
const ajouterEdt = async () => {
    const ajouter = await $fetch("/api/actions/edt/edt_add", {
        method: "POST",
        body: {
            classe: addOne.value.classeChoisie,
            element: addOne.value.elementChoisi,
            enseignant: addOne.value.enseignantChoisi,
            salle: addOne.value.salleChoisie,
            date: dbCompatibleDate(addOne.value.dateChoisieFull),
            horaire: horaires[addOne.value.horaireChoisi],
        }
    });

    ajouterDialog.value = false;

    if (ajouter[0] != null) {
        notifProps.value.titre = "Erreur";
        notifProps.value.message = "Une erreur est survenue. Veuillez réessayer";
        notifProps.value.seen = true;
    } else {
        snackbarProps.value.message = "Cours ajouté";
        snackbarProps.value.color = "success"
        snackbarProps.value.seen = true;

        setTimeout(async () => { await initDonnees() }, 250);
    }
};
const supprimerEdt = async () => {
    const supprimer = await $fetch("/api/actions/edt/edt_delete", {
        method: "POST",
        body: {
            numero: edtChoisi.value,
        }
    });

    sure.value = false;
    editerDialog.value = false;

    if (supprimer[0] != null) {
        notifProps.value.titre = "Erreur";
        notifProps.value.message = "Une erreur est survenue. Veuillez réessayer";
        notifProps.value.seen = true;
    } else {
        snackbarProps.value.message = "Cours supprimé";
        snackbarProps.value.color = "success"
        snackbarProps.value.seen = true;

        setTimeout(async () => { await initDonnees() }, 250);
    }
}

const viderAjoutDialog = () => {
    addOne.value.classeChoisie = null
    addOne.value.elementChoisi = null
    addOne.value.uniteChoisie = null
    addOne.value.enseignantChoisi = null
    addOne.value.salleChoisie = null
    addOne.value.dateChoisie = null
    addOne.value.dateChoisieFull = null
    addOne.value.horaireChoisi = null

    ajouterDialog.value = false;
}
// MADE FONCTIONS -----------------------------------------------------------------------------------




// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
onBeforeMount(async () => {
    await retrieveMainData();
    await retrieveOtherData();
});
// BUILT-IN FUNCTION -----------------------------------------------------------------------------------
</script>

<template>
    <div>
        <v-row class="bg-white border rounded-lg mx-auto align-center">

            <v-col cols="12" sm="2"
                class="text-center text-overline text-md-button d-flex flex-row align-center justify-space-around">
                <v-btn variant="text" icon="mdi-chevron-left" :disabled="indexNiveau == 0"
                    @click="changerNiveau('moins')" />
                <h2 class="flex-grow-1">{{ niveau }}</h2>
                <v-btn variant="text" icon="mdi-chevron-right" :disabled="indexNiveau == (niveaux.length - 1)"
                    @click="changerNiveau('plus')" />
            </v-col>

            <v-col cols="12" sm="7" class="d-flex flex-row align-center justify-space-around">
                <v-btn variant="text" icon="mdi-chevron-left" @click="changerSemaine('moins')" />
                <div
                    class="flex-grow-1 text-center text-overline text-md-button d-flex flex-column flex-md-row align-center justify-space-evenly">
                    <ClientOnly>
                        <h2>
                            {{ journaux.debutLisible }}
                            <span v-if="journaux.debutSemaine.getFullYear() != journaux.finSemaine.getFullYear()">
                                {{ " " + journaux.debutSemaine.getFullYear() }}
                            </span>
                        </h2>
                        <h2>-</h2>
                        <h2>{{ journaux.finLisible }}<span>{{ " " + journaux.finSemaine.getFullYear() }}</span></h2>
                    </ClientOnly>
                </div>
                <v-btn variant="text" icon="mdi-chevron-right" @click="changerSemaine('plus')" />
            </v-col>

            <!-- <v-col cols="12" sm="2">
        <v-select model-value="dateActuelle" density="compact" variant="outlined" density="default" @click="datePickerMenu = !datePickerMenu">
        </v-select>
        <v-menu v-model="datePickerMenu" class="align-center justify-center">
          <v-date-picker v-model="dateActuelle"></v-date-picker>
        </v-menu>
      </v-col> -->
            <v-col cols="12" sm="1">
                <v-btn color="secondary" size="small" @click="ajouterDialog = !ajouterDialog">Ajouter</v-btn>
            </v-col>

            <v-col cols="12" sm="1">
                <v-btn color="primary" size="small" @click="exportToPDF(
                    `${niveau}-${journaux.debutLisible}-${journaux.finLisible}.pdf`,
                    pdfSection, { orientation: 'l', unit: 'pt', format: 'a2' })">
                    Exporter
                </v-btn>
            </v-col>
        </v-row>
        <v-row>

            <v-col cols="12">
                <div ref="pdfSection">
                    <v-data-table :loading="tableLoading" loading-text="aksdjfjaklsdjf" :headers="tableHeaders"
                        :items="tableItems" class="border-t border-e border-b rounded mb-4" color="green">

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

                                <template v-for="jour in journaux.joursSemaine" :key="jour">
                                    <td class="border-s bg-grey-lighten-5 pa-0">
                                        <div
                                            class="d-flex flex-row align-stretch justify-space-evenly empty-cell-width">
                                            <ClientOnly>
                                                <template v-if="item.jours[jour][index + 1][0].length > 0">
                                                    <template v-for="horaire in item.jours[jour][index + 1][0]"
                                                        :key="horaire.NumeroEdt">
                                                        <v-card hover flat class="flex-grow-1 rounded-0"
                                                            @click="afficherEditerDialog(horaire.Date, horaire.Horaire, horaire.AllNumeroEdt)">
                                                            <v-card-title
                                                                class="d-flex align-center justify-center text-body-1 font-weight-light">
                                                                <template v-for="(classe, occ) in horaire.Classe"
                                                                    :key="occ">
                                                                    <template v-if="occ == 0">
                                                                        <span>{{ classe }}</span>
                                                                    </template>
                                                                    <template v-else>
                                                                        <span>-</span>
                                                                        <span>{{ classe }}</span>
                                                                    </template>
                                                                </template>
                                                            </v-card-title>

                                                            <v-card-text
                                                                class="d-flex flex-column align-center justify-center text-wrap">
                                                                <span
                                                                    class="text-center text-uppercase font-weight-bold">
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
                </div>
            </v-col>
        </v-row>

    </div>

    <EdtDialogEdit v-model="editerDialog" :all-data="allData" :choosed="choosenOne" @varier-element="varierElement"
        @close-dialog="editerDialog = !editerDialog" @editer-edt="editerEdt" @supprimer-edt="sure = !sure" />

    <EdtDialogAjout v-model="ajouterDialog" :all-data="allData" :choosed="addOne" @varier-element="varierElement"
        @close-dialog="viderAjoutDialog()" @add-edt="ajouterEdt" />

    <v-dialog v-model="sure" persistent max-width="550px" transition="scroll-y-reverse-transition">
        <v-card>
            <v-card-title class="text-button">
                <h3>Attention</h3>
            </v-card-title>
            <v-card-text>
                <span>Etes-vous sûr(e) ?</span>
            </v-card-text>
            <v-card-actions>
                <v-btn @click="sure = false">Annuler</v-btn>
                <v-btn @click="supprimerEdt">Ok</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

    <FeedSnack :model-value="snackbarProps.seen" :message="snackbarProps.message" :color="snackbarProps.color"
        @close="snackbarProps.seen = !snackbarProps.seen" />

    <FeedDialog v-model="notifProps.seen" :titre="notifProps.titre" :message="notifProps.message"
        @close-dialog="notifProps.seen = !notifProps.seen" />
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
