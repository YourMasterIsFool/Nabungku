import Vue from "vue";
import Vuex from "vuex";
import user from "./modules/user";
import category from "./modules/category";
import sub_category from "./modules/sub_category";
import budget from "./modules/budget";
Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        user,
        category,
        budget,
        sub_category
    }
});
