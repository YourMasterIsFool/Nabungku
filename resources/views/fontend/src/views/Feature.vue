<template>
    <div id="features">
        <div id="hero" class="w-full  md:flex pt-8 justify-center ">
            <div class="md:w-3/4 w-full flex flex-col items-center">
                <h1
                    class="text-3xl text-center font-bold mb-4 md:mb-6 lg:mb-20"
                >
                    Quiz
                </h1>
                <h2
                    class="text-base md:w-2/4 text-center  mb-6 md:mb-12 lg:mb-20 "
                >
                    Kenali dirimu dengan quiz ini yuk untuk cari tau sejauh apa
                    pemahaman kamu tentang keuangan pribadi kamu!
                </h2>
                <div class="grid grid-cols-3 gap-8">
                    <card-vue
                        v-for="item in 3"
                        :key="item"
                        class="bg-gray-100 shadow-xl rounded-xl hover:shadow-2xl transition-all duration-300"
                    >
                        <template v-slot:content>
                            <div class="flex flex-col items-center">
                                <div class="image lg:mb-8 md:mb-6 mb-4">
                                    <img :src="notes" alt="" />
                                </div>
                                <p
                                    class="text-center lg:mb-6 md:mb-4 mb-2 text-base font-semibold"
                                >
                                    Quiz {{ item }}
                                </p>
                                <a
                                    href=""
                                    class="py-2 text-sm px-12 rounded-3xl  bg-blue-400 hover:bg-blue-500 duration-300 transition-all text-white"
                                >
                                    Coba Quiz
                                </a>
                            </div>
                        </template>
                    </card-vue>
                </div>
                <section class="py-16 flex-col items-center">
                    <h1 class="text-center capitalize font-bold text-2xl">
                        Saving Calculator
                    </h1>
                    <div class="flex justify-center py-10">
                        <h2 class="text-center w-3/4 text-lg">
                            Pingin nabung buat liburan tapi bingung harus
                            sisihin berapa setiap bulannya? Disini kamu bisa
                            hitung jumlah dana yang perlu kamu simpan tanpa
                            ribet. Cobain deh!
                        </h2>
                    </div>
                    <div class="py-10">
                        <div
                            class="w-full py-24 px-20 flex justify-center bg-yellow-200 rounded-xl items-center"
                        >
                            <div class="">
                                <div class="flex justify-around">
                                    <div class="flex-1 mx-4">
                                        <h1
                                            class="font-semibold focus:outline-none lg:mb-6 md:mb-4 mb-2 text-gray-800 text-lg"
                                        >
                                            Monthly Income
                                        </h1>
                                        <input
                                            v-model="monthly_income"
                                            type="text"
                                            class="py-3 px-4 w-60 text-xs  focus:outline-none text-gray-800 bg-white rounded-2xl"
                                        />
                                    </div>
                                    <div class="flex-1 mx-4">
                                        <h1
                                            class="font-semibold lg:mb-6 md:mb-4 mb-2  text-gray-800 text-lg"
                                        >
                                            Goals Amount
                                        </h1>
                                        <input
                                            v-model="goals_amount"
                                            type="text"
                                            value=""
                                            class="py-3 px-4 w-60 text-xs text-gray-800 focus:outline-none bg-white rounded-2xl"
                                        />
                                    </div>
                                    <div class="flex-1 mx-4">
                                        <h1
                                            class="font-semibold lg:mb-6 md:mb-4 mb-2  capitalize text-gray-800 text-lg"
                                        >
                                            Finish By
                                        </h1>
                                        <input
                                            type="date"
                                            :value="today"
                                            class="w-60 px-3 text-xs  py-3 w-full  focus:outline-none text-gray-800 bg-white rounded-2xl"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <section class="py-16 flex justify-center">
            <div class="w-full md:w-3/4">
                <div class="grid grid-cols-2 gap-8">
                    <div class="flex flex-col justify-center">
                        <div class=" w-3/4">
                            <h1
                                class="text-2xl mb-4 md:mb-6 capitalize font-bold"
                            >
                                financial check up
                            </h1>
                            <p class="">
                                Untuk mengetahui kondisi keuangan (likuiditas,
                                tabungan, utang) supaya dapat membuat
                                perencanaan keuangan yang lebih baik
                            </p>
                        </div>
                    </div>
                    <div>
                        <div class="p-12 rounded-2xl bg-red-300">
                            <h3
                                class="capitalize font-semibold text-lg block mb-4 md:mb-6"
                            >
                                penghasilan
                            </h3>
                            <div class="flex flex-col items-start">
                                <div
                                    class="form-group md:mb-4 mb-2 grid grid-cols-12"
                                >
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 font-semibold self-center text-black capitalize"
                                    >
                                        gaji</label
                                    >
                                    <input
                                        type="text"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div
                                    class="form-group md:mb-4 mb-2 grid grid-cols-12"
                                >
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 font-semibold self-center text-black capitalize"
                                    >
                                        Bunga atau investasi</label
                                    >
                                    <input
                                        type="text"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div class="form-group grid grid-cols-12">
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 font-semibold self-center text-black capitalize"
                                    >
                                        pendapatan pasif</label
                                    >
                                    <input
                                        type="text"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import notes from "../assets/images/notes.png";
import CardVue from "../components/Card.vue";
export default {
    components: {
        CardVue
    },
    data() {
        return {
            notes: notes,
            goals_amount: 0,
            monthly_income: 0
        };
    },
    methods: {
        formatDate(date) {
            var d = new Date(date),
                month = "" + (d.getMonth() + 1),
                day = "" + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = "0" + month;
            if (day.length < 2) day = "0" + day;

            return [year, month, day].join("-");
        }
    },
    computed: {
        today() {
            const today = new Date();
            const formateDate = this.formatDate(today);

            return formateDate;
        }
    },
    created() {
        console.log(this.today);
    }
};
</script>

<style></style>
