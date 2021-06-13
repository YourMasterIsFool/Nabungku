<template>
      <div id="login" class="w-full">
       
       <span class="text-red-400 text-sm ">
           {{errors}}
       </span>
       
        <div class="w-full grid grid-cols-2 gap-2">
            <div class="form-group" :class="[ errors == null ? 'border-gray-200' : 'border-red-400']">
              
                <input v-model="form.firstname" type="text" class="input">
                  <label for="" :class="[form.firstname == '' ? 'label' : 'inputHasValue']" >
                    nama depan
                </label>

                
            </div>
            <div class="form-group" :class="[ errors == null ? '' : 'border-red-400']">
                
                <input type="text"  v-model="form.lastname" class="input">
                <label for=""  :class="[form.lastname == '' ? 'label' : 'inputHasValue']"  >nama belakang</label>
            </div>
            <div class="form-group" :class="[ errors == null ? 'border-gray-200' : 'border-red-400']">
              
                <input v-model="form.email" type="text" class="input">
                  <label for="" :class="[form.email == '' ? 'label' : 'inputHasValue']" class="label">
                    email
                </label>

                
            </div>
            <div class="form-group" :class="[ errors == null ? 'border-gray-200' : 'border-red-400']">
              
                <input v-model="form.password" type="password" class="input">
                  <label for="password" :class="[form.email == '' ? 'label' : 'inputHasValue']">
                   password
                </label>

                
            </div>
        </div>
        <div class="flex py-2 justify-between items-center">
            <div>
                <button @click="register" class="px-12 bg-blue-400 mr-2 rounded-full py-2 text-white font-bold capitalize">
                    sign up
                </button>
                <span class="text-gray-600 text-xs capitalize">
                    forgot? <a class="cursor-pointer capitalize font-semibold text-blue-500">
                        password
                    </a>
                </span>
            </div>
            <div>
                 <span class="text-gray-600 text-xs capitalize">
                    sudah punya akun?  <a @click="login" class="cursor-pointer capitalize font-semibold text-blue-500">
                        login
                    </a>
                </span>
            </div>
        </div>
       
    </div>
</template>

<script>
import Modal from "../components/Modal.vue";
import { mapActions } from "vuex";
export default {
    data() {
        return {
            aggree: false,
            form: {
                firstname: "",
                lastname: "",
                email: "",
                password: null,
            },
            errors: null
        };
    },
    methods: {
        ...mapActions({
            createUser: "user/register"
        }),
        register(e) {
            e.preventDefault();
          
            this.createUser(this.form).then(res => {
                this.$parent.$parent.selectTab(0)
            }).catch ((err) => {
              
                this.errors = err.response.data.message
            });
        },
        login() {
            this.$parent.$parent.selectTab(0);
        }
    },
    components: {
        Modal
    }
};
</script>

<style></style>
