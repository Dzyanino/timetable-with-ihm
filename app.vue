<template>
    <NuxtLayout>
        <NuxtPage />
    </NuxtLayout>
</template>

<style>
.layout-enter-active,
.layout-leave-active {
    transition: all 0.25s;
}

.layout-enter-from,
.layout-leave-to {
    opacity: 0;
    filter: blur(0.25rem);
}

.slide-enter-active,
.slide-leave-active {
    transition: all 0.25s;
}

.slide-enter-from,
.slide-leave-to {
    opacity: 0;
    transform: translateX(-15px);
}
</style>