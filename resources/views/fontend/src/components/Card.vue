<template>
    <div id="card">
        <div id="card-content" class="w-full p-4 md:p-6 ">
            <slot name="content"></slot>
        </div>
    </div>
</template>

<script>
export default {};
</script>

<style>
.card-content {
    background-image: url("../assets/images/icon_box.png");
}
</style>
