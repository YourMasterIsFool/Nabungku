<template>
    <div id="login">
        <div id="register">
            <div class="flex-col items-center overflow-auto">
                <div
                    class="w-full flex items-center justify-between lg:mb-8 md:mb-6 mb-4"
                >
                    <h1 class="capitalize  text-xl font-semibold">
                        Login
                    </h1>
                    <a
                        @click="$emit('close')"
                        class="
                        text-base text-gray-500 hover:text-black cursor-pointer"
                    >
                        <i class="fas fa-times"> </i>
                    </a>
                </div>
                <!-- <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                            <label
                                class="capitalize text-xs  block mb-2 text-gray-600"
                            >
                                your name*
                            </label>
                            <input
                                placeholder="input your username"
                                type="text"
                                style="border-width:1px;"
                                class="w-full border-gray-300 text-xs focus:border-blue-400 focus:outline-none rounded-lg px-4 py-3  text-xs  text-gray-500"
                            />
                        </div> -->
                <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                    <label class="capitalize text-xs  block mb-2 text-gray-600">
                        email address*
                    </label>
                    <input
                        placeholder="input your email address"
                        type="text"
                        style="border-width:1px;"
                        class="w-full border-gray-300 focus:border-blue-400 focus:outline-none rounded-lg  px-4 py-3  text-xs  text-gray-500"
                    />
                </div>
                <div class="form-group lg:mb-4 md:mb-3 mb-2 w-full">
                    <label class="capitalize text-xs block mb-2 text-gray-600">
                        password
                    </label>
                    <input
                        type="password"
                        placeholder="input your password"
                        style="border-width:1px;"
                        class="w-full border-gray-300  text-xs focus:border-blue-400 focus:outline-none rounded-lg  px-4 py-3  text-xs  text-gray-500"
                    />
                </div>
                <!-- 
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
                        </div> -->

                <button
                    class="capitalize hover:bg-blue-500 duration-300 transition-all font-semibold lg:mb-3 mb-2  w-full rounded-lg md:py-3 py-2 text-white bg-blue-400"
                >
                    Login
                </button>

                <p
                    class="text-gray-400 capitalize font-semibold text-center  mb-2 text-xs"
                >
                    or
                </p>

                <a
                    href=""
                    class="relative mb-4 py-3 block border-gray-300 hover:shadow-md rounded-lg "
                    style="border-width:1px; "
                >
                    <div class="flex items-center justify-center">
                        <i class="fab absolute left-10 fa-google"></i>
                        <span class="text-black">
                            sign in with google
                        </span>
                    </div>
                </a>
                <!-- <p class="flex justify-center items-center">
                            <span class="text-xs text-gray-500 pr-2"
                                >sudah punya akun?
                            </span>
                            <a
                                class="
                            font-semibold
                        text-xs text-indigo-400 hover:text-indigo-500"
                            >
                                Login
                            </a>
                        </p> -->
            </div>
        </div>
    </div>
</template>

<script>
import Modal from "../components/Modal.vue";
export default {
    components: {
        Modal
    }
};
</script>

<style></style>
