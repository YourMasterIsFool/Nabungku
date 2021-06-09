<template>
  <div id="quiz">
      <div class="flex justify-center">
        <div class="md:w-3/4 w-full p-4 md:py-12">
          <h1 class="font-bold text-center md:text-2xl">
            Apa Yang kamu ingin perbaiki
          </h1>
          <div class="grid md:mt-8 mt-4 md:gap-x-16 md:gap-y-8 md:grid-cols-2 grid-cols-1">
            <div :key="index" v-for="(quiz, index) in quises" class="bg-yellow-100 cursor-pointer rounded-xl h-24 w-full flex justify-center items-center">
              {{quiz.name}}
            </div>
           
          </div>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  name:"Quiz",
  data() {
    return {
      quises: [
        {
          name: 'Melunasi hutang'
        },
        {
          name: 'Menabung dana darurat'
        },
          {
          name: 'Menentukan Tujuan Keuangan'
        },
          {
          name: 'Uang cuman numpang lewat :('
        },
          {
          name: 'Menabung dana pensiun'
        },
         {
          name: 'Lainnya'
        },

      ]
    }
  }
}
</script>

<style>

</style>