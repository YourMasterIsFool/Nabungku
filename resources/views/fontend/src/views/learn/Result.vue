<template>
  <div id="learn-result">
      <div class="w-full flex justify-center ">
          <div class="md:w-3/4 w-full md:py-12 md:px-0 p-4">
          <h1 class="md:text-2xl text-lg text-center font-bold ">
              Materi yang bisa kamu pelajari
          </h1>
            <div class="grid lg:grid-cols-3 md:mt-8 lg:mt-12 mt-4 md:grid-cols-2 lg:gap-x-12 md:gap-x-8 lg:gap-y-8 md:gap-y-4 gap-y-6">
                <div :key="materi" v-for="(materi, index) in materis">
                    <div class="bg-gray-200  rounded-xl h-32">

                    </div>
                    <div class="mt-4 text-center md:px-4 px-2 md:mt-6 ">
                       <span class="md:text-base text-xs font-bold">
                            {{materi.name}}
                       </span>
                    </div>
                </div>
            </div>
          </div>
      </div>
  </div>
</template>

<script>
export default {
data() {
    return {
        materis: [
            {
                name: 'Coba Praktekkan Ini Supaya Hidup Lebih Baik'
            },
            {
                name: 'Kemana Uangmu Pergi?'
            },
            {
                name: 'Tips Biar Makin Jago Mengelola Uang'
            },
            {
                name: 'Pentingkah dana darurat?'
            },
            {
                name: 'Utang sebenernya baik atau buruk sih?'
            },
            {
                name: 'Punya uang 1 Milyar, mungkin ngga ya?'
            },
        ]
    }
}
}
</script>

<style>

</style>