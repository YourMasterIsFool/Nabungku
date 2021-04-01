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
                    <a href=""><format-rupiah :item="budgeted"></format-rupiah> </a>
                </div>
                <div class="col-span-2"> <format-rupiah :item="activity"></format-rupiah></div>
                <div class="col-span-2"><format-rupiah :item="available"></format-rupiah></div>
            </div>
        </div>
        <div class="relative" v-for="(sub_category, index) in item.sub_categories">
            
                <div id="modal-activity" style="z-index: 10; display: none;" ref="showActivity" class="absolute overflow-hidden bg-white py-6 px-4">
                    <simple-modal >
                        <template #content>
                            <div class="py-8 px-2">
                        <div class="flex justify-between">
                            <span class="font-bold capitalize">
                                dqwdq
                            </span>

                            <a @click="closeActivityModal(index)" class="text-gray-500">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            </a>
                        </div>
                        <div style="height: 200px;" class="mt-3 mr-2 pb-6 overflow-y-scroll h-full">

                            <table class="w-full ">
                                <tr class="text-left ">
                                    <th>Date</th>
                                    <th>Income</th>
                                    <th>Expense</th>
                                </tr>
                                
                                <tbody>
                                    
                                </tbody>
                                <tr class="pb-2" v-for="activity in activities">
                                    <td style="padding-right: 6px;">
                                        {{activity.created_at}}
                                    </td>
                                   <td style="padding-right: 6px;">
                                       <format-rupiah :item="activity.income"></format-rupiah>
                                   </td>
                                   <td style="padding-right: 6px;">
                                           <format-rupiah :item="activity.expense"></format-rupiah>

                                   </td>

                                </tr>
                            </table>
                            
                        </div>
                    </div>
                        </template>
                    </simple-modal>
                </div> 
            <sub-category-vue

                style="
                top:0px;
                "
             @open_modal="showModalActivity(index, sub_category.id, event)"
            class="transition-all absolute relative duration-1000"
            :style="[
                dropdownSubCategory
                    ? { height: 'auto', overflow: 'auto' }
                    : { overflow: 'hidden', height: '0px' }
            ]"
            id="category"
           
            :item="sub_category"
            :key="sub_category.id"
        >
        </sub-category-vue>
        </div>
    </div>
</template>

<script>
import SimpleModal from './SimpleModal';
import FormatRupiah from './FormatRupiah';
import { mapActions, mapGetters } from "vuex";
import SubCategoryVue from "./SubCategory.vue";
export default {
    props: ["item", "index"],
    components: {
        SubCategoryVue,
        FormatRupiah,
        SimpleModal,

    },

    data() {
        return {
            clicked: false,
            editCategory: false,
            dropdown: false,
            showSubCategory: false,
            dropdownSubCategory: false,
            showActivity: false,

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
        this.fetchActivityBySubCategory
        
    },
    computed: {
        ...mapGetters({
            getIndex: "category/getIndex",
            sub_categories: 'sub_category/sub_categories',
            activities : 'activity/activities', 
        }),
        budgeted() {
            if(this.item.sub_categories.length > 0) {
                let total = this.item.sub_categories.reduce((acc, obj) => {
                   return acc + obj.budgeted
                }, 0);

                return total;
            }
            return 0;
        },

        activity() {
            if(this.item.sub_categories.length > 0) {
                let total = this.item.sub_categories.reduce((acc, obj) => {
                   return acc + obj.activity
                }, 0);

                return total;
            }

            return 0;
        },
      

        available() {
            return this.budgeted - this.activity;
        },
    },
    methods: {
        ...mapActions({
            // category
            deleteCategory: "category/removeCategory",
            editCategoryName: "category/updateCategoryName",
            storeSubCategory: "category/storeSubCategory",
            
            //ACTIVITY
            fetchActivityBySubCategory: 'activity/fetchDataBySubCategory',
            removeActivity: 'activity/removeActivityData'
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
            let refs = this.$refs.showActivity;

            console.log(elCategory);

            let target = e.target;
            if (elCategory !== target && !elCategory.contains(target)) {
                this.editCategory = false;
                this.error = null;
            }
            if (elSubCategory !== target && !elSubCategory.contains(target)) {
                this.error = null;
                this.showSubCategory = false;
            }

                
              for(let i=0; i < refs.length; i++ ) 
                {   
                     if (refs[i] !== target && !refs.contains(target)) {
                            refs[i].style.display = 'none';
                        }
                    
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
        },
          showModalActivity(index, id, event) {
            const refs = this.$refs.showActivity;
            this.fetchActivityBySubCategory(id);

            for(let i=0; i < refs.length; i++ ) 
            {
                refs[i].style.display = 'none';
            }

            this.$refs.showActivity[index].style.display = "block" ; 

                
        },
        closeActivityModal(index) {

           this.$refs.showActivity[index].style.display = "none"
           this.removeActivity();
        }
    },
    created() {
        document.addEventListener("click", this.closeModal);
        this.$refs;

    }
};
</script>

<style lang="css"> 
    #modal-activity {
        background: url('../assets/images/icon_box.png');
        background-repeat: no-repeat;
        background-size: 100% 100%;
        width: 370px;
        height: 300px;
        z-index: 10px;
        position: absolute;
        top: 10px;
        right: 50px;
    }
</style>
