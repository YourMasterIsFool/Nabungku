<template>
    <div id="learn">
        <div id="hero" class="w-full  md:flex pt-8 justify-center ">
            <div class=" w-full md:w-3/4 flex justify-center  ">
                <div class="grid md:grid-cols-2 gap-8 md:gap-32">
                    <div class="flex-col flex justify-center items-start ">
                        <h1 class="text-3xl font-bold mb-4 lg:mb-8 ">
                            Mulai dari mana?
                        </h1>
                        <h3 class="leading-relaxed mb-4 lg:mb-8 ">
                           Bingung mau belajar mulai darimana? 
                            Coba isi quiz ini untuk cari tau materi
                            yang sesuai dengan kebutuhanmu!
                        </h3>
                        <div class="flex items-center  justify-between">
                            <a
                               @click="$router.push(
                                   {
                                       name: 'LearnQuiz'
                                   }
                               )"
                                class="cursor-pointer rounded-3xl lg:px-12 lg:py-4 py-3 px-6 capitalize text-white bg-blue-400 hover:bg-blue-500 transition-all duration-300"
                            >
                                Try Now
                            </a>
                            <a
                                href=""
                                class="lg:px-12 capitalize text-gray-600 hover:text-gray-800 px-8"
                            >
                                nanti saja
                            </a>
                        </div>
                    </div>

                    <img :src="icon1" style="" class="relative" alt="" />
                </div>
            </div>
        </div>
        <section
            id="content-1"
            class="w-full md:flex md:justify-center  lg:py-20 md:py-12 py-8"
        >
            <div class="md:w-3/4">
                <h1
                    class="text-4xl lg:mb-16 mb-8 md:mb-12 block text-center md:text-left font-bold capitalize"
                >
                    Semua Materi
                </h1>

                <div class="grid  md:grid-cols-12 md:gap-8">
                    <div
                        class="flex flex-col justify-center md:justify-start md:col-span-3"
                    >
                        <div class="hidden md:block">
                            <ul id="menu-category">
                                <!-- {{cat_materis}} -->
                                <li class="transition-all duration-500" :class="[ selectedCatIndex == index ? 'active': '']" @click="selectCategory(index, cat.id)" v-for="(cat, index) in cat_materis" :key="
                                cat.id">
                                   <a class="cursor-pointer"> {{cat.name}} {{cat.id}}</a> 
                                </li>
                                <!-- <li><a href="">General</a></li>
                                <li><a href="">Financial Planning</a></li>
                                <li><a href="">Financial Checkup</a></li>
                                <li><a href="">Challenge</a></li>
                                <li><a href="">Category 5</a></li> -->
                            </ul>
                        </div>
                        <select
                            name="category"
                            id=""
                            class="py-3 md:hidden focus:outline-none bg-indigo-200 px-2 text-indigo-800"
                        >
                            <option :value="cat.id" :class="[ selectedCatIndex == index ? 'active': '']" @click="selectCategory(index, cat.id)" v-for="(cat, index) in cat_materis" :key="
                                cat.id" >
                                    {{cat.name}}
                                </option>
                        </select>
                    </div>
                    
                   <div class="md:col-span-9 mt-4 md:mt-0" >
                        <div
                        class="grid md:gap-x-4 md:gap-y-2 gap-2 lg:grid-cols-3 grid-cols-2"
                    >
                        <div class="cursor-pointer" @click="$router.push({ name: 'LearnArticle', params: {
                            article_id: materi.id
                        }})" v-for="materi in materi_data" :key="materi.id"> 
                            <img class="rounded-lg w-full md:h-32" :src="'/images/'+materi.images_url" alt="">
                            <div class="md:mt-4 font-semibold text-xs text-gray-600 text-center">
                                {{materi.title}}
                           
                            </div>
                        </div>
                    </div>
                    <div class="page flex justify-end md:mt-4">
                        
                        <ul v-show="materis.length > 6" class="pagination flex">
                            <li @click="previousPaginate()" v-show="page != 1">
                                <a  class="transition-all hover:bg-blue-500 duration-300 w-6 h-6 flex justify-center items-center rounded-full bg-blue-400 text-white">
                                    <span class="material-icons">
                                        chevron_left
                                    </span>

                                </a>
                            </li>

                            <li v-show="offset < materis.length"  @click="nextPaginate()">
                                 <a  class="w-6 h-6 flex hover:bg-blue-500 transition-all duration-300 justify-center items-center rounded-full bg-blue-400 text-white">
                                
                                    <span class="material-icons">
                                        chevron_right
                                    </span>

                                </a>
                            </li>
                        </ul>
                    </div>
                   </div>
                </div>
            </div>
        </section>
        <!-- <editor-plugin :categorys="cat_materis"></editor-plugin> -->
    </div>
    
</template>

<script>
import EditorPlugin  from '../../components/Editor.vue';
import icon2 from "../../assets/images/icon2.png";
import icon1 from '../../assets/images/learn_rev.png';
import axios from 'axios';
import Pagination from "../../components/Pagination.vue";
export default {
    name: "Learn",
    components: {
      EditorPlugin
    },
    data() {
        return {
            icon2: icon2,
            page: 1,
            offset: 6,
            start: 0,
            limit:6,
            materis_length: 0,
            icon1: icon1,
            cat_materis: null,
            materiData: {
                materis: [],
                materi_count: 0,
            },
            materis: null,
            selectedCatIndex: 0,
            selectedCatId:1,
        };
    },
    
    created(){
         if (this.cat_materis == null) {
            axios.get('api/category_pembelajaran', )
            .then((resp) => {
                this.cat_materis = resp.data.data;
                console.log(this.cat_materis);
            })
        }

        if(this.materiData.materis.length == 0) {
            axios.get('api/materi_pembelajaran', {
            })
            .then((resp) => {
                this.materiData = resp.data.data

                console.log(resp);
                this.selectCategory(0, 1)
            })
            .catch((err) => {
                console.log(err.response);
            })
        }

        
       
        
    },
    computed: {
        materi_data() {
            this.offset = this.page * this.limit;
            this.start = this.offset - this.limit;
          
            if(this.materis != null) {
                return this.materis.slice(this.start, this.offset)
            } 

        }
    },      
    methods: {
    selectCategory(index, id) {
            this.selectedCatIndex = index;
            this.selectedCatId = id;
            
            this.start = 0
            this.page = 1
            this.offset = this.limit

            if(this.selectedCatId == 1 ) {
                this.materis = this.materiData.materis
            }
            else {
                this.materis = this.materiData.materis.filter((item, index) => {
                    return item.category_pembelajaran_id == this.selectedCatId
                })
            }
            console.log(this.materiData.materis) //
            
            
        },
        fetchPerPage() {
            if(this.start > 0) {
                this.start = 0
            }
            else {
                this.offset = this.limit * this.page
                this.start = this.offset - this.limit
            }
            


        },
        nextPaginate() {
            this.page++
            this.fetchPerPage()

        },
        previousPaginate() {
            this.page--
            this.fetchPerPage()
        }
    },
};
</script>

<style>
#menu-category {
    display: flex;
    flex-direction: column;
}

#menu-category .active {
    font-weight: bold;
    color: #5E81F4;
}

#menu-category li {
    padding: 1rem 0px;
}

.pagination li {
    margin-right:1rem;
    cursor: pointer;
}
</style>
