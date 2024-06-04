<script setup>
//PROPS-------------------------------
const props = defineProps({
    indexNiveau: {
        type: Number,
        required: true
    },
    niveauxLength: {
        type: Number,
        required: true
    },
    niveau: {
        type: String,
        required: true
    },
    debutSemaine: {
        required: true,
        default: new Date()
    },
    finSemaine: {
        required: true,
        default: new Date()
    }
});


//CONSTANTS----------------------------
const emit = defineEmits(['niveauMoins', 'niveauPlus', 'semaineMoins', 'semainePlus'])
const debutLisible = ref("-");
const finLisible = ref("-");


// FUNCTIONS---------------------------
const dateLisible = (date) => {
    /*   DD MMMM   */
    if (!!date) {
        const options = { month: "long", day: "numeric" };//year: "numeric", 
        return date.toLocaleString("fr-FR", options);
    }
    else return 'DD MMMM';
};

const formatterDate = () => {
    debutLisible.value = dateLisible(props.debutSemaine);
    finLisible.value = dateLisible(props.finSemaine);
}

const changer = (sens) => {
    if (sens === "moins") {
        emit('semaineMoins');
    }
    else if (sens === "plus") {
        emit('semainePlus');
    }
    formatterDate();
}

onBeforeMount(() => {
    formatterDate()
})
</script>

<template>
    <v-row class="bg-white border rounded-lg mx-auto">

        <v-col cols="12" sm="2"
            class="text-center text-overline text-md-button d-flex flex-row align-center justify-space-around">
            <v-btn variant="text" icon="mdi-chevron-left" :disabled="props.indexNiveau == 0"
                @click="$emit('niveauMoins')" />
            <h2 class="flex-grow-1">{{ props.niveau }}</h2>
            <v-btn variant="text" icon="mdi-chevron-right" :disabled="props.indexNiveau == (props.niveauxLength - 1)"
                @click="$emit('niveauPlus')" />
        </v-col>

        <v-col cols="12" sm="7" class="d-flex flex-row align-center justify-space-around">
            <v-btn variant="text" icon="mdi-chevron-left" @click="changer('moins')" />
            <ClientOnly>
                <div
                    class="flex-grow-1 text-center text-overline text-md-button d-flex flex-column flex-md-row align-center justify-space-evenly">
                    <h2>
                        {{ debutLisible }}
                        <span v-if="props.debutSemaine.getFullYear() != props.finSemaine.getFullYear()">
                            {{ " " + props.debutSemaine.getFullYear() }}
                        </span>
                    </h2>
                    <h2>-</h2>
                    <h2>{{ finLisible }}<span>{{ " " + props.finSemaine.getFullYear() }}</span></h2>
                </div>
            </ClientOnly>
            <v-btn variant="text" icon="mdi-chevron-right" @click="changer('plus')" />
        </v-col>

        <!-- <v-col cols="12" sm="2">
        <v-select model-value="dateActuelle" density="compact" variant="outlined" density="default" @click="datePickerMenu = !datePickerMenu">
        </v-select>
        <v-menu v-model="datePickerMenu" class="align-center justify-center">
          <v-date-picker v-model="dateActuelle"></v-date-picker>
        </v-menu>
      </v-col> -->
        <v-col cols="12" sm="1">
            <v-btn color="success">Ajouter</v-btn>
        </v-col>

    </v-row>
</template>