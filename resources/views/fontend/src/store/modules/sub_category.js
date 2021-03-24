import axios from "axios";

const ADD_SUB_CATEGORY = 'ADD_SUB_CATEGORY';

export default {
    namespaced: true,
    state: {
        sub_categories: []
    },
    mutations: {
        [ADD_SUB_CATEGORY] (state, data) {
            state.sub_categories.push(data)
        }
    },
    actions: {
        fetchSubCategory({ commit }, category_id) {
            return new Promise((resolve, reject) => {
                axios
                    .get("api/sub_category", {
                        params: {
                            category_id: category_id
                        }
                    })
                    .then(res => {
                        console.log(res);
                    })
                    .catch(err => {
                        console.log(err.response);
                    });
            });
        },
        fetchSubCategoryByCategoryId(category_id) {
            return new Promise((resolve, reject) => {
                axios
                    .get("api/sub_category", {
                        params: {
                            category_id: category_id
                        }
                    })
                    .then(res => {
                        console.log(res);
                    })
                    .catch(err => {
                        if(err) {
                            console.log(err.response);
                        }
                    });
            });
        },

        
    },
    getters: {
        subCategoryById: state => id => {
            return state.sub_categories.find(item => item.id == id);
        },

        sub_categories: state  => {
            return state.sub_categories;
        }
    }
};
