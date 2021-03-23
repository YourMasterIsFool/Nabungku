import axios from "axios";
const SET_USER = "SET_USER";
const SET_TOKEN = "SET_TOKEN";

export default {
    namespaced: true,
    state: {
        user: null,
        token: null
    },
    mutations: {
        [SET_USER](state, data) {
            state.user = data;
        },
        [SET_TOKEN](state, token) {
            state.token = token;
        }
    },
    actions: {
        register({ commit }, data) {
            return new Promise((resolve, reject) => {
                axios
                    .post("api/register", data)
                    .then(res => {
                        console.log(data);

                        commit(SET_USER, res.data);
                        resolve(res);
                    })
                    .catch(err => {
                        console.log(err.response.data);
                        reject(err.response);
                    });
            });
        },

        login({ commit, dispatch }, data) {
            return new Promise((resolve, reject) => {
                axios
                    .post("api/login", data)
                    .then(res => {
                        console.log(res.data);
                        dispatch("attempt", res.data.data.token);
                        resolve(res.data);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response.data);
                        } else {
                            reject(err.response);
                        }
                    });
            });
        },
        attempt({ commit }, token) {
            localStorage.setItem("token", token);
            commit(SET_TOKEN, token);
        }
    },
    getters: {
        budgets: state => {
            return state.budgets;
        }
    }
};
