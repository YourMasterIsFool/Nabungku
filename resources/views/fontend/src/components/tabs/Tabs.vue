<template>
	<div id="tabs">
		<div id="tabs-header" class="w-full h-full">
			<ul class="flex justify-around">
				<li :class="[ index == $store.state.auth.selectedIndex ? 'border-b-4 border-blue-500' : 'border-gray-200 border-b-4' ]" @click.stop.prevent="selectTab(index)" class="block cursor-pointer text-2xl font-bold capitalize  text-center flex-1 py-4 transition-all duration-500" v-for="(tab, index) in items">
					{{tab.title}}
				</li>
			</ul>
		</div>
		<div id="tabs-body" ref="tabsbody" style="height: 200px" class=" transition-all duration-1000 p-8">
			<slot ></slot>
		</div>
	</div>
</template>

<script>
export default {

  name: 'Tabs',
  props: [
  	'items'
  ],

  data () {
    return {
    	selectedIndex: 0,
    	tabs: [],
    }
  },

  methods: {
  	selectTab(selectedTab) {

  		this.$store.state.auth.selectedIndex = selectedTab
  		this.tabs.forEach((tab, index) => {
  			tab.isActive = (index == selectedTab);
  		})
  		// console.log(this.tabs[selected])


  	}
  },

  created() {
  	this.selectTab(this.$store.state.auth.selectedIndex)
  },

  mounted( ){
  	this.tabs = this.$children;
  	this.selectTab(this.$store.state.auth.selectedIndex)
  	
  }
}
</script>

<style lang="css" scoped>
</style>