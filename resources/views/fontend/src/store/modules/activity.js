import axios from 'axios';

const STORE_ACTIVITY = "STORE_ACTIVITY";
const SET_ACTIVITY = "SET_ACTIVITY";
const REMOVE_ACTIVITY = "REMOVE_ACTIVITY"

export default {
	namespaced: true,
	state: {

		activities: [],

	},
	mutations: {
		[STORE_ACTIVITY](state, payload) {
			state.activities.push(payload);
			console.log(payload);
		},
		[SET_ACTIVITY](state, payload) {
			state.activities = payload
		},
		[REMOVE_ACTIVITY](state) {
			state.activities = []
		}
	},
	actions: {
		storeActivity({commit}, data) {
			return new Promise((resolve, reject) => {
				axios.post('api/activity', data)
				.then((res) => {
					commit(STORE_ACTIVITY, res.data.data)
				})
				.catch((err) => {
					console.log(err.response);
				})
			});
		},
		fetchDataBySubCategory({commit}, sub_category_id) {
			return new Promise((resolve, reject) => {
				axios.get('api/activity', {
					params: {
						sub_category_id: sub_category_id
					}
				}).
				then((res) => {
					commit(SET_ACTIVITY, res.data.data);
					console.log(res.data);
				})
				.catch((err) => {
					console.log(err);
					console.log(err.response);
				})
			})
		},

		removeActivityData({commit}) {
			commit(REMOVE_ACTIVITY);
		}
	},
	getters: {

		activities: state=> {
			return state.activities
		}
	},
};