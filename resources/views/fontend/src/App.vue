<template>
    <div id="app">
        <div style="height: 100px" id="navigation">
            <navigation></navigation>
        </div>

        <div id="main-content">
            <router-view></router-view>
        </div>

        <div id="footer">
            <Footer></Footer>
        </div>
    </div>
</template>

<script>
import Home from "./views/Home.vue";
import Footer from "./components/Footer.vue";
import Navigation from "./components/Navigation.vue";
export default {
    components: {
        Home,
        Navigation,
        Footer
    }
};
</script>

<style>
#app {
    font-family: "Poppins", Courier, monospace;
}
</style>
