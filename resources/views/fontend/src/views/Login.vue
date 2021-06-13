<template>
    <div id="login" class="w-full">
        <span  class="text-xs text-red-400 py-4">
            {{errors}}
        </span>
        <div class="w-full grid grid-cols-2 gap-8">
            <div class="form-group" :class="[ errors == null ? 'border-gray-200' : 'border-red-400']">
              
                <input v-model="form.email" type="text" class="input">
                  <label for="" :class="[form.email == '' ? 'label' : 'inputHasValue']" class="label">
                    email
                </label>

                
            </div>
            <div class="form-group" :class="[ errors == null ? '' : 'border-red-400']">
                 <a class="absolute right-2 top-2">
                    <span class="material-icons">
                        visibility
                    </span>
                </a>
                <input type="password"  v-model="form.password" class="input pr-10">
                <label for=""  :class="[form.password == '' ? 'label' : 'inputHasValue']"  >password</label>
               
            </div>
        </div>
        <div class="flex py-2 justify-between items-center">
            <div>
                <button @click="loginUser" class="px-12 bg-blue-400 mr-2 rounded-full py-2 text-white font-bold capitalize">
                    login
                </button>
                <span class="text-gray-600 text-xs capitalize">
                    forgot? <a class="cursor-pointer capitalize font-semibold text-blue-500">
                        password
                    </a>
                </span>
            </div>
            <div>
                 <span class="text-gray-600 text-xs capitalize">
                    belum punya akun? <a @click="register" class="cursor-pointer capitalize font-semibold text-blue-500">
                        sign up
                    </a>
                </span>
            </div>
        </div>
       
    </div>
</template>

<script>
import { mapActions } from "vuex";
import Modal from "../components/Modal.vue";
export default {
    data() {
        return {
            form: {
                email: "",
                password: ""
            },
            errors : null,
        };
    },
    components: {
        Modal
    },
    methods: {
        ...mapActions({
            login: "user/login"
        }),
        loginUser() {
            
            this.login(this.form)
                .then(res => {
                    this.$store.state.auth.showAuth = false
                    this.$router.replace({
                        name: "dashboard"
                    });
                   
                })
                .catch(err => {
                    console.log(err);
                    
                    if(err.data) {
                        this.errors = err.data.message;
                    }
                    else {
                        this.errors = err.message;
                    }
                    
                    // console.log(this.error)
                    // console.log(this.$root);
                });
        },
        register() {
            this.$parent.$parent.selectTab(1)
        }
    },
    mounted() {
        console.log(this.$parent.$parent);
    }
};
</script>

<style>
    

</style>
