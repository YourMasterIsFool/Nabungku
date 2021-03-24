<template>
	<div id="input-number" ref="input_number">
		<div class="relative">
			<a class="capitalize"
				@click="showInput = true"
				v-show="showInput == false"
			>
				Rp{{item}}
			</a>
			<input type="number" v-show="showInput" v-model="form.inputNumber"  class="py-1 w-full outline-none pl-4 focus:bg-gray-100 rounded-lg border-2 border-gray-100">
		</div>
	</div>
</template>

<script>
export default {

  name: 'InputNumber',
  props: ['item', 'id', 'name'],
  data () {
    return {
    	showInput: false,
    	form: {
    		inputNumber: this.item,
    	}

    }
  },
  methods:{
  	closeModal(e) {
  		let el = this.$refs.input_number;
  		let target = e.target;

  		if(el != target && !el.contains(target) ){
  			this.showInput = false;
  			console.log(this.id)
  		}

  	}
  },
  created() {
  	document.addEventListener('click', this.closeModal);
  }
}
</script>

<style lang="css" scoped>
</style>