<template>
  <div id="learn-result">
      <div class="w-full flex justify-center ">
          <div class="md:w-3/4 w-full md:py-12 md:px-0 p-4">
          <h1 class="md:text-2xl text-lg text-center font-bold ">
              Materi yang bisa kamu pelajari
          </h1>
            <div class="grid lg:grid-cols-3 md:mt-8 lg:mt-12 mt-4 md:grid-cols-2 gap-4">
                <div style="" @click="$router.push({ name:'LearnArticle', params: { article_id : materi.id} })" :key="materi" v-for="(materi, index) in materis.slice(0, 6)">
                    <img :src="'/images/'+materi.images_url" style="height:150px;" class="rounded-xl" alt="">
                    <div class="mt-4 text-center md:px-4 px-2 md:mt-6 ">
                       <span class="md:text-base text-xs font-bold">
                            {{materi.title}}
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
        materis: null
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
                this.materis = resp.data.data.materis
            })
            .catch((err) => {
                console.log(err);
            })
        }
    },
    mounted(){
        if(this.materis == null) {
            this.fetchMateri()
        }
    }
}
</script>

<style>

</style>