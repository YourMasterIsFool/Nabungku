<template>
    <div id="modal" class="z-40 fixed top-0  left-0  h-screen w-screen">
        <div
            style="z-index:-1;"
            class="background fixed top-0 left-0 w-full h-full bg-black bg-opacity-50"
        ></div>

        <div class="modal-wrapper z-50 flex py-8 justify-center items-center">
            <div
                class="modal-content rounded-xl p-6  w-full md:w-2/6 bg-white "
            >
                <slot name="content"></slot>
            </div>
        </div>
    </div>
</template>

<script>
export default {};
</script>

<style></style>
