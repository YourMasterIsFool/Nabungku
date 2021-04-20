<template>
    <div id="app">
        <div v-show="homepage" style="height: 100px" id="navigation">
            <navigation></navigation>
        </div>

        <div id="main-content" class="px-4 md:px-0">
            <router-view></router-view>
            <Auth v-if="$store.state.auth.showAuth"></Auth>
        </div>

        <div v-show="homepage" id="footer">
            <Footer></Footer>
        </div>
    </div>
</template>

<script>
import Home from "./views/Home.vue";
import Auth from './views/Auth.vue';
import Footer from "./components/Footer.vue";
import Navigation from "./components/Navigation.vue";
export default {
    data() {
        return {
            defaultMenu: false,

        };
    },
    components: {
        Home,
        Auth,
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


.form-group {
    border-width: 1px;
    border-radius: 10px;
    position: relative;
    margin-bottom: 16px;
}
.form-group .label {
    position: absolute;
    top:8px;
    text-transform: capitalize;
    transition: all;
    transition-duration: .3s;
    left:16px;
}
.form-group .input {
    display: block;
    width:100%;
    font-size: 12px;
    padding: 12px 16px;
    outline: none;
    height: 100%;
    border:none;
    background: transparent;
}

.form-group .input:focus +  .label {
    top:-10px;
    font-size: 12px;
    position: absolute;
    padding: 0px .85rem;
    color:gray;
    background: white;
}

.form-group .inputHasValue {
    top:-10px;
    position: absolute;
    font-size: 12px;
    left:16px;
    text-transform: capitalize;
    padding: 0px .85rem;
    color:gray;
    background: white;
}
</style>
