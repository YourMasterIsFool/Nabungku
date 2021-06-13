<template>
  <div id="learn-result">
      <div class="flex justify-center">
        <div class="md:w-3/4 w-full p-4 md:py-12">
          <h1 class="font-bold text-center md:text-2xl">
            Materi yang bisa kamu pelajari
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
    name:"LearnResult",

    data(){
        return {
            limit: 6,
        }
    },
    methods:{
        fetchMateri(){
            axios.get('api/materi_pembelajaran',{
             params: {
                 'limit': this.limit
             }   
            })
            .then((resp) => {
                console.log(resp)
            })
            .catch((err) => {
                console.log(err);
            })
        }
    },
    mounted(){
        this.fetchMateri()
    }
}
</script>

<style>

</style>