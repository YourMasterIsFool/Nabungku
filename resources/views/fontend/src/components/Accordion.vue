<template>
	<div>
		<div ref="accordion" style="border-bottom: 2px solid lightgray" class="border-gray-200 cursor-pointer py-4 px-2 accordion">
			<div @click="show = true"  class="cursor-pointer header flex justify-between">
				<span class="text-black text-lg">
					{{item.header}}
				</span>
				<span :style="[]" class="material-icons">
					expand_less
				</span>
			</div>
			<div :class="[ show ? 'h-auto py-4' : 'overflow-hidden h-0']"ref="faq_body" class="body text-left transition-property:height duration-300 text-xs text-gray-600">
				<p class="leading-5">
				{{item.body}}	
				</p>
			</div>
		</div>
	</div>
</template>

<script>
export default {

  name: 'Accordion',
  props: [
  'item'
  ],
  data () {
    return {
    	show: false
    }
  },
  methods: {
  	close(e) {
  		const accordion = this.$refs.accordion
  		if(accordion) {
  			if(accordion !== e.target && !accordion.contains(e.target) ) {
	  			this.show = false
	  			console.log('close');
  			}
  		}
  	}
  },
  created(){
  	document.addEventListener('click', this.close)
  	this.$refs.accordion
  }
}
</script>

<style lang="css" scoped>
</style>