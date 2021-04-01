<template>
	<div id="simple-modal" style="z-index: 10;" ref="simple_modal">
		<div class="content" style="z-index: 20;">
			<slot name='content'>
			</slot>
		</div>
	</div>
</template>

<script>
export default {
  name: 'simpleModal',

  data () {
    return {

    }
  },
  methods: {
  	closeModal(event){
  		const target = event.target;
  		const el = this.$refs.simple_modal;
  	},
  },
  created() {
  	document.addEventListener('click', this.closeModal);
  }
}
</script>

<style lang="css" scoped>
</style>