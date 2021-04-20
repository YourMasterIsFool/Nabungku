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
                            class="w-full py-20 px-20 flex flex-col justify-center bg-yellow-200 rounded-xl items-center"
                        >       
                            <div v-show="showAmount == false"  class="flex-col flex items-center">
                                <h1 class="text-2xl flex mb-12 text-center font-bold">
                                    Kamu perlu menabung <span class="text-blue-500 px-2 ">
                                        
                                        <format-rupiah :item="goals.spentMoney"></format-rupiah>
                                    </span>                                    
                                    perbulannya
                                </h1>
                                <h2 class="text-lg px-20 text-center ">
                                    Jangan lupa menyisihkan minimal 10 hingga 30 persen dari 
                                    pendapatanmu untuk ditabung ya!  
                                </h2>
                            </div>
                            <div v-show='showAmount' class="">
                                <div class="flex justify-around">
                                    <div class="flex-1 mx-4">
                                        <h1
                                            class="font-semibold focus:outline-none lg:mb-6 md:mb-4 mb-2 text-gray-800 text-lg"
                                        >
                                            Start Balancae
                                        </h1>
                                        <input
                                            v-model="goals.start_balance"
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
                                            v-model="goals.goals_amount"
                                            type="text"
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
                                            type="month"
                                            v-model="goals.finishBy"
                                            class="w-60 px-3 text-xs  py-3 w-full  focus:outline-none text-gray-800 bg-white rounded-2xl"
                                        />
                                    </div>
                                </div>
                            </div>

                            <button v-show="showAmount" @click="calculateAmount()" class="mt-16 px-8 py-3 rounded-lg bg-purple-600 text-white">
                                Hitung
                            </button>

                             <button v-show="showAmount == false" @click="showAmount=true" class="mt-16 px-8 py-3 text-xl font-bold rounded-lg text-indigo-400">
                                Hitung Ulang
                            </button>
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
                        <div v-show="financial.penghasilan.modal" id="penghasilan" class="p-12 rounded-2xl bg-blue-100">
                            <h3
                                class="capitalize text-lg block mb-4 md:mb-6"
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
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        gaji</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.penghasilan.gaji"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div
                                    class="form-group md:mb-4 mb-2 grid grid-cols-12"
                                >
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        Bunga atau investasi</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.penghasilan.investasi"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div class="form-group md:mb-4 mb-2 grid grid-cols-12">
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        pendapatan pasif</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.penghasilan.pendapatan_pasif"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                 <div class="form-group grid grid-cols-12">
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        Pendapatan Lainnya</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.penghasilan.pendapatan_lainnya"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div class="flex w-full justify-end mt-12">
                                    <a @click="(financial.pengeluaran.modal = true, financial.penghasilan.modal = false)" class="rounded-full text-white bg-blue-500 w-8 h-8 flex items-center justify-center">
                                        <span class="material-icons">
                                            arrow_forward
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div  id="pengeluaran" v-show="financial.pengeluaran.modal" class="p-12 rounded-2xl bg-red-100">
                            <h3
                                class="capitalize text-lg block mb-4 md:mb-6"
                            >
                                pengeluaran
                            </h3>
                            <div class="flex flex-col items-start">
                                <div
                                    class="form-group md:mb-4 mb-2 grid grid-cols-12"
                                >
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        donasi</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.pengeluaran.donasi"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div
                                    class="form-group md:mb-4 mb-2 grid grid-cols-12"
                                >
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        Tabungan atau investasi</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.pengeluaran.investasi"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div class="form-group  md:mb-4 mb-2 grid grid-cols-12">
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                        Cicilan atau utang</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.pengeluaran.utang"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                 <div class="form-group grid grid-cols-12">
                                    <label
                                        align-middle
                                        for=""
                                        class="col-span-4 self-center text-black capitalize"
                                    >
                                       Belanja Bulanan</label
                                    >
                                    <input
                                        type="number"
                                        v-model="financial.pengeluaran.belanja"
                                        class="bg-white col-span-8 rounded-xl px-4 py-3"
                                    />
                                </div>
                                <div class="flex w-full justify-end mt-12">
                                    <a @click="calculateFinancial()" class="rounded-full text-white bg-blue-500 w-8 h-8 flex items-center justify-center">
                                        <span class="material-icons">
                                            arrow_forward
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>


                        <div  id="calc-finansial" v-show="financial.modal" class="p-12 rounded-2xl bg-red-100">
                             <h3
                                class="capitalize text-lg block mb-4 md:mb-6"
                            >
                                hasil
                            </h3>
                            <div class="flex flex-col mb-6 items-start">
                               
                                <div class="flex flex-col mb-6 ">
                                    <div
                                    class="form-group gap-6 md:mb-4 mb-2 grid grid-cols-12"
                                         >
                                        <label
                                            align-middle
                                            for=""
                                            class="col-span-4 self-center text-black capitalize"
                                        >
                                            Rasio Tabungan</label
                                        >
                                       <div class="w-full col-span-6 p-4 shadow-md rounded-2xl bg-white">
                                            {{financial.penghasilan.rasio !== undefined ? financial.penghasilan.rasio.toLocaleString('en-US', {maximumFractionDigits: 2}) : 0}} % 
                                       </div>
                                    </div>
                                    <p class="text-black text-sm">
                                       <span v-if="financial.penghasilan.rasio > 20">
                                           Rasio tabungan kamu sudah ideal.
                                       </span>
                                       <span v-else-if="financial.penghasilan.rasio > 10">
                                           Rasio tabungan kamu masih rendah. Nilai idealnya adalah >20%.
                                            Biasakan untuk menyisihkan minimal 10% diawal ya!
                                       </span>
                                       <span v-else>
                                           Rasio tabungan kamu tidak ideal.
                                       </span>
                                    </p>

                                </div>
                            </div>

                            <div class="flex flex-col mb-6 items-start">
                               
                                <div class="flex flex-col mb-6 ">
                                    <div
                                    class="form-group gap-6 md:mb-4 mb-2 grid grid-cols-12"
                                         >
                                        <label
                                            align-middle
                                            for=""
                                            class="col-span-4 self-center text-black capitalize"
                                        >
                                            Rasio Utang</label
                                        >
                                       <div class="w-full col-span-6 p-4 shadow-md rounded-2xl bg-white">
                                           {{financial.pengeluaran.rasio !== undefined ? financial.pengeluaran.rasio.toLocaleString('en-US', {maximumFractionDigits: 2}) : 0}} %
                                       </div>
                                    </div>
                                    <p class="text-black text-sm">
                                       <span v-if="financial.pengeluaran.rasio > 30">
                                          Rasio utang kamu tidak sehat. Nilai idealnya maksimal 30% dari
                                            penghasilan. Yuk belajar mengelola keuangan lebih baik lagi!
                                       </span>
                                       <span v-else>
                                           Rasio utang kamu masih ideal.
                                       </span>
                                    </p>

                                </div>
                            </div>
                            <a @click="resetFinancial" class="text-xl text-indigo-600 capitalize font-bold">
                                hitung ulang
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import notes from "../assets/images/notes.png";
import FormatRupiah from '../components/FormatRupiah';
import CardVue from "../components/Card.vue";
export default {
    components: {
        CardVue,
        FormatRupiah
    },
    data() {
        return {
            notes: notes,
            
            goals: {
                start_balance: 0,
                goals_amount: 0,
                finishBy: null,
                spentMoney: 0

            },
            financial: {
                pengeluaran : {
                    modal:false,
                    donasi: 0,
                    investasi: 0,
                    utang: 0,
                    belanja: 0,
                    rasio:0,
                },  
                penghasilan: {
                    modal:true,
                    gaji: 0,
                    investasi: 0,
                    pendapatan_pasif: 0,
                    pendapatan_lainnya: 0,
                    rasio: 0,
                },
                modal: false,

            },
            showAmount: true,
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
        },
        calculateFinancial() {
            
            let total = ((obj) => {
                let total = 0;

                for(var el in obj) {
                if(el !== "modal") {
                total+=parseInt(obj[el]);

                }
                    
                }
                return total
            }) 

            const totalPenghasilan = total(this.financial.penghasilan);
            const totalHutang = total(this.financial.pengeluaran);

            this.financial.pengeluaran.rasio = totalHutang/totalPenghasilan * 100;
            this.financial.penghasilan.rasio = totalPenghasilan/totalHutang *100;

            this.financial.pengeluaran.modal = false;
            this.financial.modal =true
            
        },
        calculateAmount(){
            this.showAmount = false;
            const now = new Date();
            const finishMonth = new Date(this.goals.finishBy);

            const calculateMonth = (finishMonth.getFullYear() - now.getFullYear()) * 12 + ((finishMonth.getMonth() +1) - (now.getMonth()+1));

            console.log(calculateMonth);
            const calculateMoney = (this.goals.goals_amount - this.goals.start_balance ) / 2  
            this.goals.spentMoney = calculateMoney
        },
        resetFinancial() {
            this.financial.modal = false;
            const clear = ((obj) => {
              

                for(var el in obj) {
                    
                if(el !== "modal") {
                    obj[el] = 0;
                }
                    
                
                }
            });

            clear(this.financial.penghasilan);
            clear(this.financial.pengeluaran);
            this.financial.penghasilan.modal = true;
            console.log(this.financial.pengeluaran.modal);

            
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
