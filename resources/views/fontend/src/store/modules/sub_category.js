import axios from "axios";
import Vue from 'vue';

const ADD_SUB_CATEGORY = 'ADD_SUB_CATEGORY';
const SET_SUB_CATEGORY = 'SET_SUB_CATEGORY';
const UPDATE_SUB_CATEGORY = 'UPDATE_SUB_CATEGORY';
const REMOVE_ALL_SUB_CATEGORY = 'REMOVE_ALL_SUB_CATEGORY';
const REMOVE_SUB_CATEGORY = 'REMOVE_SUB_CATEGORY';

export default {
    namespaced: true,
    state: {
        sub_categories: []
    },
    mutations: {
        [ADD_SUB_CATEGORY] (state, data) {
            state.sub_categories.push(data)
        },

         [SET_SUB_CATEGORY] (state, data) {
            state.sub_categories = data
        },

        [UPDATE_SUB_CATEGORY] (state, data) {
            const index = state.sub_categories.findIndex(
                item => item.id === data.id
            );

            state.sub_categories[index] = data;

            Vue.set(state.sub_categories, index, data);
        },
        [REMOVE_ALL_SUB_CATEGORY] (state) {
            state.sub_categories = []
            Vue.set(state.sub_categories, []);
        },
         [REMOVE_SUB_CATEGORY] (state, id) {
             const index = state.sub_categories.findIndex(
                item => item.id === id
            );

            state.sub_categories.splice(index, 1);

        },
    },
    actions: {
        fetchSubCategory({ commit, dispatch, state }, data) {
            data.forEach( function(element, index) {
                commit(ADD_SUB_CATEGORY, element);
                dispatch('activity/fetchData', element.activity, {root:true});
            });
           
        },
        fetchSubCategoryByCategoryId({commit, state, dispatch}, categoryId) {
            // return new Promise((resolve, reject) => {
            //     axios
            //         .get("api/sub_category", {
            //             params: {
            //                 category_id: categoryId
            //             }
            //         })
            //         .then(res => {


            //             res.data.data.forEach( function(element, index) {
            //                 if(state.sub_categories.length == 0 || !state.sub_categories.find(item => item.id === categoryId).length > 0) {
            //                     commit(ADD_SUB_CATEGORY, element);
            //                 }
            //             });
            //         })
            //         .catch(err => {
            //             if(err) {
            //                 console.log(err.response);
            //             }
            //         });
            // });
        },
           storeSubCategory({ commit, dispatch }, payload) {
            return new Promise((resolve, reject) => {

                axios
                    .post("api/sub_category", payload)
                    .then(res => {
                     
                        resolve(res);
                        const data = res.data.data;
                        commit(ADD_SUB_CATEGORY, data);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response)
                            console.log(err.response);
                        }
                        else {
                            reject(err)
                        }
                    });
            });
        },
        editSavingGoals({commit}, data) {
            return new Promise((resolve, reject) => {
                console.log(data);  
                axios.patch('api/sub_category/'+ data.id, data)
                .then((res) => {
                    commit(UPDATE_SUB_CATEGORY, res.data.data)
                    resolve(res);
                })
                .catch((err) => {

                    reject(err)
                    console.log(err.response);
                })
            })
        },
        removeSelectedSub({commit,dispatch}, payload) {
            payload.forEach((el, index) => {
                dispatch('removeSub', el);
            });
        },
        updateSubCategory({commit, dispatch}, payload) {
            commit(UPDATE_SUB_CATEGORY, payload);
            return new Promise((resolve, reject) => {
                commit(UPDATE_SUB_CATEGORY, payload);
                axios.patch('api/sub_category/'+payload.id, payload)
                .then((res) => {
                    
                  
                   resolve(res);
                })
                .catch((err) => {
                    if(err.response) {
                        reject(err.response);
                        console.log(err.response);
                    }
                    else {
                        console.log(err);
                    }
                })

            })
        },
        deleteAllSubCategory({commit}){
            commit(REMOVE_ALL_SUB_CATEGORY);
        },
        removeSub({commit}, id) {
            commit(REMOVE_SUB_CATEGORY, id);
           return new Promise((resolve, reject) => {
             axios.delete('api/sub_category/'+id)
            .then((res) => {
                resolve(res);
                
            })
            .catch((err) => {
                reject(err);
            })
           })
            
        },
        
    },
    getters: {
        subCategoryById: state => id => {
            return state.sub_categories.find(item => item.id == id);
        },

        sub_categories(state, getters, rootState, rootGetters) {
            return state.sub_categories.map(
                sub => ({
                    ...sub,
                    activities: rootGetters['activity/activities'].filter(
                        act => act.sub_category_id == sub.id
                    )
                })
            )
        },
        
    }
};
