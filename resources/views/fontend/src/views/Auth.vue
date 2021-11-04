<template>
	<div id="auth-modal">
		<Modal>
			<template v-slot:content>
				<div class="flex flex-col w-full h-full relative justify-end items-center ">

					<div style="width:1000px; height: 425px;" class=" relative flex flex-col justify-end   ">
						<a @click="$store.state.auth.showAuth = false" class="absolute cursor-pointer " style=" right:0px; top: -80px;">
							<span class="material-icons" style="font-size: 30px;">
								close
							</span>
						</a>
						<div class="absolute" style="z-index: -1; top:-200px; left:180px;">
						
							<img :src="revAuthImage" class="" style="heigt:250px; width:600px;" alt="">
						</div>
						<div class="bg-white p-4 overflow-hidden rounded-2xl shadow-md">
							<Tabs ref="tabs" class="w-full" :items="tabs">
							
								<tabs-item name="login" class="transition-all duration-500" >
									<Login></Login>
								</tabs-item>
								<tabs-item name="register" class="transition-all duration-500" >
									<Register></Register>
								</tabs-item>
						</Tabs>
					
				        
					</div>
						
					</div>
				</div>
			</template>
		</Modal>
	</div>
</template>

<script>
	import Modal from '../components/Modal.vue';
	import revAuthImage from '../assets/images/rev_auth.png';
	import Login from './Login.vue';
	import Register from './Register';
	import Tabs from '../components/tabs/Tabs.vue';
	import TabsItem from '../components/tabs/TabsItem.vue';
	export default {
		components: {
			Modal,
			Tabs,
			TabsItem,
			Login,
			Register
		},
		data() {
			return  {
				revAuthImage: revAuthImage,
				tabs: [
					{
						title: "login",
						component: Login,
					},
					{
						title: "register",
						tabs_item: 'wqdqwdqd'
					},
				]
			}
		},
		methods: {
			changeTabsItem(selectedIndex) {
				this.$refs.tabs.$children[selectedIndex].selected = true
			},
		},
		mounted() {
			this.$refs
			this.changeTabsItem(this.$store.state.auth.selectedIndex)
		}

	}
	
</script>

<style>
	
</style>