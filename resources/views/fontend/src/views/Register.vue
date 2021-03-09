<template>
    <div id="register">
        <div id="login">
            <div class="w-full h-screen grid md:grid-cols-3">
                <div class="background col-span-2">
                    <!-- <img src="" alt=""> -->
                    <div class="bg-green-200 w-full h-full"></div>
                </div>
                <div class="py-12 px-16">
                    <router-link
                        :to="{ name: 'home' }"
                        class="text-gray-500 hover:text-black transition-all duration-300"
                    >
                        <i class="fas fa-chevron-left pr-4"></i>
                        <span>
                            Back
                        </span>
                    </router-link>
                    <div class="pt-8 ">
                        <h1 class="text-2xl text-center font-bold ">
                            Register Your Account
                        </h1>
                        <form
                            id="form"
                            class="pt-8 flex flex-col "
                            @submit="register"
                        >
                            <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                                <label
                                    class="capitalize text-xs  block mb-2 text-gray-600"
                                >
                                    your name*
                                </label>
                                <input
                                    placeholder="input your name"
                                    v-model="form.name"
                                    type="text"
                                    style="border-width:1px;"
                                    class="w-full border-gray-300 text-xs focus:border-blue-400 focus:outline-none rounded-lg px-4 py-3  text-xs  text-gray-500"
                                />
                            </div>
                            <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                                <label
                                    class="capitalize text-xs  block mb-2 text-gray-600"
                                >
                                    email address*
                                </label>
                                <input
                                    placeholder="input your email address"
                                    v-model="form.email"
                                    type="text"
                                    style="border-width:1px;"
                                    class="w-full border-gray-300 focus:border-blue-400 focus:outline-none rounded-lg  px-4 py-3  text-xs  text-gray-500"
                                />
                            </div>
                            <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                                <label
                                    class="capitalize text-xs block mb-2 text-gray-600"
                                >
                                    create password*
                                </label>
                                <input
                                    type="text"
                                    v-model="form.password"
                                    placeholder="input your password"
                                    style="border-width:1px;"
                                    class="w-full border-gray-300  text-xs focus:border-blue-400 focus:outline-none rounded-lg  px-4 py-3  text-xs  text-gray-500"
                                />
                            </div>

                            <div class="flex lg:mb-4 mb-3 items-center">
                                <input
                                    type="checkbox"
                                    v-model="aggree"
                                    style="border:1px"
                                    class="border-blue-300  mr-2 md:mr-4"
                                />
                                <span class="text-gray-600 text-xs">
                                    I agree to terms & conditions
                                </span>
                            </div>

                            <button
                                type="submit"
                                :disabled="aggree == false"
                                :class="[
                                    aggree
                                        ? 'hover:bg-blue-500 duration-300 transition-all'
                                        : ''
                                ]"
                                class="capitalize font-semibold lg:mb-3 mb-2  w-full rounded-lg md:py-3 py-2 text-white bg-blue-400"
                            >
                                register account
                            </button>

                            <p
                                class="text-gray-400 capitalize font-semibold text-center  mb-2 text-xs"
                            >
                                or
                            </p>

                            <a
                                href=""
                                class="relative mb-4 py-3 block border-gray-300 shadow-md rounded-lg "
                                style="border-width:1px; "
                            >
                                <div class="flex items-center justify-center">
                                    <i
                                        class="fab absolute left-10 fa-google"
                                    ></i>
                                    <span class="text-black">
                                        sign in with google
                                    </span>
                                </div>
                            </a>
                            <p class="flex justify-center items-center">
                                <span class="text-xs text-gray-500 pr-2"
                                    >sudah punya akun?
                                </span>
                                <router-link
                                    :to="{ name: 'login' }"
                                    class="
                            font-semibold
                        text-xs text-indigo-400 hover:text-indigo-500"
                                >
                                    Login
                                </router-link>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Modal from "../components/Modal.vue";
import { mapActions } from "vuex";
export default {
    data() {
        return {
            aggree: false,
            form: {
                username: null,
                email: null,
                password: null
            }
        };
    },
    methods: {
        ...mapActions({
            createUser: "user/register"
        }),
        register(e) {
            e.preventDefault();
            this.createUser(this.form).then(res => {
                this.$router.push({
                    name: "dashboard"
                });
            });
        }
    },
    components: {
        Modal
    }
};
</script>

<style></style>
