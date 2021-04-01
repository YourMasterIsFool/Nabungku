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
                        commit(SET_USER, res.data.data.user_detail);
                        dispatch("attempt", res.data.data.token);
                        resolve(res.data);
                        console.log(res.data);
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
        async attempt({ commit }, token) {
            if(token) {
                commit(SET_TOKEN, token);
            }

            try {
                let response = await axios.get('api/users_me');
                console.log(token);
                console.log(response.data);
                commit(SET_USER, response.data.data);
            }
            catch (e) {
                commit(SET_TOKEN, null);
                commit(SET_USER, null);
            }
        },
        logout({commit, state}) {
            try {
                
                commit(SET_TOKEN, null)
                commit(SET_USER, null);
            } catch(e) {
                // statements
                console.log(e);
            }
        }
    },
    getters: {
        budgets: state => {
            return state.budgets;
        },
        token: state => {
            return state.token;
        },
        user: state => {
            return state.user ? state.user : null;
        }
    }
};
