import Vue from "vue";
import App from "./src/App.vue";
import VueRouter from "vue-router";
import Home from "./src/views/Home";
import axios from "axios";
import router from "./src/router";
import store from "./src/store";
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
import moment from 'moment'
import CKEditor from '@ckeditor/ckeditor5-vue2';

Vue.prototype.$moment = moment

console.log(process.env.MIX_BASE_URL)
console.log(process.env.MIX_BASE_URL)

if(process.env.MIX_ENV_MODE == "production") {
    axios.defaults.baseURL = process.env.MIX_BASE_URL
}
else {
    axios.defaults.baseURL = "http://localhost:8000/"
}



require('./src/store/subscriber');

Vue.use( CKEditor );



store.dispatch('user/attempt', localStorage.getItem('token')).then(() => {
	const app = new Vue({
    render(h) {
        return h(App);
    },
    router,
    store
	}).$mount("#app");

});

