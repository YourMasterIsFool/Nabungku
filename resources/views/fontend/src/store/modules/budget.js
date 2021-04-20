import axios from "axios";
const SET_BUGDET = "SET_BUDGET";

const CREATE_BUDGET = "CREATE_BUDGET";
export default {
    namespaced: true,
    state: {
        budgets: []
    },
    mutations: {
        [SET_BUGDET](state, data) {
            state.budgets = data;
        },
        [CREATE_BUDGET](state, data) {
            state.budgets.push(data);
        }
    },
    actions: {
        fetchData({ commit }) {
            axios
                .get("api/budget")
                .then(res => {
                    commit(SET_BUGDET, res.data.data);
                    console.log(res.data.data);
                    
                     if(!res.data.data.length == 0) {
                        
                         localStorage.setItem('budget_id', res.data.data[0].id)
                     }
                     localStorage.setItem("budget_id", '');
                    
                })
                .catch(err => {
                    console.log(err);
                });
        },
        createBudget({ commit }, data) {
            return new Promise((resolve, reject) => {
                console.log(data);
                axios
                    .post("api/budget", data)
                    .then(res => {
                        commit(CREATE_BUDGET, res.data.data);
                        localStorage.setItem("budget_id", res.data.data.id);
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
        }
    },
    getters: {
        budget: state => {
            return state.budgets;
        },
        fetchBudgetById: state => id => {
            const index = state.budgets.findIndex( item => item.id = id);

            return state.budgets[index];
        }

    }
};
