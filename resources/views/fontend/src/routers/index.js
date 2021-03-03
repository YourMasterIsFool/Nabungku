import Home from "../views/Home.vue";
import Learn from "../views/Learn";

import Login from "../views/Login.vue";
import About from "../views/About";
import Feature from "../views/Feature";

const routers = [
    {
        path: "/",
        component: Home
    },

    {
        path: "/about",
        component: About
    },

    {
        path: "/login",
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
    }
];

export default routers;
