import axios from "axios";
import sub_category from "./sub_category";
import sub_categories from "./sub_category";
const SET_CATEGORY = "SET_CATEGORY";
const UPDATE_CATEGORY_NAME = "UPDATE_CATEGORY_NAME";
const ADD_CATEGORY = "ADD_CATEGORY";
const REMOVE_CATEGORY = "REMOVE_CATEGORY";
const ADD_SUB_CATEGORY = "ADD_SUB_CATEGORY";
const UPDATE_SUB_CATEGORY = 'UPDATE_SUB_CATEGORY';

import Vue from 'vue';

export default {
    namespaced: true,
    state: {
        categories: []
    },
    mutations: {
        [SET_CATEGORY](state, data) {
            state.categories = data;
        },
        [ADD_CATEGORY](state, data) {
            state.categories.push(data);
        },
        [REMOVE_CATEGORY](state, id) {
            const index = state.categories.findIndex(item => item.id === id);
            state.categories.splice(index, 1);
        },
        [UPDATE_CATEGORY_NAME](state, data) {
            const index = state.categories.findIndex(
                item => item.id == data.id
            );
            state.categories[index].category_name = data.category_name;
        },
        [ADD_SUB_CATEGORY](state, data) {
            const index = state.categories.findIndex(
                item => item.id == data.category_id
            )
            if(state.categories[index].sub_categories == undefined) {
                state.categories[index].sub_categories = [];
            }
            state.categories[index].sub_categories.push(data);
        },
        [UPDATE_SUB_CATEGORY](state, payload) {
            console.log(payload.category_id);
            const index = state.categories.findIndex(
                item => item.id == payload.category_id
            );
            const subCategoryIndex = state.categories[index].sub_categories.findIndex(
                item => item.id === payload.id
            );
            state.categories[index].sub_categories[subCategoryIndex] = payload;
            Vue.set(state.categories[index].sub_categories, subCategoryIndex, payload)
            // console.log(state.categories)

        }
    },
    actions: {
        fetchData({ commit }, data) {
            return new Promise((resolve, reject) => {
                localStorage.setItem("budget_id", data);
                axios
                    .get("api/category", {
                        params: {
                            budget_id: localStorage.getItem("budget_id")
                        }
                    })
                    .then(res => {
                        
                        const data = res.dat
                        commit(SET_CATEGORY, res.data.data);
                        
                        resolve(res);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response);
                        } else {
                            reject(err);
                        }
                    });
            });
        },
        updateCategoryName({ commit }, data) {
            return new Promise((resolve, reject) => {
                axios
                    .patch("api/category/" + data.id, data)
                    .then(res => {
                        commit(UPDATE_CATEGORY_NAME, data);
                        resolve(res);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response);
                        } else {
                            reject(err);
                        }
                    });
            });
        },

        removeCategory({ commit }, id) {
            return new Promise((resolve, reject) => {
                axios
                    .delete("api/category/" + id)
                    .then(res => {
                        console.log(res);
                        commit(REMOVE_CATEGORY, id);
                        resolve(res);
                    })
                    .catch(err => {
                        console.log(err.response);
                        reject(err);
                    });
            });
        },
        addNewCategory({ commit }, data) {
            return new Promise((resolve, reject) => {
                axios
                    .post("api/category", data)
                    .then(res => {
                        commit(ADD_CATEGORY, res.data.data);
                        resolve(res);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response);
                        } else {
                            reject(err);
                        }
                    });
            });
        },
        storeSubCategory({ commit }, data) {
            return new Promise((resolve, reject) => {
                axios
                    .post("api/sub_category", data)
                    .then(res => {
                     
                        resolve(res);
                        commit(ADD_SUB_CATEGORY, res.data.data);
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
        updateSubCategory({commit}, payload) {
            console.log(payload);
            return new Promise((resolve, reject) => {

                axios.patch('api/sub_category/'+payload.id, payload)
                .then((res) => {
                    
                   commit(UPDATE_SUB_CATEGORY, res.data.data);
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
        }
    },
    getters: {
        categories: state => {
            return state.categories;
        },
        getIndex: state => id => {
            return state.categories.findIndex(item => item.id === id);
        }
    },
    modules: {}
};
