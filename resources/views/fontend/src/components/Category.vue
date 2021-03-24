<template>
    <div>
        <div
            @click="clicked = !clicked"
            :class="[dropdownSubCategory ? 'bg-blue-300 bg-opacity-30' : '']"
            class="grid grid-cols-12 hover:bg-blue-300 text-sm hover:bg-opacity-30  text-gray-700 py-4 px-6"
            id="category"
        >
            <div class="col-span-1 flex items-center ">
                <input
                    type="checkbox"
                    @click="clicked = clicked"
                    class="col-span-1"
                />
                <a @click="dropdownSubCategory = !dropdownSubCategory">
                    <i
                        @click="dropdown != dropdown"
                        :style="[
                            dropdownSubCategory
                                ? { transform: 'rotate(180deg)' }
                                : ''
                        ]"
                        style="font-size:20px; vertical-align:middle; transition:all; transition-duration: 0.3s;"
                        class="fas px-2 font-bold fa-caret-up align-middle"
                    >
                    </i>
                </a>
            </div>
            <div class="col-span-11 grid grid-cols-11">
                <div
                    class="col-span-5 relative text-xs flex  items-center font-bold capitalize"
                >
                    <div class="relative cursor-pointer" ref="categoryEdit">
                        <a @click="editCategory = true">
                            <span class=""> {{ item.category_name }} </span>
                        </a>
                        <div
                            v-show="editCategory"
                            style="top:16px; left:0px;"
                            class="absolute left-0 p-4  rounded-lg shadow-xl bg-white z-20"
                        >
                            <div class="py-2">
                                <input
                                    type="text"
                                    v-model="form.category.category_name"
                                    :placeholder="item.category_name"
                                    style="border-width:1px;"
                                    :class="[
                                        error != null
                                            ? 'border-red-400'
                                            : 'border-green-200 border-blue-200'
                                    ]"
                                    class="w-64 outline-none px-4  mb-2 py-2 rounded-lg text-xs "
                                />
                                <span
                                    :class="
                                        error != null
                                            ? 'opacity-100'
                                            : 'opacity-10'
                                    "
                                    class="text-red-400 text-xs normal-case font-normal"
                                >
                                    {{ error }}
                                </span>
                            </div>

                            <div class="flex mt-3 justify-between">
                                <div class="flex items-center">
                                    <a
                                        @click="removeCategory(item.id)"
                                        style="border-width:1px;"
                                        class="px-4 mr-2 capitalize cursor-pointer py-2 border-red-400 rounded-lg  text-red-400 hover:text-white hover:bg-red-400"
                                    >
                                        delete
                                    </a>
                                    <a
                                        @click="editCategory = false"
                                        class="capitalize cursor-pointer text-gray-700"
                                    >
                                        cancel
                                    </a>
                                </div>
                                <button
                                    @click="updateCategoryName(item.id)"
                                    class="px-3 py-1 rounded-lg bg-blue-400 text-white text-xs font-semibold"
                                >
                                    edit category
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="relative" ref="modalNewSubCategory">
                        <a
                            @click="showSubCategory = true"
                            class="cursor-pointer ml-4 bg-blue-400 pl- w-5 h-5 text-xs text-white flex justify-center items-center rounded-full"
                        >
                            <i class="fas fa-plus"></i>
                        </a>

                        <div
                            v-show="showSubCategory"
                            style="bottom:-120px; left:4px;"
                            class="absolute left-0 p-4  rounded-lg shadow-xl bg-white z-20"
                        >
                            
                                <input
                                    type="text"
                                    v-model="form.subCategory.sub_category_name"
                                    placeholder="add new sub category"
                                    style="border-width:2px;"
                                    :class="error != null ? 'border-red-400' : 'focus:border-green-200 border-blue-200'"
                                    class="w-64 outline-none px-4   py-2 rounded-lg text-xs "
                                />
                                <span v-show="error != null" class="text-xs font-normal text-red-400">
                                    {{error}}
                                </span>

                                <div class="flex mt-4 justify-between">
                                    <a
                                        @click="showSubCategory = false"
                                        class="capitalize cursor-pointer text-gray-700"
                                    >
                                        cancel
                                    </a>
                                    <a  
                                        @click="addNewSubCategory(item.id)"
                                        type="submit"
                                        class="px-2 py-1 cursor-pointer rounded-lg bg-blue-400 text-white text-xs font-semibold"
                                    >
                                        add
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-span-2">
                    <a href=""> {{budgeted}} </a>
                </div>
                <div class="col-span-2">activity</div>
                <div class="col-span-2">available</div>
            </div>
        </div>
        <sub-category-vue
            class="transition-all relative duration-1000"
            :style="[
                dropdownSubCategory
                    ? { height: 'auto', overflow: 'auto' }
                    : { overflow: 'hidden', height: '0px' }
            ]"
            id="category"
            v-for="sub_category in item.sub_categories"
            :item="sub_category"
            :key="sub_category.id"
        >
        </sub-category-vue>
    </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import SubCategoryVue from "./SubCategory.vue";
export default {
    props: ["item", "index"],
    components: {
        SubCategoryVue
    },

    data() {
        return {
            clicked: false,
            editCategory: false,
            dropdown: false,
            showSubCategory: false,
            dropdownSubCategory: false,

            form: {
                category: {
                    category_name: null
                },
                subCategory: {
                    sub_category_name: null
                }
            },
            error: null
        };
    },
    mounted() {
        if (this.editCategory == false) {
            this.error = null;
        }
        
    },
    computed: {
        ...mapGetters({
            getIndex: "category/getIndex",
            sub_categories: 'sub_category/sub_categories' 
        }),
        budgeted() {
            if(this.item.sub_categories.length > 0) {
                return this.item.sub_categories.reduce((sum, obj) => {
                    sum + obj.budgeted;
                },0);
            }

            return 0;
        }
    },
    methods: {
        ...mapActions({
            deleteCategory: "category/removeCategory",
            editCategoryName: "category/updateCategoryName",
            storeSubCategory: "category/storeSubCategory",
         
        }),
        click() {
            this.clicked = true;
        },
        updateCategoryName(id) {
            const index = this.getIndex(id);
            console.log(index);
            const data = {
                id: id,
                category_name: this.form.category.category_name
            };
            this.editCategoryName(data)
                .then(res => {
                    this.form.category.category_name = "";
                    this.editCategory = false;
                    
                    this.error = null;
                })
                .catch(err => {
                    this.error = err.data.data;

                    console.log(this.error);
                });
        },

        removeCategory(id) {
            this.deleteCategory(id).then(res => {
                this.clicked = false;
            });
        },

        closeModal(e) {
            let elCategory = this.$refs.categoryEdit;
            let elSubCategory = this.$refs.modalNewSubCategory;
            let target = e.target;
            if (elCategory !== target && !elCategory.contains(target)) {
                this.editCategory = false;
                this.error = null;
            }
            if (elSubCategory !== target && !elSubCategory.contains(target)) {
                this.error = null;
                this.showSubCategory = false;
            }
        },
        addNewSubCategory(category_id) {
            const data  = {
                category_id: category_id,
                sub_category_name: this.form.subCategory.sub_category_name
            }
            this.storeSubCategory(data).then((res) => {
                
                this.showSubCategory = false;
                this.form.sub_category.sub_category_name = "";
                
                
                
            })
            .catch((err) => {
                this.error = err.data.data
            });  
        }
    },
    created() {
        document.addEventListener("click", this.closeModal);
        

    }
};
</script>

<style lang="css"> 
</style>
