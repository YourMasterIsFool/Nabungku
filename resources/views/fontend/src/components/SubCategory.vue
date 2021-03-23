<template>
    <div id="sub-category" class="text-xs">
        <div class="grid grid-cols-12  text-gray-700 py-4 px-6">
            <div class="col-span-1 flex items-center ">
                <input type="checkbox" class="col-span-1" />
            </div>
            <span class="col-span-5 text-xs  capitalize">
                {{ item.sub_category_name }}</span
            >
            <div class="col-span-2">Rp{{ item.budgeted }}</div>
            <div class="col-span-2">Rp{{ item.activity }}</div>
            <div class="col-span-2">Rp{{ item.available }}</div>
        </div>
    </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
    props: ["categoryId", "item"],
    data() {
        return {};
    },
    methods: {
        ...mapActions({
            fectDataSubCategory: "sub_category/fetchSubCategory"
        }),
        fetchData(categoryId) {
            this.fectDataSubCategory(categoryId);
        }
    },

    mounted() {
        this.fetchData();
    }
};
</script>

<style></style>
