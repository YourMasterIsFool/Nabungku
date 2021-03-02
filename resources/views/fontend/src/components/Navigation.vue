<template>
    <div id="navigation">
        <Register
            v-show="showRegister"
            @close="showRegister = false"
            @login="showLogin = true"
        />
        <Login v-show="showLogin" @close="showLogin = false" />
        <div
            style="height:100px"
            class="h-full lg:items-center px-4 md:px-6 md:flex md:justify-center w-full"
        >
            <div
                class="md:w-3/4 w-full h-full flex items-center justify-between"
            >
                <div class="flex items-center justify-start">
                    <div class="brand">
                        <router-link to="/">
                            <h2
                                class="font-semibold text-gray-800 lg:text-xl capitalize"
                            >
                                nabung yuk
                            </h2>
                        </router-link>
                    </div>
                    <ul
                        class="md:pr-4 hidden lg:flex text-gray-600 lg:pl-8 flex menu"
                    >
                        <li class="px-6">
                            <router-link
                                to=""
                                class="capitalize hover:text-black transition-all duration-300"
                            >
                                Learn
                            </router-link>
                        </li>
                        <li class="px-6">
                            <router-link
                                to=""
                                class="capitalize hover:text-black transition-all duration-300"
                            >
                                feature
                            </router-link>
                        </li>
                        <li class="px-6">
                            <router-link
                                to="about"
                                class="capitalize hover:text-black transition-all duration-300"
                            >
                                about
                            </router-link>
                        </li>
                    </ul>
                </div>
                <div class="hidden lg:block">
                    <router-link
                        to="/login"
                        class="mx-2 text-gray-600 hover:text-black transtion-all duration-300"
                    >
                        Login
                    </router-link>
                    <router-link
                        to="/register"
                        class="px-6 mx-2 font-semibold border-2 hover:border-none border-indigo-400 text-indigo-400 hover:bg-indigo-400 hover:text-white transition-all duration-300 rounded-2xl py-2 bg-none text-black text-sm capitalize"
                        @click="showRegister = true"
                    >
                        sign up
                    </router-link>
                </div>
                <a
                    href=""
                    class=" lg:hidden text-gray-600 hover:text-black transtion-all duration-300"
                >
                    <i class="fas fa-bars"> </i>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
import Login from "../views/Login";
import Register from "../views/Register";
export default {
    components: {
        Login,
        Register
    },
    data() {
        return {
            showRegister: false,
            showLogin: false
        };
    }
};
</script>

<style lang="stylus"></style>
