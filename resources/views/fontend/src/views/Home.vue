<template>
    <div id="home">
        <Register
            v-show="showRegister"
            @close="showRegister = false"
            @login="showLogin = true"
        />
        <Login v-show="showLogin" @close="showLogin = false" />
        <div class="w-full flex lg:pt-6 pt-4 justify-center h-screen">
            <div class="w-3/4 flex justify-center  relative">
                <img
                    :src="hero1"
                    style=""
                    class="top-0 z-0  left-0 absolute w-full"
                    alt=""
                />
                <div class="w-3/5 z-10 text-center lg:mt-28 md:mt-20">
                    <h1
                        class="block text-gray-900 font-bold md:mb-4 lg:mb-10 text-3xl"
                    >
                        Buat kamu yang susah nabung,
                    </h1>
                    <h2
                        class=" block text-xs md:text-sm lg:text-base mb-16 md:mb-24"
                    >
                        Pernah ngga kamu ngerasa baru gajian kok uang udah abis
                        aja ya? Selain itu, bagaimana dengan tabungan untuk
                        hal-hal yang kamu impikan tetapi tidak pernah tercapai?
                        Jika itu adalah masalahmu, mulai belajar nabungyuk!
                    </h2>
                    <a
                        @click="showRegister = true"
                        class="px-10 py-3 hover:bg-indigo-400 transition-all duration-300 cursor-pointer font-semibold  capitalize rounded-3xl bg-indigo-500 text-white "
                    >
                        get started
                    </a>
                </div>
            </div>
        </div>
        <div
            class="w-full flex-col flex px-4 md:justify-start md:items-center lg:py-12 md:py-8 py-6 "
        >
            <h1
                class="block text-center mb-12 md:mb-24 lg:mb-32 text-gray-900 font-bold md:mb-4 lg:mb-6 text-2xl"
            >
                Kebiasaan sepele yang bikin gagal nabung
            </h1>
            <div class="w-full md:w-3/4 flex-col items-center">
                <div
                    class="grid lg:grid-cols-4 lg:gap-12 md:grid-cols-2 gap-4 md:gap-6 "
                >
                    <card
                        class="bg-blue-100 rounded-2xl"
                        v-for="desc in description1"
                        :key="desc"
                    >
                        <template v-slot:content>
                            <div class="">
                                <div style="min-height: 200px;" class="relative ">
                                    <div style="bottom: 0px;" class="absolute flex flex-col items-center p-6">
                                             <div style="">
                                                <img
                                                class="rounded-lg mb-4 transition-all duration-500 "
                                                :src="desc.img"
                                                alt=""
                                            />
                                            </div>
                                            <div class="text-center text-gray-800">
                                                <h1 class="font-semibold">
                                                    {{desc.text}}
                                                </h1>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </template>
                    </card>
                </div>
            </div>
        </div>
        <div
            class="w-full items-center flex-col flex px-4 md:justify-start md:items-center lg:py-12 md:py-8 py-6 "
        >
            <h1
                class="block text-center mb-12 md:mb-20 lg:mb-24 text-gray-900 font-bold md:mb-4 lg:mb-6 text-2xl"
            >
                Beberapa tips berguna buat kamu!
            </h1>
            <div class="w-full md:w-3/4 flex-col items-center">
                <div class="grid grid-cols-1 md:grid-cols-12  md:gap-8 ">
                    <div
                        class="col-span-full md:col-span-6 flex mb-4 md:mb-0 justify-center"
                    >
                        <img :src="desc2_img" class=" " alt="" />
                    </div>

                    <div class="flex-col  md:col-span-6">
                        <div id="desc2" class=" py-4 md:py-8 grid grid-cols-12" @mouseover="imageChange(index)" v-for="(desc, index) in desc2">
                            <div
                                class="hover:h-20 hover:w-20 w-16 h-16 col-span-3 md:col-span-2 rounded-full  bg-red-400"
                            ></div>
                            <h1 class="col-span-8 text-sm">
                                {{desc.text}}
                            </h1>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
        <div class="w-full  px-4  lg:py-12 md:py-8 py-6 ">
            <div class="w-full md:flex  md:justify-center">
                <h1
                    class="block text-center align-middle mb-12 md:mb-20 lg:mb-24 text-gray-900 font-bold md:mb-4 lg:mb-6 text-2xl"
                >
                    Banyak pilihan materi lainnya
                    <p>yang bisa kamu pelajari</p>
                </h1>
            </div>
            <div
                class="md:gap-4 lg:mb-12  relative lg:gap-10 gap-6 grid grid-cols-1"
            >
                <div class="grid  grid-cols-4 ml-56">
                    <div class="w-60 h-32 rounded-xl bg-red-100"></div>
                    <div class="w-60 h-32 rounded-xl bg-red-200"></div>
                    <div class="w-60 h-32 rounded-xl bg-blue-200"></div>
                    <div class="w-60 h-32 rounded-xl bg-blue-100"></div>
                </div>
                <div class="grid grid-cols-4 mr-56">
                    <div class="w-60 h-32 rounded-xl bg-red-200"></div>
                    <div class="w-60 h-32 rounded-xl bg-red-400"></div>
                    <div class="w-60 h-32 rounded-xl bg-blue-300"></div>
                    <div class="w-60 h-32 rounded-xl bg-blue-200"></div>
                </div>
            </div>
            <div class="w-full flex justify-center">
                <a
                    href=""
                    class="text-center capitalize text-blue-500 hover:text-blue-400  duration-300 transition-colors"
                >
                    lihat semua
                </a>
            </div>
        </div>
        <div
            class="w-full items-center flex-col flex px-4 md:justify-start md:items-center lg:py-12 md:py-8 py-6 "
        >
            <h1
                class="block text-center mb-12 md:mb-20 lg:mb-24 text-gray-900 font-bold md:mb-4 lg:mb-6 text-2xl"
            >
                Beberapa tips berguna buat kamu!
            </h1>
            <div class="w-full md:w-3/4 flex-col items-center">
                <div class="md:grid flex flex-col md:grid-cols-2  md:gap-2 ">
                    <div class="flex flex-col md:p-8 justify-center">
                        <h1
                            class="block text-center space-x-reverse text-gray lg:mb-8 md:mb-6 mb-4 font-bold capitalize lg:text-xl md:text-lg text-base"
                        >
                            Mulai Nabungyuk!
                        </h1>
                        <p
                            class="text-center md:mb-8 lg:mb-12 mb-4 text-gray-700 lg:text-base md:text-sm text-xs"
                        >
                            Lorem ipsum dolor sit amet, consectetur adipiscing
                            elit ut aliquam, purus sit amet luctus venenatis,
                            lectus magna fringilla urna
                        </p>
                        <div class="flex justify-center">
                            <a
                                @click="showRegister = true"
                                class="md:px-8 text-sm capitalize cursor-pointer font-semibold rounded-3xl lg:px-12 px-8  lg:py-4 py-3 lg:text-base md:text-sm text-xs bg-indigo-600 hover:bg-indigo-500 transition-all duration-300 text-white"
                            >
                                get started
                            </a>
                        </div>
                    </div>
                    <div class=" flex mb-4 md:mb-0 justify-center">
                        <img :src="desc3_img" class=" " alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Register from "./Register";
