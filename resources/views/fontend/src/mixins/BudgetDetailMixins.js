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
		lastMonthBudget() {
			const category = this.categories.filter(cat => {
				const categoriesDate = new Date(cat['created_at']);
				const currentDate = new Date();
				// console.log(categoriesDate.getMonth()+1)
				// console.log((currentDate.getMonth()+1)-1)

				return (categoriesDate.getMonth()+1 == currentDate.getMonth()) && (categoriesDate.getFullYear() == currentDate.getFullYear());

			});
			const total = category.length > 0 ?category.reduce((total, cat ) => {
				let totalSub = cat['sub_categorys'].reduce((totalLeftMonth, sub) => {
					let activity = 0 

					sub['activities'].forEach( function(element, index) {
						activity += parseInt(element['income'] - element['expense']);
					});

					return totalLeftMonth + parseInt(sub['budgeted'] + activity)
				}, 0)

				return total + parseInt(totalSub);
			}, 0) : 0;

			console.log(category);

			return total;
		},

		currentMonthBudget(){
			const category = this.categories.filter(cat => {
				const categoriesDate = new Date(cat['created_at']);
				const currentDate = new Date();


				return (categoriesDate.getMonth()+1 == currentDate.getMonth()+1) && (categoriesDate.getFullYear() == currentDate.getFullYear());

			})
			console.table(category);

			const budgeted = category.reduce((total, obj) => {
				let totalSub = 0
				obj['sub_categorys'].forEach( function(element, index) {
					total += parseInt(element['budgeted'])
				}, 0);

				return total + parseInt(totalSub);
			}, 0)

			return budgeted
		}


	}
}