import axios from 'axios';
import Vue from 'vue';
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
		},
		[SET_ACTIVITY](state, payload) {
			state.activities = payload
		},
		[REMOVE_ACTIVITY](state) {
			state.activities = []
			Vue.set(state.activities, []);
		}
	},
	actions: {
		storeActivity({commit}, data) {
			return new Promise((resolve, reject) => {
				axios.post('api/activity', data)
				.then((res) => {
					commit(STORE_ACTIVITY, res.data.data)
					resolve(res)
				})
				.catch((err) => {
					reject(err)
					console.log(err.response);
				})
			});
		},
		fetchData({commit, state},data) {
			data.forEach( function(element, index) {
				commit(STORE_ACTIVITY, element);
			});
		},

		removeActivityData({commit}) {
			commit(REMOVE_ACTIVITY);
		}
	},
	getters: {

		activities: state=> {
			return state.activities
		},
		activitiesBySubCategory: state => sub_category_id => {
			return state.activities.filter(item => item.sub_category_id === sub_category_id);
		}
	},
};