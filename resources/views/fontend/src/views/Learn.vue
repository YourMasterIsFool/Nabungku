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
                                href=""
                                class="rounded-3xl lg:px-12 lg:py-4 py-3 px-6 capitalize text-white bg-blue-400 hover:bg-blue-500 transition-all duration-300"
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
                                <li class="active">
                                    <a href="">All category</a>
                                </li>
                                <li><a href="">General</a></li>
                                <li><a href="">Financial Planning</a></li>
                                <li><a href="">Financial Checkup</a></li>
                                <li><a href="">Challenge</a></li>
                                <li><a href="">Category 5</a></li>
                            </ul>
                        </div>
                        <select
                            name="category"
                            id=""
                            class="py-3 md:hidden focus:outline-none bg-indigo-200 px-2 text-indigo-800"
                        >
                            <option value=""> General </option>
                            <option value=""> Financial Planning</option>
                            <option value=""> inancial Checkup</option>
                            <option value=""> Challenge</option>
                            <option value=""> Category 5</option>
                        </select>
                    </div>
                    <div
                        class=" md:col-span-9  grid md:gap-4 md:grid-cols-3 grid-cols-2 lg:grid-cols-4"
                    >
                        <div
                            v-for="i in 12"
                            :key="i"
                            class="bg-gray-300 w-full md:h-24 h-22 lg:h-28 rounded-xl"
                        ></div>
                        <div class="mt-2 flex justify-end">
                            <pagination
                                :pagination="pagination"
                                :offset="offset"
                            ></pagination>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import icon2 from "../assets/images/icon2.png";
import icon1 from '../assets/images/icon_learn_1.png';

import Pagination from "../components/Pagination.vue";
export default {
    name: "Learn",
    data() {
        return {
            icon2: icon2,
            offset: 4,
            pagination: {
                yo: 4
            },
            icon1: icon1
        };
    },
    components: {
        Pagination
    }
};
</script>

<style>
#menu-category {
    display: flex;
    flex-direction: column;
}

#menu-category .active {
    font-weight: bold;
}

#menu-category li {
    padding: 4px 0px;
}
</style>
