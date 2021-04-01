<template>
    <div id="modal" class="z-40 fixed top-0  left-0  h-screen w-screen">
        <div
            style="z-index:-1;"
            class="background fixed top-0 left-0 w-full h-full bg-black bg-opacity-50"
        ></div>

        <div class="modal-wrapper z-50">
            <slot name="content" ></slot>
        </div>
    </div>
</template>

<script>
export default {};
</script>

<style></style>
