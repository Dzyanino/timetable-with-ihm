<template>
    <div class="my-2 md:my-4 lg:my-6">
        <UTable :columns="tableColumns" :rows="tableRows" class="border rounded-md">
            <template #heures-data>
                <div class="py-4 text-center" v-for="heure in tableRows[0].heures" :key="heure.label">
                    <span>{{ heure.label }}</span>
                </div>
            </template>
            <template #lun-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="lundi in tableRows[0].lun" :key="lundi.id">
                        <span>{{ lundi.classe }}</span>
                        <span class="font-bold uppercase">{{ lundi.matiere }}</span>
                        <span>{{ lundi.prof }}</span>
                        <span class="font-bold">{{ lundi.salle }}</span>
                    </div>
                </template>
            </template>
            <template #mar-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="mardi in tableRows[0].mar" :key="mardi.id">
                        <span>{{ mardi.classe }}</span>
                        <span class="font-bold uppercase">{{ mardi.matiere }}</span>
                        <span>{{ mardi.prof }}</span>
                        <span class="font-bold">{{ mardi.salle }}</span>
                    </div>
                </template>
            </template>
            <template #mer-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="mercredi in tableRows[0].mer" :key="mercredi.id">
                        <span>{{ mercredi.classe }}</span>
                        <span class="font-bold uppercase">{{ mercredi.matiere }}</span>
                        <span>{{ mercredi.prof }}</span>
                        <span class="font-bold">{{ mercredi.salle }}</span>
                    </div>
                </template>
            </template>
            <template #jeu-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="jeudi in tableRows[0].jeu" :key="jeudi.id">
                        <span>{{ jeudi.classe }}</span>
                        <span class="font-bold uppercase">{{ jeudi.matiere }}</span>
                        <span>{{ jeudi.prof }}</span>
                        <span class="font-bold">{{ jeudi.salle }}</span>
                    </div>
                </template>
            </template>
            <template #ven-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="vendredi in tableRows[0].ven" :key="vendredi.id">
                        <span>{{ vendredi.classe }}</span>
                        <span class="font-bold uppercase">{{ vendredi.matiere }}</span>
                        <span>{{ vendredi.prof }}</span>
                        <span class="font-bold">{{ vendredi.salle }}</span>
                    </div>
                </template>
            </template>
            <template #sam-data>
                <template class="flex align-middle justify-evenly">
                    <div class="text-center flex flex-col" v-for="samedi in tableRows[0].sam" :key="samedi.id">
                        <span>{{ samedi.classe }}</span>
                        <span class="font-bold uppercase">{{ samedi.matiere }}</span>
                        <span>{{ samedi.prof }}</span>
                        <span class="font-bold">{{ samedi.salle }}</span>
                    </div>
                </template>
            </template>
        </UTable>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const tableColumns = ref([
    {
        key: "heures",
        label: "",
        class: "text-center border-r"
    },
    {
        key: "lun",
        label: "Lun",
        class: "text-center border-r"
    },
    {
        key: "mar",
        label: "Mar",
        class: "text-center border-r"
    },
    {
        key: "mer",
        label: "Mer",
        class: "text-center border-r"
    },
    {
        key: "jeu",
        label: "Jeu",
        class: "text-center border-r"
    },
    {
        key: "ven",
        label: "Ven",
        class: "text-center border-r"
    },
    {
        key: "sam",
        label: "Sam",
        class: "text-center border-r"
    },
])

const tableRows = ref([
    {
        heures: [{ label: "07:30 - 09:00" }, { label: "09:00 - 10:30" }, { label: "10:30 - 12:00" }, { label: "" }, { label: "13:30 - 15:00" }, { label: "15:00 - 16:30" }, { label: "16:30 - 18:00" }],
        lun: [
            {
                id: 1,
                classe: "L1 PRO",
                matiere: "Ass App",
                prof: "Michel",
                salle: "210"
            },
            {
                id: 2,
                classe: "L3 IG",
                matiere: "IHM",
                prof: "William",
                salle: "001"
            },
        ],
        mar: [
            {
                id: 3,
                classe: "L2 GB",
                matiere: "C#",
                prof: "Ferdinand",
                salle: "004"
            },
            {
                id: 4,
                classe: "M1 ASR",
                matiere: "Docker",
                prof: "Siaka",
                salle: "106"
            },
        ],
        mer: [
            {
                id: 5,
                classe: "L1 IG",
                matiere: "Analyse",
                prof: "Benedicte",
                salle: "012"
            },
            {
                id: 6,
                classe: "M2 GB",
                matiere: "Scrum",
                prof: "Haja",
                salle: "112"
            },
        ],
        jeu: [
            {
                id: 7,
                classe: "L3 ASR",
                matiere: "Admin UNIX",
                prof: "Clément",
                salle: "007"
            },
            {
                id: 8,
                classe: "L2 GB",
                matiere: "C++",
                prof: "Cyprien",
                salle: "001"
            },
        ],
        ven: [
            {
                id: 9,
                classe: "M1 IG",
                matiere: "Anal Num",
                prof: "Ralaivao",
                salle: "104"
            },
            {
                id: 10,
                classe: "M2 GB",
                matiere: "Agile",
                prof: "Gilante",
                salle: "008"
            },
        ],
        sam: [
            {
                id: 11,
                classe: "L1 IG",
                matiere: "Unix",
                prof: "Hanta",
                salle: "012"
            },
            {
                id: 12,
                classe: "L3 ASR",
                matiere: "Admin WS",
                prof: "Siaka",
                salle: "004"
            },
        ],
    }
])

tableRows.value.forEach(first => {
    first.heures.forEach(heure => {
        console.log(heure);
    });
});
</script>
