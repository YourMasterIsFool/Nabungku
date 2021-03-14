<template>
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
                        Login
                    </h1>

                    <p
                        v-if="success == false"
                        class="mt-4 md:mt-6 text-red-400"
                    >
                        <span class="text-xs">* {{ message }}</span>
                    </p>
                    <form
                        @submit="submit"
                        id="form"
                        class="pt-6 flex flex-col "
                    >
                        <div class="form-group mb-4 flex flex-col">
                            <label for="" class="text-gray-500 mb-2  text-xs">
                                Email *
                            </label>
                            <input
                                type="text"
                                v-model="form.email"
                                placeholder="input your email"
                                style="border-width:1px;"
                                :class="[
                                    success ? '' : 'border-red-300 text-red-300'
                                ]"
                                class="bg-white focus:shadow-lg focus:border-blue-500 focus:outline-none border-gray-300 rounded-md text-xs text-gray-700 flex-1 py-3 px-4"
                            />
                        </div>
                        <div class="form-group flex flex-col">
                            <label for="" class="text-gray-500 mb-2  text-xs">
                                Password *
                            </label>
                            <input
                                type="password"
                                :class="[
                                    success ? '' : 'border-red-300 text-red'
                                ]"
                                v-model="form.password"
                                placeholder="input your password"
                                style="border-width:1px;"
                                class="bg-white focus:shadow-lg focus:border-blue-500 focus:outline-none border-gray-300 rounded-md text-xs text-gray-700 flex-1 py-3 px-4"
                            />
                        </div>

                        <div class="flex  flex-col mt-8">
                            <button
                                type="submit"
                                class="py-3 capitalize text-xs mb-2 rounded-lg bg-blue-400 hover:bg-blue-500 text-white"
                            >
                                Login
                            </button>
                            <p class="text-gray-500 mb-2 text-center text-xs">
                                or
                            </p>
                            <button
                                style="border-width:1px;"
                                class="py-3 text-xs capitalize mb-2 rounded-lg border-gray-600 text-gray-500 hover:shadow-xl hover:text-black"
                            >
                                login with google
                            </button>
                            <p class="flex  justify-center items-center">
                                <span class="text-xs text-gray-500 pr-2"
                                    >tidak punya akun ?
                                </span>
                                <router-link
                                    :to="{ name: 'register' }"
                                    class="
                            font-semibold
                        text-xs text-indigo-400 hover:text-indigo-500"
                                >
                                    register
                                </router-link>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapActions } from "vuex";
import Modal from "../components/Modal.vue";
export default {
    data() {
        return {
            form: {
                email: null,
                password: null
            },
            message: null,
            success: true
        };
    },
    components: {
        Modal
    },
    methods: {
        ...mapActions({
            login: "user/login"
        }),
        submit(e) {
            e.preventDefault();
            console.log(this.form);
            this.login(this.form)
                .then(res => {
                    this.$router.push({
                        name: "dashboard"
                    });
                })
                .catch(err => {
                    this.success = false;
                    console.log(err);
                    this.message = err.data.message;
                });
        }
    }
};
</script>

<style></style>
