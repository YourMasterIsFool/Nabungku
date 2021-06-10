<template>
    <div id="sub-category" @click=" $store.state.modal.showSubCategoryDetail = true, $store.state.modal.showSubCategoryId=item.id" :class="[selected ? 'bg-gray-100' : '']" ref="sub_category" class="text-xs">
        <div class="modal absolute">
            <slot name="modal"></slot>
        </div>
        <div class="grid grid-cols-12  text-gray-700 py-4 px-6">
            <div class="col-span-1 z-10 flex items-center ">
                <input type="checkbox" v-model="isSelect" class="col-span-1" />
            </div>
            <div class="col-span-5 pr-16 overflow-hidden items-center   relative" @click="showModalSubCategory = true , error = null" >
                <div class="flex items-center">
                    <div class=" overflow-hidden" ref="modalSubCategory" >
                    <a class="capitalize block"
                         
                        v-show="showModalSubCategory == false"
                    >
                        {{item.sub_category_name}}
                    </a>
                    <span v-show="error != null" style="font-size:11px;" class=" text-xs text-red-400">
                          {{error}}  
                    </span>
              
                    <input type="text" v-on:blur="focusChanged" v-show="showModalSubCategory" v-model="form.sub_category_name"  style="top:-10px;" class="py-2 w-32 outline-none pl-2 absolute focus:bg-gray-100 rounded-lg border-2 border-gray-100">

                </div>

                <a style="border-width: 1px;" @click="removeSubCat(item.id)" :class="[isSelect ? 'block' : 'hidden']" class="text-red-400 ml-12 text-xs py-1 px-3 cursor-pointer rounded-2xl border-red-400 text-xs">
                    
                    Delete
                </a>
                </div>

            </div>
            <div class="col-span-2 relative" @click="showModalBudgeted = true" >
                <div class=" overflow-hidden" ref="modalBudgeted" >
                    <a class="capitalize"
                         
                        v-show="showModalBudgeted == false"
                    >
                        <format-rupiah :item="item.budgeted"></format-rupiah>

                  
                    </a>
              
                    <input type="number" v-on:blur="focusChanged" v-show="showModalBudgeted" v-model="form.inputBudgeted"  style="top:-5px;" class="py-1 w-full outline-none pl-4 absolute focus:bg-gray-100 rounded-lg border-2 border-gray-100">
                </div>
            </div>
            <div class="col-span-2"  @click="openModalActivity" >
                
                 <div class="relative" ref="modalActivity" >
                    <a class="capitalize "
                    >

                        <format-rupiah :item="activity"></format-rupiah>
                    </a>
                     <input type="number" v-on:blur="focusChanged" v-show="showModalActivity"  v-model="form.inputActivity"  style="top:-5px;" class="py-1 w-full outline-none pl-4 absolute focus:bg-gray-100 rounded-lg border-2 border-gray-100">
                </div>

            </div>
            <div class="col-span-2 ">
                
                 <div class="relative" ref="modalAvailable" >
                    
                    <a :class="[precentage >= 70 ? 'text-green-400' : precentage >= 40 ? 'text-black' : 'text-red-400']" class="capitalize  text-xs"
                       
                        v-show="showModalAvailable == false"
                    >
                        <format-rupiah :item="available"></format-rupiah>
                        
                    </a>
                      <input type="number" v-on:blur="focusChanged" v-show="showModalAvailable" v-model="form.inputAvailable"  style="top:-5px;" class="py-1 w-full outline-none pl-4 absolute focus:bg-gray-100 rounded-lg border-2 border-gray-100">
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import FormatRupiah from './FormatRupiah';
import { mapActions, mapState } from "vuex";

export default {
    props: ["item", 'selected'],
    components: {
        FormatRupiah
    },
    data(){
        return {
            showModalBudgeted : false,
            showModalSubCategory: false,
            showModalActivity : false,
            isSelect:false,
            showModalAvailable : false,
            form: {
                inputBudgeted : this.item.budgeted,
                inputActivity : this.item.activity,
                inputAvailable : this.item.available,
                sub_category_name : this.item.sub_category_name,
            },
            error : null,
          }
    },
    computed: {
        activity() {
            const activity = this.$store.state.activity.activities.filter(
                    item => item.sub_category_id === this.item.id
                );
            if(activity.length > 0) {
                const total = activity.reduce((acc, obj) => {
                    return acc+(obj.income-obj.expense);
                }, 0);
                return total 
            }
           return 0
        },
        available() {
            return this.item.budgeted + this.activity;
        },
        precentage() {
            const precentage = this.available/this.item.budgeted * 100;
            
            return precentage
        },
    },
    methods: {
        ...mapActions({
            
            update_Sub_Category : 'sub_category/updateSubCategory',
            removeSub: 'sub_category/removeSub'
        }),
        fetchData(categoryId) {
        },
        focusChanged(event){
            this.error = null;
              const data = {
                'sub_category_name': this.form.sub_category_name,
                'budgeted' : this.form.inputBudgeted,
                'activity' : this.form.inputActivity,
                'available' : this.form.inputAvailable,
                'id': this.item.id,
                'category_id' : this.item.category_id,
            }
            this.updateSubCategory(data);
           

        },
   
        updateSubCategory(data){
            console.log(data);

            this.update_Sub_Category(data).then((resp) => {
                console.log(resp);
                this.showModalBudgeted = false; 
                 this.showModalActivity= false;
                 this.showModalAvailable= false;
                 this.showModalSubCategory = false;
            })
            .catch((error) => { 
                this.error = `${this.form.sub_category_name} ${error.data.data}`;
                console.log(this.error);
            });
        },
        removeSubCat(id){
           
            this.removeSub(id).then((res) => {
                this.$store.state.modal.showSubCategoryDetail = falsec
            })
        },
        openModalActivity() {
            
            this.$emit('open_modal', this.item.id);
        },
        
        closeModal(e) {
            let subCategory = this.$refs.sub_category;
            // console.log(subCategory);
            let elBudgeted = this.$refs.modalBudgeted;
            let elActivtiy = this.$refs.modalActivity;
            let elAvailable = this.$refs.modalAvailable;
            let elSubCategory = this.$refs.modalSubCategory;
            let target = e.target;

            if(subCategory == target || subCategory.contains(target)) {
                     if( elBudgeted !== target && !elBudgeted.contains(target)) {
                    this.showModalBudgeted = false; 
                      
                }


                 if( elActivtiy !== target && !elActivtiy.contains(target)) {
                    this.showModalActivity= false;
                }

                 if( elAvailable !== target && !elAvailable.contains(target)) {
                    this.showModalAvailable= false;

                }
                if( elSubCategory !== target && !elSubCategory.contains(target)) {
                    this.showModalSubCategory= false;

                }

            }
            else {
                 this.isSelect = false;
                 this.showModalBudgeted = false; 
                 this.showModalActivity= false;
                 this.showModalAvailable= false;
                 this.showModalSubCategory= false;
                 
            }
        }
    },

    mounted() {
        // console.log(this.showModalBudgeted);
        // if(this.selected) {
        //     this.isSelect = true
        // }
        // else {
        //     this.isSelect = false
        // }

    },

    created() {
        document.addEventListener('click', this.closeModal)
       
       
    }
};
</script>

<style></style>
