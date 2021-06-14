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
                        // console.log(data);

                        commit(SET_USER, res.data);
                        resolve(res);
                    })
                    .catch(err => {
                        reject(err);
                    });
            });
        },

        login({ commit, dispatch }, data) {
            // console.log(data);
            return new Promise((resolve, reject) => {
                axios
                    .post("api/login/", data)
                    .then(res => {
                        commit(SET_USER, res.data.data.user_detail);
                        dispatch("attempt", res.data.data.token);
                        resolve(res.data);
                        console.log(resolve)
                        // console.log(res.data);
                    })
                    .catch(err => {
                        if (err.response) {
                            reject(err.response);
                        } 
                        console.log(err)
                        console.log(err.response)
                        // console.log(err.response);
                    });
            });
        },
        async attempt({ commit }, token) {
            if(token) {
                commit(SET_TOKEN, token);
            }

            try {
                let response = await axios.get('api/users_me');
                // console.log(token);
                // console.log(response.data);
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
                // console.log(e);
            }
        },

        update({commit}, data) {
            return new Promise((resolve, reject) => {
                axios.post('api/edit_user', data, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                .then((res) => {
                    commit(SET_USER, res.data.data);
                    // console.log(data)
                    // console.log(res)

                    resolve(res)
                })
                .catch((err) => {
                  
                    console.log(err.response)
                }) 
            })
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
