import Vue from "vue";
import App from "./src/App.vue";
import VueRouter from "vue-router";
import Home from "./src/views/Home";
import axios from "axios";
import routers from "./src/routers";
import store from "./src/store";
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';


require('./src/store/subscriber');
Vue.use(VueRouter);

const router = new VueRouter({
    mode: "history",
    routes: routers
});

store.dispatch('user/attempt', localStorage.getItem('token')).then(() => {
	const app = new Vue({
    render(h) {
        return h(App);
    },
    router,
    store
	}).$mount("#app");

});

