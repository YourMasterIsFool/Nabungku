<template>
    <div>
        <div
            @click="clicked = !clicked"
            :class="[clicked ? 'bg-blue-300 bg-opacity-30' : '']"
            class="grid grid-cols-12 hover:bg-blue-300 text-sm hover:bg-opacity-30  text-gray-700 py-4 px-6"
            id="category"
        >
            <div class="col-span-1 flex items-center ">
                <input
                    type="checkbox"
                    @click="clicked = clicked"
                    class="col-span-1"
                />
                <i
                    @click="dropdown != dropdown"
                    :style="[clicked ? { transform: 'rotate(180deg)' } : '']"
                    style="font-size:20px; vertical-align:middle; transition:all; transition-duration: 0.3s;"
                    class="fas px-2 font-bold fa-caret-up align-middle"
                >
                </i>
            </div>
            <div class="col-span-11 grid grid-cols-11">
                <span class="col-span-5 text-xs font-bold capitalize">
                    category {{ index + 1 }}
                </span>
                <div class="col-span-2">
                    <a href=""> Rp. {{ item.budget }} </a>
                </div>
                <div class="col-span-2">activity</div>
                <div class="col-span-2">available</div>
            </div>
        </div>
        <div
            class="transition-all duration-1000"
            :style="[
                clicked
                    ? { height: 'auto', overflow: 'auto' }
                    : { overflow: 'hidden', height: '0px' }
            ]"
            v-for="(subcategory, index) in item.subcategorys"
            id="category"
            :key="subcategory.index"
        >
            <div class="grid grid-cols-12  text-gray-700 py-4 px-6">
                <div class="col-span-1 flex items-center ">
                    <input type="checkbox" class="col-span-1" />
                </div>
                <span class="col-span-5 text-xs  capitalize">
                    sub-category {{ index + 1 }}
                </span>
                <div class="col-span-2">
                    <a href=""> Rp. {{ subcategory.budget }} </a>
                </div>
                <div class="col-span-2">activity</div>
                <div class="col-span-2">available</div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ["item", "index"],
    data() {
        return {
            clicked: false,
            dropdown: false
        };
    },
    methods: {
        click() {
            this.clicked = true;
        }
    }
};
</script>

<style></style>
