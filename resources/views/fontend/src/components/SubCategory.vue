<template>
    <div id="sub-category" ref="sub_category" class="text-xs">
        <div class="modal absolute">
            <slot name="modal"></slot>
        </div>
        <div class="grid grid-cols-12  text-gray-700 py-4 px-6">
            <div class="col-span-1 flex items-center ">
                <input type="checkbox" class="col-span-1" />
            </div>
            <div class="col-span-5 relative" @click="showModalSubCategory = true" >
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
            <div class="col-span-2"  @click="openModalActivity($event)" >
                
                 <div class="relative" ref="modalActivity" >
                    <a class="capitalize "
                       
                        @click="$emit('open_modal')"
                    >
                        <format-rupiah :item="item.activity"></format-rupiah>
                    </a>
                     <input type="number" v-on:blur="focusChanged" v-show="showModalActivity"  v-model="form.inputActivity"  style="top:-5px;" class="py-1 w-full outline-none pl-4 absolute focus:bg-gray-100 rounded-lg border-2 border-gray-100">
                </div>

            </div>
            <div class="col-span-2 ">
                
                 <div class="relative" ref="modalAvailable" >
                    <a class="capitalize"
                       
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
    props: ["item"],
    components: {
        FormatRupiah
    },
    data(){
        return {
            showModalBudgeted : false,
            showModalSubCategory: false,
            showModalActivity : false,
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
        available() {
            return this.item.budgeted - this.item.activity;
        }
    },
    methods: {
        ...mapActions({
            fectDataSubCategory: "sub_category/fetchSubCategory",
            update_Sub_Category : 'category/updateSubCategory',
        }),
        fetchData(categoryId) {
            this.fectDataSubCategory(categoryId);
        },
        focusChanged(event){
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
        openModalActivity(event) {
            event.preventDevault();
            this.$emit('open_modal', event);
        },
        closeModal(e) {
            let el = this.$refs.sub_category;
            let elBudgeted = this.$refs.modalBudgeted;
            let elActivtiy = this.$refs.modalActivity;
            let elAvailable = this.$refs.modalAvailable;
            let elSubCategory = this.$refs.modalSubCategory;
            let target = e.target;

            if(el == target || el.contains(target)) {
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
                 this.showModalBudgeted = false; 
                 this.showModalActivity= false;
                 this.showModalAvailable= false;
                 this.showModalSubCategory= false;
                 
            }
        }
    },

    mounted() {
        this.fetchData();
        console.log(this.showModalBudgeted);
    },

    created() {
        document.addEventListener('click', this.closeModal)
       
    }
};
</script>

<style></style>