import Modal from "../components/Modal.vue";
import Logo from "../assets/images/logo.png"
import icon1 from "../assets/images/icon1.png";

import des1 from "../assets/images/description1_1.png"
import des2 from "../assets/images/description1_2.png"
import des3 from "../assets/images/description1_3.png"
import des4 from "../assets/images/description1_4.png";

import desc2_1 from "../assets/images/desc2_1.png";
import desc2_2 from "../assets/images/desc2_2.png";
import desc2_3 from "../assets/images/desc2_3.png";

import desc3_img from '../assets/images/desc3.png';
import Card from "../components/Card";
import noteImage from "../assets/images/notes.png";
import hero1 from "../assets/images/hero1.png";
import Login from "./Login.vue";
export default {
    name: "Home",
    data() {
        return {
            hero1: hero1,
            logo: Logo,
            noteImage: noteImage,
            icon1: icon1,
            showRegister: false,
            aggree: false,
            showLogin: false,
            desc2_img: desc2_1,
            desc3_img: desc3_img,
            description1: [
                {
                    img: des1,
                    text: "Pengeluaran Banyak"
                },
                {
                    img: des2,
                    text: "Emotional Spending"
                },
                {
                    img: des3,
                    text: "Nabungnya Nanti Aja"
                },
                {
                    img: des4,
                    text: "Malas Mencatat Keuangan"
                },
            ],
           desc2: [
                {   
                    img: desc2_1,
                    text: "Lorem ipsum exercitation sunt velit incididunt in magna enim exercitation eiusmod dolore non in exercitation aute voluptate laboris anim tempor velit voluptate."
                },
                {   img: desc2_2,
                    text: "Deserunt deserunt nulla ea reprehenderit occaecat laborum aliqua fugiat labore."
                },
                {   img: desc2_3,
                    text: "Deserunt deserunt nulla ea reprehenderit occaecat laborum aliqua fugiat labore."
                }
           ] 
        };
    },
    methods: {
        imageChange(id) {
            this.desc2_img = this.desc2[id].img;
        }
    },
    components: {
        Card,
        Modal,
        Register,
        Login
    }
};
</script>

<style>
#home #modalForm input:focus {
    box-shadow: 0px 2px 1px 1px rgba(110, 197, 238, 0.178);
}

#desc2:hover div {
    width: 5rem;
    height: 5rem;
    transition: all;
    transition-duration: .5s
} 

#desc2:hover h1 {
    padding-left: .5rem;
    font-weight: bold;
    transition: all;
    transition-duration: .5s
}
</style>
