<template>
	<div>
		<span> {{rupiahFormat}}
		</span>
	</div>
</template>

<script>
export default {
  props:['item'],
  name: 'FormatRupiah',

  data () {
    return {

    }
  },
  computed:{
  	rupiahFormat() {
  		var	number_string = this.item.toString();
		const formatter = new Intl.NumberFormat('id-ID', {
			style: 'currency',
			currency: 'IDR',
			minimumFractionDigits: 2
		});
		// if (ribuan) {
		// 	separator = sisa ? '.' : '';
		// 	rupiah += separator + ribuan.join('.');
		// }
		
		return formatter.format(this.item);
  } 
}
}
</script>

<style lang="css" scoped>
</style>