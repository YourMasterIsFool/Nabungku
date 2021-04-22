import Home from "../views/Home.vue";
import Learn from "../views/Learn";
import Register from "../views/Register.vue";
import Login from "../views/Login.vue";
import About from "../views/About";
import Feature from "../views/Feature";
import Dashboard from "../views/core/Dashboard";
import Quiz1 from '../views/feature/Quiz1.vue';
import Quiz2 from '../views/feature/Quiz2.vue';
import Quiz3 from '../views/feature/Quiz3.vue';
import FeatureHome from '../views/feature/FeatureHome';
import store from '../store';


const routers = [
    {
        path: "/",
        name: "home",
        component: Home
    },
    {
        path: "/dashboard",
        name: "dashboard",
        component: Dashboard,
        beforeEnter:(to, from, next) => {
            if(!store.getters['user/token']) {
                return next({
                    name: 'login'
                })
            }
            next()
        }
    },

    {
        path: "/about",
        name: "about",
        component: About
    },


    {
        path: "/learn",
        name: "learn",
        component: Learn,

    },

    {
        path: "/feature/",
        name: "feature",
        component: Feature,
        children: [
            {   
                path: 'quiz1',
                name : 'quiz1',
                component: Quiz1

            },
             {   
                path: 'quiz2',
                name : 'quiz2',
                component: Quiz2

            },
             {   
                path: 'quiz3',
                name : 'quiz3',
                component: Quiz3

            },

            {
                path: '',
                name: 'feature-home',
                component:FeatureHome
            }
        ]
    },
];

export default routers;
