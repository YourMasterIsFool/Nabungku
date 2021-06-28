<template>
  <div id="artikel">
      <div class="flex justify-center">
          <div class="md:w-3/4 w-full md:px-0 p-4 md:py-12 ">
            <div class="flex flex-col items-center">
                <h1 class="md:text-2xl lg:mb-12 md:mb-8 mb-4 font-bold text-center">
                    {{article.title}}
                </h1>
                <img :src="'/images/'+article.images_url" class="w-4/5 h-auto rounded-xl" alt="">
                <div id="content" class="text-gray-700 lg:py-20 md:py-16 py-8 md:px-6 px-4 md:text-sm lg:text-base text-xs ">
                    <div v-html="article.body" class="leading-8 text-justify"></div>
                    
                </div>
                
               <div class="flex justify-center">
                    <a  @click="$router.push({ path:'/learn' })"  class="mt-12 text-blue-400 hover:text-blue-500 cursor-pointer text-center">
                    Back
                </a>
               </div>
            </div>
          </div>
      </div>
  </div>
</template>

<script>
export default {
    name:'Article',
    props: [
        'article_id'
    ],
    data(){
        return {
            article: null,
        }
    },
    computed: {
        parseBody() {
            return this.article.body.innerHTML
        }
    },
    created() {
        // console.log(this.article_id);
        axios.get('/api/materi_pembelajaran/'+this.article_id)
        .then((resp) => {
           this.article = resp.data.data
        })
        .catch((err) => {
            console.log(err);
        })
    }
}
</script>

<style>

</style>