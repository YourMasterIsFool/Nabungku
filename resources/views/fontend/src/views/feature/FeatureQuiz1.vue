<template>
  <div id="feature-quiz">
    <div id="hero" class="md:h-screen md:w-screen w-auto h-auto relative">
        <img :src="bgFeature" class="w-full absolute h-full" alt="">
        <div class="w-full flex relative md:py-28 py-20 justify-center ">
            <div class="w-full relative md:w-3/4 flex flex-col items-center md:px-0 px-4 md:py-8 py-4"> 
                 
                <h2 class="text-center md:text-2xl text-lg font-bold">
                    Tipe Kepribadian Finansial
                </h2>
                <div class="flex w-full md:mt-6 mt-4 justify-center ">
                    <p class="md:w-3/4 text-center leading-4 md:text-base text-xs text-gray-700">
                        Ketahui apa tipe kepribadian finansial kamu supaya kamu bisa mengevaluasi bagaimana 
                        kamu merencanakan dan mengelola keuangan selama ini serta memperbaiki kebiasaan 
                        yang dirasa masih kurang oke selagi mempertahankan kebiasaanmu yang sudah baik.
                    </p>
                </div>

                <a class="md:px-6 py-2 rounded-full text-center bg-indigo-500 cursor-pointer hover:bg-indigo-600 transition-all duration-300 text-white md:mt-12 mt-6 capitalize">
                    coba quiz
                </a>
            </div>
         </div>
    </div>
    <div class="section flex justify-center md:py-20 py-16">
        <div class="md:w-3/4 ">
            <div class="padding-content">
               <div class="relative">
                   <div style="font-size:150px;" class="background-text absolute top-0 left-0 -z-1" >
                       
                   </div>
                   jancok lah
               </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
import FeatureBackground from '../../assets/images/bg-feature-quiz.png';

export default {
    name:'FeatureQuiz1',
    data(){
        return  {
            bgFeature : FeatureBackground
        }
    }
}
</script>

<style>
.padding-content {
    padding: 3rem 0;
}
</style>