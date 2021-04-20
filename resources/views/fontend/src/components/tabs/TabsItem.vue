<template>
	<div :style="[isActive ? {'margin-left': '0'} : {'margin-left': '-100vh'}]" :class="[isActive? 'h-auto' : 'h-0  overflow-hidden ']" class="transition-all duration-500 " ref="tabsitem">
		<slot></slot>
	</div>
</template>

<script>
	export default {
		props:{
			selected: {
				required:false,
			}
		},
		data(){
			return {
				isActive: false,
			}
		},
		mounted() {
			this.isActive = this.selected
		}
	}
</script>