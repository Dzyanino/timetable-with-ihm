<template>
    <v-app>
        Layout: main-layout
        <v-app-bar :item="navBarLink" elevation="0" class="border-b" scroll-behavior="elevate">
            <template v-slot:prepend>
                <v-app-bar-nav-icon class="d-flex d-md-none" @click="nav = !nav"></v-app-bar-nav-icon>
            </template>

            <v-app-bar-title>
                <v-btn variant="plain" class="text-no-wrap text-green" link to="/">Fotoana</v-btn>
            </v-app-bar-title>

            <v-spacer class="d-none d-lg-flex"></v-spacer>

            <div v-for="preLink in navBarLink[0]" :key="preLink.to" class="d-none d-md-flex">
                <v-btn :prepend-icon="'mdi-' + preLink.icon" :text="preLink.label" :to="preLink.to"
                    class="mx-1"></v-btn>
            </div>
            <v-spacer class="d-none d-lg-flex"></v-spacer>
            <div v-for="postLink in navBarLink[1]" :key="postLink.to" class="d-none d-md-flex">
                <v-btn :prepend-icon="'mdi-' + postLink.icon" :text="postLink.label" :to="postLink.to"
                    class="mx-1"></v-btn>
            </div>
        </v-app-bar>

        <v-navigation-drawer temporary v-model="nav">
            <template v-for="preLink in navBarLink[0]" :key="preLink.to" class="d-flex d-md-none">
                <v-list-item :prepend-icon="'mdi-' + preLink.icon" :to="preLink.to" class="py-3">
                    <v-list-item-title>{{ preLink.label }}</v-list-item-title>
                </v-list-item>
            </template>
            <template v-slot:append>
                <v-divider></v-divider>
                <template v-for="postLink in navBarLink[1]" :key="postLink.to" class="d-flex d-md-none">
                    <v-list-item :prepend-icon="'mdi-' + postLink.icon" :to="postLink.to" class="py-3">
                        <v-list-item-title>{{ postLink.label }}</v-list-item-title>
                    </v-list-item>
                </template>
            </template>
        </v-navigation-drawer>

        <v-main class="bg-grey-lighten-5">
            <slot />
        </v-main>
    </v-app>
</template>

<script setup>
import { ref } from 'vue';

const navBarLink = ref([
    [
        {
            label: "Emploi du temps",
            to: "/emploidutemps",
            icon: "timetable"
        },
        {
            label: "Enseignants",
            to: "/teachers",
            icon: "human-male-board"
        },
        {
            label: "Cours",
            to: "/courses",
            icon: "book-open-outline"
        },
        {
            label: "Salles",
            to: "/rooms",
            icon: "home-group"
        },
    ],
    [
        {
            label: "Aide",
            to: "/help",
            icon: "help-circle-outline"
        },
        {
            label: "A propos",
            to: "/about",
            icon: "information-outline"
        },
    ],
])

const nav = ref(false)
</script>