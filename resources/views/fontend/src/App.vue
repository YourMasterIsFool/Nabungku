<template>
    <div id="app">
        <div v-show="homepage" style="height: 100px" id="navigation">
            <navigation></navigation>
        </div>

        <div id="main-content" class="px-4 md:px-0">
            <router-view></router-view>
        </div>

        <div v-show="defaultMenu" id="footer">
            <Footer></Footer>
        </div>
    </div>
</template>

<script>
import Home from "./views/Home.vue";
import Footer from "./components/Footer.vue";
import Navigation from "./components/Navigation.vue";
export default {
    data() {
        return {
            defaultMenu: false
        };
    },
    components: {
        Home,
        Navigation,
        Footer
    },
    computed: {
        homepage() {
            if (
                this.$route.path == "/login" ||
                this.$route.path == "/register" ||
                this.$route.path == "/dashboard"
            ) {
                return false;
            } else {
                return true;
            }
        }
    },
    created() {}
};
</script>

<style>
#app {
    font-family: "Poppins", Courier, monospace;
}
</style>
