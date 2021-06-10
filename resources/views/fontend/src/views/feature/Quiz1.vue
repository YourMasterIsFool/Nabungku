<template>
	<div  class="w-full flex flex-col items-center">
		<div class="w-2/4 py-24">
			<h1 class="text-2xl text-center font-bold">
				Per bulannya, aku menyisihkan 
				uang untuk ditabung sebesar...
			</h1>
			<div class="mt-4 grid grid-cols-2 gap-6">
				<div class="p-8 cursor-pointer hover:shadow-lg bg-yellow-200 rounded-2xl text-center" v-for="quiz in quizes">
					{{quiz.title}}
				</div>
			</div>


		</div>
		<a class="capitalize mb-20 font-bold text-blue-400 text-center cursor-pointer" @click="$router.push('/feature')">
			back
		</a>
	</div>
</template>

<script>
export default {

  name: 'Quiz1',

  data() {
    return {
    	quizes: [
    		{
    			title: 'Aku tidak menabung'
    		},
    		{
    			title: '30% dari pendapatan'
    		},
    		{
    			title: '>30% dari pendapatan'
    		},
    		{
    			title: '10% dari pendapatan'
    		},
    	]
    };
  },
};
</script>

<style lang="css" scoped>
</style>
