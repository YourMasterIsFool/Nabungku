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
                    @click="selectAll"
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
                            
                        </div>
                    </div>
                    <a  v-show="dropdownSubCategory||selectedCategory" @click="deleteSelectSub" style="border-width: 1px;" class="text-xs py-1 px-2 cursor-pointer rounded-2xl  ml-12 font-normal text-red-400 border-red-400">
                        Delete sub
                    </a>
                </div>
                <div class="col-span-2">
                    <a href=""><format-rupiah :item="budgeted"></format-rupiah> </a>
                </div>
                <div class="col-span-2"> <format-rupiah :item="activity"></format-rupiah></div>
                <div class="col-span-2"><format-rupiah :item="available"></format-rupiah></div>
            </div>
        </div>
        <div class="relative" ref="subDetail"   :key="
        sub_category.id" v-for="(sub_category, index) in item.sub_categorys">
                <div @click.prevent="$emit('open_sub_detail', sub_category.id)" class="absolute top-0 w-full h-full">

                </div>
                <div id="modal-activity" style="z-index: 10; height: 250px;" v-show="selectedModalActivity == index"  ref="showActivity" class="absolute shadow-md rounded-2xl overflow-hidden bg-white p-4">
                    <simple-modal >
                        <template #content>
                            <div class="pb-4 px-2">
                        <div class="flex justify-between">
                            <span class="font-bold capitalize">
                                {{sub_category.sub_category_name}}
                            </span>

                            <a @click="closeActivityModal(index)" class="text-gray-500">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            </a>
                        </div>
                        <div style="height:200px;" class="mt-3 mb-20 overflow-scroll h-full">

                            <table class="w-full pb-10 ">
                                <thead>
                                    
                                    <tr class="text-left ">
                                        <th width="150">Date</th>
                                        <th width="500">income</th>
                                        <th width="500">expense</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    
                                    <tr class="pb-2" :key="activity.id" v-for="activity in activities">
                                    <td style="" width="200">
                                        <span class="flex text-xs text-gray-600 items-center">
                                            {{activity.created_at}}
                                        </span>
                                    </td>
                                   <td width="500" class="items-center">
                                        <span class="flex text-xs text-gray-600">
                                                +
                                      <format-rupiah :item="activity.income"></format-rupiah>
                                        </span>
                                   </td>
                                   <td width="500" class="">
                                         

                                        <span class="flex text-xs text-gray-600 items-center">
                                            -<format-rupiah :item="activity.expense"></format-rupiah>

                                        </span>
                                   </td>

                                </tr>
                                </tbody>
                                
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
                ref="sub_category_vue"
                :selected="false"
             @open_modal="showModalActivity(index, sub_category.id)"
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
    props: ["item", "index", 'categoryId'],
    components: {
        SubCategoryVue,
        FormatRupiah,
        SimpleModal,
        

    },

    data() {
        return {
            clicked: false,
            selectedCategory:false,
            editCategory: false,
            dropdown: false,
            showSubCategory: false,
            dropdownSubCategory: false,
            showActivity: false,
            activities: null,
            selectedModalActivity: null,
            modalSubCategoryName: false,

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
    computed: {
        ...mapGetters({
            getIndex: "category/getIndex",
            sub_categories: 'sub_category/sub_categories',
            activitiesBySub : 'activity/activitiesBySubCategory', 
        }),
        sub() {
            const sub = this.$store.state.sub_category.sub_categories.filter(
                sub => sub.category_id == this.item.id
            ).map(
                sub => ({
                    ...sub,
                    activity_total: this.$store.state.activity.activities.filter(
                        act => act.sub_category_id == sub.id
                    ).reduce((act, obj) => {
                        return act + (obj.income - obj.expense);
                    }, 0),
                })
            )

            return sub

        },

        activity() {
            const total = this.sub.reduce((total, sub) => {
                return total + parseInt(sub.activity_total);
            }, 0)

            return total;
        },
        budgeted() {
            if(this.item.sub_categorys.length > 0) {
                let total = this.item.sub_categorys.reduce((acc, obj) => {
                   return acc + parseInt(obj.budgeted)
                }, 0);

                return total;
            }
            return 0;
        },

        available() {
            return this.budgeted + this.activity;
        },


    },
    methods: {
        ...mapActions({
            // category
            deleteCategory: "category/removeCategory",
            editCategoryName: "category/updateCategoryName",
            storeSubCategory: "sub_category/storeSubCategory",
            removeSelectedSub : 'sub_category/removeSelectedSub',
            
            //ACTIVITY
            fetchActivityBySubCategory: 'activity/fetchDataBySubCategory',
            // removeActivity: 'activity/removeActivityData',

            // sub_category

            // fetch_categories: 'sub_category/fetchSubCategoryByCategoryId',
        }),
        showSubCategoryName() {
            this.modalSubCategoryName = true;
        },

        deleteSelectSub() {
            const sub = []

            this.$refs.sub_category_vue.forEach((el, index ) => {
               if(el.isSelect) {
                   sub.push(el._props.item.id);
               }
            })

            this.removeSelectedSub(sub);
        },
       
        click() {
            this.clicked = true;
        },
        selectAll() {
            this.selectedCategory = !this.selectedCategory

            if(this.selectedCategory) {
                this.$refs.sub_category_vue.forEach((el, index) => {
                    el.isSelect = true
                })
            }
            else {
                 this.$refs.sub_category_vue.forEach((el, index) => {
                    el.isSelect = false
                })          
            }
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
            let target = e.target;
            let subDetail = this.$refs.subDetail;

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
        },
          showModalActivity(index, sub_id, event) {
            this.selectedModalActivity = index;
            this.activities = this.activitiesBySub(sub_id);
            console.log(this.activitiesBySub(sub_id));
            const refs = this.$refs.showActivity;
            console.log(refs);
            console.log(this.activities);
            console.log('open_modal');

            // for(let i=0; i < refs.length; i++ ) 
            // {
            //     refs[i].style.display = 'none';
            // }

            this.$refs.showActivity[index].style.display = "block" ; 

                
        },
        closeActivityModal(index) {

           this.$refs.showActivity[index].style.display = "none"
           // this.removeActivity();
        }
    },
    created() {
        document.addEventListener("click", this.closeModal);
        this.$refs;
    },
    mounted() {


        if (this.editCategory == false) {
            this.error = null;
        }
       
    },
    mixins:[]
};
</script>

<style lang="css"> 
    #modal-activity {
        background-repeat: no-repeat;
        background-size: 100% 100%;
        max-width: 370px;
        height: 200px;
        z-index: 10px;
        position: absolute;
        top: 50px;
        right: 50px;
    }
</style>
