import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Vue from "vue";
import Login from "../views/Login.vue";
import About from "../views/About";

const routers = [
    {
        path: "",
        component: Home
    },

    {
        path: "/about",
        component: About
    },

    {
        path: "/login",
        component: Login
    }
];

export default routers;
