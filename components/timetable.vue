<template>
    <div>
        <v-data-table fixed-header :headers="tableHeaders" class="border rounded-lg" color="green">

            <template v-slot:top>
                <v-row class="py-2">
                    <v-col cols="12" md="4" offset-md="2" class="text-center text-button">
                        <h2>L1</h2>
                    </v-col>
                    <v-col cols="12" md="4" class="text-center text-button">
                        <h2>15 Avril - 21 Avril</h2>
                    </v-col>
                </v-row>
            </template>

            <template v-slot:headers="{ columns }">
                <tr>
                    <td class="border-b text-center text-overline">#</td>
                    <template v-for="column in columns" :key="column.key">
                        <td class="border-b text-center text-overline">
                            <span>{{ column.title }}</span>
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

const tableHeaders = ref([
    {
        title: "Lundi",
        key: "lun",
        sortable: false,
    },
    {
        title: "Mardi",
        key: "mar",
        sortable: false,
    },
    {
        title: "Mercredi",
        key: "mer",
        sortable: false,
    },
    {
        title: "Jeudi",
        key: "jeu",
        sortable: false,
    },
    {
        title: "Vendredi",
        key: "ven",
        sortable: false,
    },
    {
        title: "Samedi",
        key: "sam",
        sortable: false,
    },
])
</script>