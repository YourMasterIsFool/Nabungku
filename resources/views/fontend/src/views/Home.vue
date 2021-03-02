<template>
    <div id="home">
        <Register
            v-show="showRegister"
            @close="showRegister = false"
            @login="showLogin = true"
        />
        <Login v-show="showLogin" @close="showLogin = false" />
        <div class="w-full flex pt-8 md:pt-12 lg:pt-20 justify-center h-screen">
            <div class="w-3/4 flex justify-center  relative">
                <img
                    :src="hero1"
                    style=""
                    class="top-0 z-0  left-0 absolute w-full"
                    alt=""
                />
                <div class="w-3/5 z-10 text-center mt-20">
                    <h1
                        class="block text-gray-900 font-bold md:mb-4 lg:mb-6 text-3xl"
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
                        v-for="i in 4"
                        :key="i"
                    >
                        <template v-slot:content>
                            <div class="flex flex-col items-center">
                                <img
                                    class="rounded-lg mb-4 md:mb-6 lg:mb-8"
                                    :src="noteImage"
                                    alt=""
                                />
                                <div class="text-center text-gray-800">
                                    <h1 class="font-semibold">
                                        Lorem ipsum dolor sit amet, consectetur
                                        adipisicing
                                    </h1>
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
                        class="col-span-full md:col-span-4 flex mb-4 md:mb-0 justify-center"
                    >
                        <img :src="icon1" class=" " alt="" />
                    </div>

                    <div class="flex-col  md:col-span-8">
                        <div class="py-4 md:py-8 grid grid-cols-12">
                            <div
                                class="w-16 h-16 col-span-3 md:col-span-2 rounded-full  bg-red-400"
                            ></div>
                            <h1 class="col-span-8 text-sm">
                                Lorem ipsum dolor sit amet consectetur
                                adipisicing elit. Totam sequi nobis vel, rem,
                                repellat accusamus doloribus et aperiam.
                            </h1>
                        </div>
                        <div
                            class="py-4 md:pl-6 lg:pl-12 md:py-8 grid grid-cols-12"
                        >
                            <div
                                class="w-16 h-16 col-span-3 md:col-span-2 rounded-full  bg-red-400"
                            ></div>
                            <h1 class="col-span-8 text-sm">
                                Lorem ipsum dolor sit amet consectetur
                                adipisicing elit. Totam sequi nobis vel, rem,
                                repellat accusamus doloribus et aperiam.
                            </h1>
                        </div>
                        <div class="py-4  md:py-8 grid grid-cols-12">
                            <div
                                class="w-16 h-16 col-span-3 md:col-span-2 rounded-full  bg-red-400"
                            ></div>
                            <h1 class="col-span-8 text-sm">
                                Lorem ipsum dolor sit amet consectetur
                                adipisicing elit. Totam sequi nobis vel, rem,
                                repellat accusamus doloribus et aperiam.
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
                        <img :src="icon1" class=" " alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Register from "./Register";
import Modal from "../components/Modal.vue";
import icon1 from "../assets/images/icon1.png";
import Card from "../components/Card";
import noteImage from "../assets/images/notes.png";
import hero1 from "../assets/images/hero1.png";
import Login from "./Login.vue";
export default {
    name: "Home",
    data() {
        return {
            hero1: hero1,
            noteImage: noteImage,
            icon1: icon1,
            showRegister: false,
            aggree: false,
            showLogin: false
        };
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
</style>
