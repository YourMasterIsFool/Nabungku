import Home from "../views/Home.vue";
import Learn from "../views/Learn";
import Register from "../views/Register.vue";
import Login from "../views/Login.vue";
import About from "../views/About";
import Feature from "../views/Feature";
import Dashboard from "../views/core/Dashboard";

const routers = [
    {
        path: "/",
        name: "home",
        component: Home
    },
    {
        path: "/dashboard",
        name: "dashboard",
        component: Dashboard
    },

    {
        path: "/about",
        name: "about",
        component: About
    },

    {
        path: "/login",
        name: "login",
        component: Login
    },

    {
        path: "/learn",
        name: "learn",
        component: Learn
    },

    {
        path: "/feature",
        name: "feature",
        component: Feature
    },
    {
        path: "/register",
        name: "register",
        component: Register
    }
];

export default routers;
