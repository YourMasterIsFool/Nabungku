<template>
    <div>
        <div
            v-show="showDashboard"
            style="height:100px"
            class="h-full bg-transparent lg:items-center px-4 md:px-6 md:flex md:justify-center w-full"
        >
            <div
                class="md:w-3/4 w-full h-full flex items-center justify-between"
            >
                <div class="flex items-center justify-start">
                    <div class="brand">
                        <router-link to="/">
                            <img :src="logo" alt="">
                        </router-link>
                    </div>
                    <ul
                        class="md:pr-4 hidden lg:flex text-gray-600 lg:pl-8 flex menu"
                    >
                        <li class="px-6">
                            <router-link
                                to="/feature/"
                                class="capitalize hover:text-black transition-all duration-300"
                            >
                                feature
                            </router-link>
                        </li>
                        <li class="px-6">
                            <router-link
                                to="/about"
                                class="capitalize hover:text-black transition-all duration-300"
                            >
                                about
                            </router-link>
                        </li>
                    </ul>
                </div>
                <div class="hidden lg:block">
                    <a
                      @click="$store.state.auth.showAuth = true, $store.state.auth.selectedIndex = 0"
                            
                        class="cursor-pointer mx-2 text-gray-600 hover:text-black transtion-all duration-300"
                    >
                        Login
                    </a>
                    <button
                        @click="$store.state.auth.showAuth = true, $store.state.auth.selectedIndex = 1"
                        class="px-6 mx-2 cursor-pointer font-semibold border-2 hover:border-none text-white bg-blue-500 hover:text-white transition-all duration-300 rounded-2xl py-2 bg-none text-black text-sm capitalize"
                       
                    >
                        sign up
                    </button>
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
import Logo from "../assets/images/logo.png";
import Register from "../views/Register";
export default {
    components: {
        Login,
        Register,
        Logo
    },
    data() {
        return {
            showRegister: false,
            showLogin: false,
            logo: Logo
        };
    },
    computed: {
        showDashboard() {
            if (this.$route.path == "/dashboard") {
                return false;
            } else {
                return true;
            }
        }
    }
};
</script>

<style lang="stylus">
    a:focus
        color: #79A5FC
    
    button
        border: 1px solid #79A5FC
        
        color: #79A5FC
    button:hover
        color: #79A5FC
        background-color: #79A5FC
</style>
