<template>
    <div class="my-2 md:my-4 lg:my-6">
        <UTable :columns="tableColumns" :rows="tableRows" class="border rounded-md">
            <template #jour-data="{ row }">
                <div class="py-16 text-center">
                    <span class="font-bold">{{ row.jour }}</span>
                </div>
            </template>
        </UTable>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const tableRows = ref([
    {
        jour: "Lun"
    },
    {
        jour: "Mar"
    },
    {
        jour: "Mer"
    },
    {
        jour: "Jeu"
    },
    {
        jour: "Ven"
    },
    {
        jour: "Sam"
    }
])

const tableColumns = ref([
    {
        key: "jour",
        label: "",
        class: "text-center border-b border-r"
    },
    {
        key: "premiere",
        label: "07:30 - 09:00",
        class: "text-center border-b border-r"
    },
    {
        key: "deuxieme",
        label: "09:00 - 10:30",
        class: "text-center border-b border-r"
    },
    {
        key: "troisieme",
        label: "10:30 - 12:00",
        class: "text-center border-b border-r"
    },
    {
        key: "pause",
        label: "",
        class: "text-center border-b border-r bg-grey-800 dark:bg-grey-200"
    },
    {
        key: "quatrieme",
        label: "13:30 - 15:00",
        class: "text-center border-b border-r"
    },
    {
        key: "cinquieme",
        label: "15:00 - 16:30",
        class: "text-center border-b border-r"
    },
    {
        key: "sixieme",
        label: "16:30 - 18:00",
        class: "text-center border-b"
    }
])
</script>
