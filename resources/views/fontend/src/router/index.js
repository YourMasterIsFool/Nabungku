import Vue from 'vue';
import Home from "../views/Home.vue";
import Learn from "../views/Learn";
// import Register from "../views/Register.vue";
// import Login from "../views/Login.vue";
import About from "../views/About";
import Feature from "../views/Feature";


//learn
import LearnQuiz from '../views/learn/Quiz.vue';
import Dashboard from "../views/core/Dashboard";
import LearnHome from '../views/learn/LearnHome.vue';
import LearnArticle from '../views/learn/Article.vue';
import LearnResult from '../views/learn/Result.vue';

// feature
import Quiz1 from '../views/feature/Quiz1.vue';
import Quiz2 from '../views/feature/Quiz2.vue';
import Quiz3 from '../views/feature/Quiz3.vue';
import FeatureHome from '../views/feature/FeatureHome';
import FeatureQuiz1 from '../views/feature/FeatureQuiz1.vue';

//store
import store from '../store';
import VueRouter from 'vue-router';

Vue.use(VueRouter)

const afterAuth = ((to, from, next) => {
    if(store.getters['user/token']) {
        return next({
            name: 'dashboard'
        })
    }
    next()
})
const routers = [
    {
        path: "/",
        name: "home",
        component: Home,
        meta: { title: 'Home'},
        beforeEnter: afterAuth
    },
    {
        path: "/dashboard",
        name: "dashboard",
        component: Dashboard,
        beforeEnter:(to, from, next) => {
            if(!store.getters['user/token']) {
                return next({
                    name: 'home'
                })
            }
            next()
        },
        meta: { title: 'Dashboard'}
    },

    {
        path: "/about",
        name: "about",
        component: About,
        meta: { title: 'About'},
        beforeEnter: afterAuth

    },


    {
        path: "/learn/",
        name: "learn",
        component: Learn,
        children:  [
            {
                path: 'topic',
                name: 'topic',
                
            },
            {
                path: 'quiz',
                name: 'LearnQuiz',
                component: LearnQuiz,
                meta: { title: 'Learn Quiz'}

            },
            {
                path: 'result',
                name: 'LearnResult',
                component: LearnResult,
                meta: { title: 'Learn Result'}
            },
            {
                path: '',
                name: 'LearnHome',
                component: LearnHome,
                meta: { title: 'Learn'}
            },
            {
                path: 'article/:article_id',
                name: 'LearnArticle',
                component: LearnArticle,
                props: true,
                meta: { title: 'Learn Article'}
            },
        ],
        meta: { title: 'Learn'},
        beforeEnter: afterAuth

    },

    {
        path: "/feature/",
        name: "feature",
        component: Feature,
        beforeEnter: afterAuth,
        children: [
            {   
                path: 'quiz1',
                name : 'quiz1',
                component: Quiz1,
                meta: { title: 'Quiz 1'}

            },
            {
                path: 'feature-quiz1',
                name: 'FeatureQuiz1',
                component: FeatureQuiz1,
                meta: {
                    title: 'Feature Quiz 1'
                }
            },

             {   
                path: 'quiz2',
                name : 'quiz2',
                component: Quiz2,
                meta: { title: 'Quiz 2'}

            },
             {   
                path: 'quiz3',
                name : 'quiz3',
                component: Quiz3,
                meta: { title: 'Quiz 3'}

            },

            {
                path: '',
                name: 'feature-home',
                component:FeatureHome,
                meta: { title: 'Feature'}
            }
        ]
    },
];

const router = new VueRouter({
    mode: "history",
    routes: routers
});

router.beforeEach((to, from, next) => {
    document.title = to.meta.title

    next()
})


export default router;
