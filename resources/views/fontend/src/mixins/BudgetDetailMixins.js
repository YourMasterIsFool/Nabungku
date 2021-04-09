import { mapGetters } from 'vuex';

export default {
	computed: {
		total_income() {

			const categories = this.categories.map(obj => ({

				income: obj['sub_categorys'].length != 0 ? obj['sub_categorys'].reduce((acc, sub) => {
					 var total = 0;
					if(sub.activities.length != 0) {
						total = sub.activities.reduce((a, act) => {

							return a + parseInt(act.income)
						}, 0)
					}
					console.log(total);
					return acc+parseInt(total)
				},0): 0
				
				
				})
			)


			console.log(categories);
			const total = categories.reduce((acc, obj) => {
				return acc + obj.income
			}, 0)
			



			return  total;

		},


	}
}