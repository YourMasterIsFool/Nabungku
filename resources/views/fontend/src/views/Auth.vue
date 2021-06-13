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
						 <div class="relative flex justify-center items-start mt-2 mb-4 w-full">
			            <div style="height: 1px; top:6px;" class="w-full absolute bg-gray-300">
			                
			            </div>
			            <span  class="px-4 z-10  capitalize text-gray-600 text-xs bg-white">
			                atau
			            </span>
				        </div>
				        <div class=" flex justify-center items-center">
				            <a class="py-4 flex rounded-full justify-between border-gray-200 px-12 shadow-lg" style="border-width: 4px;">
				                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				                <path d="M21.8055 10.0415H21V10H12V14H17.6515C16.827 16.3285 14.6115 18 12 18C8.6865 18 6 15.3135 6 12C6 8.6865 8.6865 6 12 6C13.5295 6 14.921 6.577 15.9805 7.5195L18.809 4.691C17.023 3.0265 14.634 2 12 2C6.4775 2 2 6.4775 2 12C2 17.5225 6.4775 22 12 22C17.5225 22 22 17.5225 22 12C22 11.3295 21.931 10.675 21.8055 10.0415Z" fill="#FFC107"/>
				                <path d="M3.15332 7.3455L6.43882 9.755C7.32782 7.554 9.48082 6 12.0003 6C13.5298 6 14.9213 6.577 15.9808 7.5195L18.8093 4.691C17.0233 3.0265 14.6343 2 12.0003 2C8.15932 2 4.82832 4.1685 3.15332 7.3455Z" fill="#FF3D00"/>
				                <path d="M12.0002 22C14.5832 22 16.9302 21.0115 18.7047 19.404L15.6097 16.785C14.5719 17.5742 13.3039 18.0011 12.0002 18C9.39916 18 7.19066 16.3415 6.35866 14.027L3.09766 16.5395C4.75266 19.778 8.11366 22 12.0002 22Z" fill="#4CAF50"/>
				                <path d="M21.8055 10.0415H21V10H12V14H17.6515C17.2571 15.1082 16.5467 16.0766 15.608 16.7855L15.6095 16.7845L18.7045 19.4035C18.4855 19.6025 22 17 22 12C22 11.3295 21.931 10.675 21.8055 10.0415Z" fill="#1976D2"/>
				                </svg>
				                <span class="text-black px font-bold text-lg capitalize">
				                    Masuk dengan Google
				                </span>
				            </a>
				        </div>
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