<template>
    <div id="dashboard" class="">


        <div
            class="bg-gray-100 h-screen w-screen fixed top-0 left-0"
            style="z-index:-100;"
        ></div>
        <div id="main-content" class="grid grid-cols-12 relative ">
            <div v-show="showFaq" class="fixed  w-screen h-screen z-50">
                <div class="relative">
                    <div style="z-index: -1" class="bg-black opacity-30 absolute top-0 left-0 h-screen w-screen ">
                        
                    </div>
                    
                    <div class="relative"  :style="faqPosition">
                        <div class="bg-transparent absolute w-full h-full z-30">
                            
                        </div>

                        <div v-html="faq" class="absolute w-full h-full">
                            
                        </div>
                        <div :style="modalFaq.style" class="absolute bg-white flex flex-col rounded-2xl items-center ">

                           <div class="p-6  flex flex-col">
                                <div class="header mb-4 text-sm font-semibold">
                                {{modalFaq.header}}
                            </div>
                            <div class="text-gray-500 text-xs">
                                {{modalFaq.body}}
                            </div>
                            <div class="mt-4 flex justify-end">
                                <a @click="[currentFaq == 'transaction' ? faqChangeCategoryName() : currentFaq == 'category' ? faqTransactionHistory() : currentFaq == 'history' ? faqMonthlySavingGoals() : showFaq = false  ]" :class="[currentFaq == 'saving' ? 'px-6 py-2' : 'w-6 h-6 ']" class="cursor-pointer  rounded-full flex justify-center items-center just  bg-blue-500 text-white font-bold capitalize">
                                    <span v-if="currentFaq=='saving'">
                                        Done
                                    </span>
                                    <span v-else class="material-icons">
                                        chevron_right
                                    </span>
                                </a>
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-span-9 p-8">
                <div id="nav">
                    <div class="w-full justify-between items-center flex">
                        <div class=" w-full grid grid-cols-12">
                            <div class="brand col-span-3">
                                <img :src="brand" class="w-32" alt="" />
                            </div>
                            <div
                                class="grid self-center col-span-9 grid-cols-12 gap-6"
                            >
                                <input
                                    type="text"
                                    placeholder="Search"
                                    class="bg-white py-1 text-gray-700 px-6 text-xs w-full rounded-3xl col-span-8"
                                />

                                <input
                                    type="month"
                                    v-model="filterCategoryByMonth"
                                    class="bg-white px-3 text-xs py-1 w-full rounded-3xl col-span-3"
                                />
                                <div class="relative">
                                    <a
                                        @click="showNotif = !showNotif"
                                        class="bg-white cursor-pointer text-gray-600 hover:text-gray-800 duration-300 transition-all flex justify-center items-center py-2 w-full rounded-xl col-span-1"
                                    >
                                        <i class="far fa-bell"></i>
                                    </a>
                                    <div 
                                        v-show="showNotif"
                                        :class="[
                                            showNotif
                                                ? 'opacity-100'
                                                : 'opacity-0'
                                        ]"
                                        id="modal-notification"
                                        style="right:0px; top:40px; "
                                        class="bg-white transition-all duration-300  shadow-2xl text-xs rounded-xl right-0 absolute w-64"
                                    >
                                        <h1
                                            class="text-sm ml-4 mt-4 font-semibold capitalize"
                                        >
                                            notifications
                                        </h1>
                                        <div
                                            style="height:300px;"
                                            class="flex overflow-y-scroll mt-4  flex-col py-2 text-xs"
                                        >   

                                            <div class="flex flex-col w-full h-full justify-center items-center">
                                                    <svg width="82" height="74" viewBox="0 0 82 74" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <g opacity="0.7">
                                                        <path d="M49.5214 73.0801C53.4316 73.0801 56.6014 69.9103 56.6014 66.0001C56.6014 62.0899 53.4316 58.9201 49.5214 58.9201C45.6112 58.9201 42.4414 62.0899 42.4414 66.0001C42.4414 69.9103 45.6112 73.0801 49.5214 73.0801Z" fill="white" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M22.95 59.1002H77.178C78.093 59.1002 78.9705 59.4636 79.6175 60.1106C80.2645 60.7576 80.628 61.6352 80.628 62.5502V63.0002C80.628 63.7958 80.3119 64.5589 79.7493 65.1215C79.1867 65.6841 78.4236 66.0001 77.628 66.0001H22.95C22.035 66.0001 21.1575 65.6367 20.5105 64.9897C19.8635 64.3427 19.5 63.4651 19.5 62.5502C19.5 61.6352 19.8635 60.7576 20.5105 60.1106C21.1575 59.4636 22.035 59.1002 22.95 59.1002Z" fill="white" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M54.501 18.5011C54.501 18.5011 61.1793 18.7433 64.1292 25.0001" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M65.5019 31.9021C65.5019 30.0151 65.2702 28.3935 64.874 27.0001" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M24.2998 59.1001V54.9002L27.8608 51.3392C28 51.1996 28.1103 51.034 28.1855 50.8517C28.2607 50.6695 28.2992 50.4743 28.2988 50.2771V34.3772C28.2786 31.4012 28.8571 28.4516 29.9996 25.7036C31.1422 22.9557 32.8256 20.4655 34.9498 18.3812C38.2858 15.1592 43.1488 12.5042 50.1298 12.5042C57.4288 12.5042 62.3698 15.4382 65.6578 18.8972C69.5733 23.0755 71.736 28.5971 71.6998 34.3232V49.9232C71.7001 50.2974 71.8403 50.658 72.0928 50.9341L75.8998 55.1012V58.9201L24.2998 59.1001Z" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M46.2995 12.5012C46.2995 12.5012 46.0985 7.70117 50.1005 7.70117C54.1025 7.70117 53.6015 12.5012 53.6015 12.5012C51.1713 12.3103 48.7298 12.3103 46.2995 12.5012V12.5012Z" stroke="#5E81F4" stroke-width="1.5" stroke-miterlimit="10"/>
                                                        <path d="M37 37.0001C37.2189 38.3136 38.3134 40.9404 40.9403 40.9404C43.5672 40.9404 44.4428 38.3136 44.5522 37.0001" stroke="#5E81F4" stroke-width="1.5"/>
                                                        <path d="M55.4482 37.3434C55.6671 38.6569 56.7617 41.2837 59.3885 41.2837C62.0154 41.2837 62.891 38.6569 63.0005 37.3434" stroke="#5E81F4" stroke-width="1.5"/>
                                                        <path d="M46.2241 46.1942H54.7614" stroke="#5E81F4" stroke-width="1.5"/>
                                                        </g>
                                                        <g opacity="0.7">
                                                        <rect x="15.249" y="11.9286" width="6.9" height="1.19" rx="0.595" fill="#5E81F4"/>
                                                        <rect x="14.5283" y="18.5962" width="9.52354" height="1.19" rx="0.595" transform="rotate(-44 14.5283 18.5962)" fill="#5E81F4"/>
                                                        <rect x="21.3301" y="19.3499" width="6.70264" height="1.19" rx="0.595" transform="rotate(-180 21.3301 19.3499)" fill="#5E81F4"/>
                                                        <rect x="1.16309" y="0.994141" width="11.6403" height="1.68785" rx="0.843925" fill="#5E81F4"/>
                                                        <rect y="12.6892" width="16.5393" height="1.68785" rx="0.843925" transform="rotate(-45 0 12.6892)" fill="#5E81F4"/>
                                                        <rect x="11.7246" y="13.8826" width="11.6403" height="1.68785" rx="0.843925" transform="rotate(-180 11.7246 13.8826)" fill="#5E81F4"/>
                                                        </g>
                                                        </svg>
                                                        <div class="md:mt-8">
                                                            No notifications yet!
                                                        </div>

                                            </div>
                                            <!-- <a
                                                class="flex cursor-pointer py-2 px-4 hover:bg-gray-200 items-center py-2"
                                                v-for="i in 10"
                                                :key="i"
                                            >
                                                <span class="text-blue-400">
                                                    <i
                                                        class="fas fa-circle text-blue-700"
                                                    ></i>
                                                </span>

                                                <span class="pl-4">
                                                    <span
                                                        class="font-bold capitalize"
                                                    >
                                                        reminder
                                                    </span>

                                                    <span>
                                                        : Don’t forget to track
                                                        your expense!



                                                    </span>
                                                </span>
                                            </a> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content" class="mt-8">
                    <div class="grid grid-cols-8 gap-8">
                        <div class="col-span-2">
                            <div
                                class="bg-white p-1 flex-col flex items-center w-full h-full rounded-xl"
                            >
                                <img :src="icon_ayam" class="" alt="" />
                            </div>
                        </div>
                        <!-- <div class="col-span-1"></div> -->
                        <div class="col-span-6" ref="transaction">
                            <div class="w-full bg-white p-8 rounded-xl">
                                <h1
                                    class="text-gray-800 mb-2 md:mb-4 font-semibold text-sm capitalize"
                                >
                                    add transaction
                                </h1>
                                <div class="grid grid-cols-12 gap-6">
                                    <div
                                        class="col-span-3 grid grid-cols-1 gap-4"
                                    >
                                        <div
                                            class=" grid  grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >date</label
                                            >
                                            <input    
                                                type="date"

                                                v-model="form.transaction.date"
                                                style="border-width:1px;"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 px-3 text-xs py-1 focus:outline-none  "
                                            />
                                        </div>
                                        <div
                                            class=" grid gap-1 grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >expense</label
                                            >
                                            <input
                                                type="number"

                                                v-model="form.transaction.expense"
                                                style="border-width:1px;"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-3 "
                                            />
                                        </div>
                                    </div>
                                    <div
                                        class="col-span-5 grid grid-cols-1 gap-4"
                                    >
                                        <div
                                            class=" grid gap-1 grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >category</label
                                            >
                                            <select
                                                style="border-width:1px;"
                                                v-model="form.transaction.sub_category"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-4 "
                                            >
                                                <optgroup class="py-2 font-semibold capitalize " v-for="category in categories" :key="category.index" :label="category.category_name">
                                                    <option :value="sub_category.id" class="py-3 hover:bg-green-100" :key="sub_category.id" v-for="sub_category in category.sub_categorys">
                                                        <span class="py-2">
                                                            {{sub_category.sub_category_name}}
                                                        </span>
                                                    </option>
                                                </optgroup>

                                            </select>
                                        </div>
                                        <div
                                            class=" grid gap-1 grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs font-medium capitalize"
                                                >income</label
                                            >
                                            <form
                                                class="grid-cols-4 gap-4 grid"
                                                action=""
                                            >
                                                <input
                                                    type="number"
                                                    v-model="form.transaction.income"
                                                    style="border-width:1px;"
                                                    class="w-full col-span-3 text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-3 "
                                                />
                                                <button
                                                    @click="addTransaction"
                                                    type="button"
                                                    class="border-blue-400 duration-300 transition-all hover:text-white hover:border-transparent hover:bg-blue-400 text-blue-400 border-2 col-span-1 rounded text-white py-1 text-xs"
                                                >
                                                    <i class="fas fa-plus"> </i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div style="" class="col-span-4 flex justify-center">
                                        <img
                                            :src="icon_calendar"
                                            style=""
                                            class="h-40 w-40 "
                                            alt=""
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        
                    </div>
                    <div class="w-full py-8 text-sm">
                        <div class="bg-white rounded-xl ">
                            <div
                                style="border-bottom-width:1px;"
                                class="header p-6 flex items-center justify-between border-gray-200"
                            >
                                <div class="relative">
                                    <a
                                        @click="modalCategoryGroup = true"
                                        class="cursor-pointer"
                                    >
                                        <i class="pr-4 fas fa-plus"> </i>
                                        <span class="font-semibold capitalize">
                                            category group
                                        </span>
                                    </a>
                                    <div
                                        v-if="modalCategoryGroup"
                                        class="absolute left-0 p-4  rounded-lg shadow-xl bg-white z-20"
                                    >
                                        <input
                                            type="text"
                                            v-model="
                                                form.category.name_category
                                            "
                                            placeholder="new category group"
                                            style="border-width:2px;"
                                            class="w-64 outline-none focus:border-green-200 px-4  border-blue-200 py-2 rounded-lg text-xs "
                                        />

                                        <div class="flex mt-4 justify-between">
                                            <a
                                                @click="
                                                    modalCategoryGroup = false
                                                "
                                                class="capitalize cursor-pointer text-gray-700"
                                            >
                                                cancel
                                            </a>
                                            <a
                                                @click="addCategory"
                                                class="px-2 py-1 rounded-lg bg-blue-400 text-white text-xs font-semibold"
                                            >
                                                add
                                            </a>
                                        </div>
                                    </div>
                                </div>

                               
                            </div>
                            <div class="body py-6 " style="">
                                <div style="" class="">
                                    <div
                                        class="header px-6 text-gray-800 font-semibold capitalize py-2 grid grid-cols-12"
                                    >
                                        <div class="col-span-1">
                                            <input
                                                type="checkbox"
                                                class="col-span-1"
                                            />
                                        </div>
                                        <span class="col-span-5 capitalize">
                                            category
                                        </span>
                                        <span class="col-span-2">budgeted</span>
                                        <span class="col-span-2">activity</span>
                                        <span class="col-span-2"
                                            >available</span
                                        >
                                    </div>
                                    <div
                                        style="height:600px;"
                                        class="pb-12 overflow-y-scroll flex flex-col"
                                    >
                                        <category
                                        
                                            v-for="(item, index) in categories"
                                            :key="index"
                                            :item="item"
                                            :index="index"
                                        ></category>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <sidebar-vue class="bg-white col-span-3 p-8 text-xs">
                <template v-slot:content>
                    <div class="flex flex-col relative">
                        <div
                            id="profile"
                            class="flex relative items-center justify-between"
                        >

                            <!-- modal profile  -->
                            <modal v-show="showNewBudget">
                                <template v-slot:content>
                                    <div
                                        class="flex items-center justify-center h-screen w-screen"
                                    >
                                        <div
                                            style=""
                                            class="py-6 px-6 rounded-xl bg-white"
                                        >
                                            <div
                                                class="flex justify-between items-center"
                                            >
                                                <h1
                                                    class="font-semibold  capitalize text-base"
                                                >
                                                    create new budget
                                                </h1>

                                                <a
                                                    @click="
                                                        showNewBudget = false
                                                    "
                                                    class="cursor-pointer hover:text-gray-800 duration-300 transition-all text-gray-700"
                                                >
                                                    <svg
                                                        class="w-4 h-4"
                                                        fill="none"
                                                        stroke="currentColor"
                                                        viewBox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg"
                                                    >
                                                        <path
                                                            stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            stroke-width="2"
                                                            d="M6 18L18 6M6 6l12 12"
                                                        ></path>
                                                    </svg>
                                                </a>
                                            </div>

                                            <div
                                                class="flex mt-4 text-xs flex-col"
                                            >
                                                <form @submit="createNewBudget">
                                                    <div class="mb-4">
                                                        <label
                                                            for=""
                                                            class="block mb-2 capitalize"
                                                        >
                                                            Budget Name
                                                        </label>

                                                        <input
                                                            v-model="
                                                                form.budget
                                                                    .new_budget
                                                            "
                                                            style="border-width:1px;"
                                                            type="text"
                                                            class="px-6 py-2 rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                        />
                                                    </div>
                                                    <div
                                                        class="flex items-center justify-between"
                                                    >
                                                        <a
                                                            @click="
                                                                showNewBudget = false
                                                            "
                                                            class="capitalize cursor-pointer"
                                                        >
                                                            cancel
                                                        </a>

                                                        <button
                                                            type="submit"
                                                            class="uppercase cursor-pointer rounded-2xl font-bold bg-blue-400 hover:bg-blue-500 text-white py-2 px-6"
                                                        >
                                                            create
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                            </modal>

                            <modal
                                id="profile-setting"
                                class=""
                                v-show="showProfileSetting"
                            >
                                <template v-slot:content>
                                    <div
                                        class="flex  items-center justify-center h-screen w-screen"
                                    >
                                        <div
                                            style="height:500px;"
                                            class="py-8 px-6 w-2/6  overflow-y-auto  rounded-xl bg-white"
                                        >
                                            <div
                                                class="flex justify-between items-center"
                                            >
                                                <h1
                                                    class="font-semibold  capitalize text-base"
                                                >
                                                    profile settings
                                                </h1>

                                                <a
                                                    @click="
                                                        showProfileSetting = false,
                                                        editPassword = false
                                                    "
                                                    class="cursor-pointer hover:text-gray-800 duration-300 transition-all text-gray-700"
                                                >
                                                    <svg
                                                        class="w-4 h-4"
                                                        fill="none"
                                                        stroke="currentColor"
                                                        viewBox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg"
                                                    >
                                                        <path
                                                            stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            stroke-width="2"
                                                            d="M6 18L18 6M6 6l12 12"
                                                        ></path>
                                                    </svg>
                                                </a>
                                            </div>

                                            <div
                                                class="flex mt-4 text-xs flex-col"
                                            >
                                                <div
                                                    class="py-8 flex justify-center"
                                                >
                                                    <div class="relative">
                                                        <!-- [form.user.avatar == null ? user.photos == '' ? icon_ayam  : '/avatar/'+user.photos : form.user.avatar] -->
                                                        
                                                        <img
                                                        v-if="avatar"
                                                        :src="avatarUrl"
                                                        class="w-24 h-24 rounded-full"
                                                        alt=""
                                                        />
                                                        <img
                                                        v-else
                                                        :src="[user.photos != '' ? '/avatars/'+user.photos : icon_ayam]"
                                                        class="w-24 h-24 rounded-full"
                                                        alt=""
                                                        />
                                                        <input @change="changeAvatar" type="file" ref="avatar" class="absolute opacity-0 w-full h-full top-0 left-0">
                                                    </div>
                                                </div>
                                                <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >  
                                                        firstname
                                                        
                                                    </label>

                                                    <input
                                                        style="border-width:1px;"
                                                        type="text"
                                                        v-model="form.user.firstname"
                                                        class="px-4 py-2 w-full rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                    />
                                                </div>

                                                 <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >  
                                                        lastname
                                                        
                                                    </label>

                                                    <input
                                                        style="border-width:1px;"
                                                        type="text"
                                                        v-model="form.user.lastname"
                                                        class="px-4 py-2 w-full rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                    />
                                                </div>
                                                <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >
                                                        email
                                                    </label>

                                                    <input
                                                        disabled="true"
                                                        style="border-width:1px;"
                                                        v-model="form.user.email"
                                                        type="text"
                                                        class="px-4 py-2 w-full rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                    />
                                                </div>

                                                <div class="py-2">
                                                    <div class="flex justify-between">
                                                        <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >
                                                        password
                                                    </label>
                                                    
                                                    <span v-show="editPassword == false" @click="editPassword = !editPassword" class="text-blue-500 cursor-pointer text-xs">
                                                        Edit password
                                                    </span>
                                                    <span class="text-red-500" v-show="editPassword == true" @click="editPassword = !editPassword">
                                                        close edit password
                                                    </span>
                                                    </div>

                                                    <input
                                                        :disabled="editPassword == false"
                                                        style="border-width:1px;"
                                                        type="password"
                                                        v-model="form.user.password"
                                                        class="px-4 py-2 w-full rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                    />
                                                </div>
                                                <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >
                                                        create new password
                                                    </label>

                                                    <input
                                                        style="border-width:1px;"
                                                        placeholder="Verrandy"
                                                        :disabled="editPassword == false"
                                                        v-model="form.user.password_confirmation"
                                                        @keydown="password_confirmation"
                                                        
                                                        :class="[error != null ? 'border-red-400': 'border-gray-300 focus:border-blue-300']"
                                                        type="password"
                                                        class="px-4 py-2 w-full rounded-xl outline-none "
                                                    />
                                                    <p v-if="error != null" class="text-red-400 text-xs mt-2">
                                                        
                                                        {{error}}
                                                    </p>
                                                </div>
                                                <div
                                                    class="flex items-center justify-end"
                                                >
                                                    <button
                                                        :disabled="notCorrectPassword"
                                                        @click="updateUser()"
                                                        class="uppercase cursor-pointer rounded-2xl font-bold bg-blue-400 hover:bg-blue-500 text-white py-2 px-6"
                                                    >   
                                                        save
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                            </modal>

                            <div class="flex items-center">
                                <div class="w-12 flex items-center h-12">
                                    <img
                                        :src="user.photos != '' ? '/avatars/'+user.photos : icon_ayam"
                                        class="w-full h-full rounded-full"
                                        alt=""
                                    />
                                </div>
                                <div class="pl-4 flex items-center">
                                    <p class=" capitalize text-sm font-bold">
                                        {{user.firstname}}
                                        <span>
                                            Budgets
                                        </span>
                                    </p>
                                </div>
                            </div>
                          <div ref="profileMenu">
                                <a
                                class="cursor-pointer transition-all duration-500 "
                                :style="[
                                    showProfileMenu
                                        ? { transform: 'rotate(0deg)' }
                                        : { transform: 'rotate(180deg)' }
                                ]"
                                @click="showProfileMenu = !showProfileMenu"
                                
                            >
                                <i class="fas fa-chevron-down"> </i>
                            </a>
                            <div
                                
                                :style="[
                                    showProfileMenu
                                        ? {
                                              height: '350px',
                                              opacity: '100'
                                          }
                                        : {
                                              'max-height': '0px',
                                              overflow: 'hidden',
                                              opacity: '0'
                                          }
                                ]"
                                style="top:64px; left:0px; z-index: 20; "
                                class="bg-white overflow-y-scroll duration-1000 transition-all pt-4 shadow-xl w-64 absolute   rounded-lg"
                            >
                                <ul
                                    class="transition-all duration-1000"
                                    :class="[
                                        showProfileMenu
                                            ? 'opacity-100 '
                                            : 'opacity-0'
                                    ]"
                                >
                                    <li v-for="row in budgets" :key="row.id">
                                        <a
                                            @click="fetchCategory(row.id), showProfileMenu = false"
                                            class="py-4 cursor-pointer flex px-4 items-center block hover:bg-gray-200"
                                            ><span class="">
                                                <svg
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M6.25 3C5.38805 3 4.5614 3.34241 3.9519 3.9519C3.34241 4.5614 3 5.38805 3 6.25V17.75C3 18.612 3.34241 19.4386 3.9519 20.0481C4.5614 20.6576 5.38805 21 6.25 21H17.75C18.612 21 19.4386 20.6576 20.0481 20.0481C20.6576 19.4386 21 18.612 21 17.75V6.25C21 5.38805 20.6576 4.5614 20.0481 3.9519C19.4386 3.34241 18.612 3 17.75 3H6.25ZM4.5 6.25C4.5 5.284 5.284 4.5 6.25 4.5H17.75C18.716 4.5 19.5 5.284 19.5 6.25V8.5H4.5V6.25ZM10 10H14V14H10V10ZM8.5 10V14H4.5V10H8.5ZM8.5 15.5V19.5H6.25C5.78587 19.5 5.34075 19.3156 5.01256 18.9874C4.68437 18.6592 4.5 18.2141 4.5 17.75V15.5H8.5ZM10 19.5V15.5H14V19.5H10ZM15.5 14V10H19.5V14H15.5ZM15.5 15.5H19.5V17.75C19.5 18.2141 19.3156 18.6592 18.9874 18.9874C18.6592 19.3156 18.2141 19.5 17.75 19.5H15.5V15.5Z"
                                                        fill="#333333"
                                                    />
                                                </svg>
                                            </span>
                                            <span class="pl-4 capitalize"
                                                >{{
                                                    row.name_budget
                                                }}
                                                Budget</span
                                            ></a
                                        >
                                    </li>

                                    <li>
                                        <a
                                            @click="showNewBudget = true"
                                            class="py-4 cursor-pointer flex px-4 items-center block hover:bg-gray-200"
                                            ><span class="">
                                                <svg
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M11.9999 7C12.1989 7 12.3896 7.07902 12.5303 7.21967C12.6709 7.36032 12.7499 7.55109 12.7499 7.75V11.25H16.2499C16.4489 11.25 16.6396 11.329 16.7803 11.4697C16.9209 11.6103 16.9999 11.8011 16.9999 12C16.9999 12.1989 16.9209 12.3897 16.7803 12.5303C16.6396 12.671 16.4489 12.75 16.2499 12.75H12.7499V16.25C12.7499 16.4489 12.6709 16.6397 12.5303 16.7803C12.3896 16.921 12.1989 17 11.9999 17C11.801 17 11.6103 16.921 11.4696 16.7803C11.329 16.6397 11.2499 16.4489 11.2499 16.25V12.75H7.74994C7.55103 12.75 7.36026 12.671 7.21961 12.5303C7.07896 12.3897 6.99994 12.1989 6.99994 12C6.99994 11.8011 7.07896 11.6103 7.21961 11.4697C7.36026 11.329 7.55103 11.25 7.74994 11.25H11.2499V7.75C11.2499 7.55109 11.329 7.36032 11.4696 7.21967C11.6103 7.07902 11.801 7 11.9999 7Z"
                                                        fill="#333333"
                                                    />
                                                    <path
                                                        d="M3 6.25C3 5.38805 3.34241 4.5614 3.9519 3.9519C4.5614 3.34241 5.38805 3 6.25 3H17.75C18.612 3 19.4386 3.34241 20.0481 3.9519C20.6576 4.5614 21 5.38805 21 6.25V17.75C21 18.612 20.6576 19.4386 20.0481 20.0481C19.4386 20.6576 18.612 21 17.75 21H6.25C5.38805 21 4.5614 20.6576 3.9519 20.0481C3.34241 19.4386 3 18.612 3 17.75V6.25ZM6.25 4.5C5.78587 4.5 5.34075 4.68437 5.01256 5.01256C4.68437 5.34075 4.5 5.78587 4.5 6.25V17.75C4.5 18.716 5.284 19.5 6.25 19.5H17.75C18.2141 19.5 18.6592 19.3156 18.9874 18.9874C19.3156 18.6592 19.5 18.2141 19.5 17.75V6.25C19.5 5.78587 19.3156 5.34075 18.9874 5.01256C18.6592 4.68437 18.2141 4.5 17.75 4.5H6.25Z"
                                                        fill="#333333"
                                                    />
                                                </svg>
                                            </span>
                                            <span class="pl-4"
                                                >Create New Budget</span
                                            ></a
                                        >
                                    </li>
                                    <li>
                                        <a
                                            @click="showProfileSetting = true"
                                            class="py-4 flex px-4 items-center block hover:bg-gray-200"
                                            ><span class="">
                                                <svg
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M12 8.14307C11.4935 8.14307 10.9919 8.24283 10.524 8.43667C10.056 8.63051 9.63078 8.91463 9.27261 9.2728C8.91445 9.63097 8.63033 10.0562 8.43649 10.5241C8.24265 10.9921 8.14288 11.4937 8.14288 12.0002C8.14288 12.5067 8.24265 13.0083 8.43649 13.4763C8.63033 13.9442 8.91445 14.3695 9.27261 14.7276C9.63078 15.0858 10.056 15.3699 10.524 15.5637C10.9919 15.7576 11.4935 15.8574 12 15.8574C13.023 15.8574 14.0041 15.451 14.7274 14.7276C15.4508 14.0043 15.8572 13.0232 15.8572 12.0002C15.8572 10.9772 15.4508 9.99615 14.7274 9.2728C14.0041 8.54944 13.023 8.14307 12 8.14307ZM9.4286 12.0002C9.4286 11.6625 9.49511 11.3281 9.62434 11.0162C9.75356 10.7042 9.94297 10.4207 10.1818 10.1819C10.4205 9.94316 10.704 9.75375 11.016 9.62452C11.328 9.49529 11.6623 9.42878 12 9.42878C12.3377 9.42878 12.6721 9.49529 12.9841 9.62452C13.2961 9.75375 13.5795 9.94316 13.8183 10.1819C14.0571 10.4207 14.2465 10.7042 14.3757 11.0162C14.5049 11.3281 14.5715 11.6625 14.5715 12.0002C14.5715 12.6822 14.3005 13.3362 13.8183 13.8185C13.3361 14.3007 12.682 14.5716 12 14.5716C11.318 14.5716 10.664 14.3007 10.1818 13.8185C9.69952 13.3362 9.4286 12.6822 9.4286 12.0002Z"
                                                        fill="#333333"
                                                    />
                                                    <path
                                                        d="M18.6086 19.1958L17.1274 18.5452C16.9166 18.4536 16.6873 18.4126 16.4578 18.4254C16.2284 18.4382 16.005 18.5045 15.8057 18.6189C15.4054 18.8504 15.15 19.2592 15.0994 19.7195L14.9211 21.3309C14.9032 21.4929 14.8357 21.6453 14.7278 21.7674C14.62 21.8895 14.477 21.9754 14.3186 22.0132C12.7937 22.3767 11.2046 22.3767 9.67972 22.0132C9.52141 21.9752 9.37867 21.8893 9.27099 21.7672C9.1633 21.6451 9.09591 21.4927 9.078 21.3309L8.89972 19.7221C8.87412 19.4957 8.79581 19.2784 8.67107 19.0877C8.54633 18.897 8.37863 18.7382 8.18143 18.6241C7.98444 18.5101 7.76342 18.4441 7.53622 18.4313C7.30901 18.4185 7.08198 18.4593 6.87343 18.5504L5.39229 19.2009C5.24256 19.2667 5.07609 19.2843 4.91592 19.2513C4.75574 19.2183 4.6098 19.1363 4.49829 19.0166C3.43223 17.8742 2.63893 16.5051 2.178 15.0121C2.12954 14.8551 2.13105 14.687 2.18235 14.531C2.23364 14.375 2.33216 14.2388 2.46429 14.1412L3.77315 13.1744C3.95741 13.039 4.10722 12.8621 4.21048 12.6581C4.31375 12.4541 4.36755 12.2287 4.36755 12.0001C4.36755 11.7714 4.31375 11.546 4.21048 11.342C4.10722 11.138 3.95741 10.9612 3.77315 10.8258L2.46429 9.8615C2.33199 9.76388 2.23336 9.62752 2.18206 9.47132C2.13076 9.31512 2.12934 9.14683 2.178 8.98978C2.63989 7.49807 3.43376 6.13041 4.5 4.9895C4.61161 4.87002 4.75761 4.78818 4.91777 4.75532C5.07794 4.72245 5.24436 4.74019 5.394 4.80607L6.86829 5.45493C7.07806 5.54521 7.30605 5.58514 7.53402 5.57151C7.76199 5.55788 7.9836 5.49108 8.18113 5.37645C8.37865 5.26182 8.54659 5.10254 8.67152 4.91136C8.79645 4.72019 8.8749 4.50242 8.90058 4.2755L9.08058 2.66578C9.0987 2.50203 9.1675 2.34802 9.27736 2.22524C9.38723 2.10247 9.53269 2.01706 9.69343 1.98093C10.4486 1.81293 11.2191 1.72378 12.0111 1.71436C12.7843 1.72293 13.554 1.81293 14.3083 1.98093C14.4692 2.01699 14.6148 2.10249 14.7247 2.22546C14.8346 2.34842 14.9033 2.50269 14.9211 2.66664L15.1003 4.27636C15.1389 4.63334 15.3079 4.96351 15.5749 5.20361C15.8419 5.4437 16.1881 5.57684 16.5471 5.5775C16.7469 5.5775 16.9449 5.5355 17.13 5.45407L18.6043 4.80521C18.7539 4.73933 18.9204 4.7216 19.0805 4.75446C19.2407 4.78732 19.3867 4.86916 19.4983 4.98864C20.5643 6.1296 21.3579 7.49727 21.8194 8.98893C21.868 9.14576 21.8666 9.31382 21.8155 9.46983C21.7643 9.62585 21.666 9.76212 21.534 9.85978L20.2269 10.8258C19.854 11.1001 19.6286 11.5364 19.6286 12.0001C19.6286 12.4629 19.854 12.8992 20.2277 13.1744L21.5357 14.1395C21.8066 14.3401 21.9214 14.6898 21.822 15.0112C21.3605 16.5027 20.5672 17.8703 19.5017 19.0115C19.3902 19.1311 19.2443 19.2131 19.0841 19.2461C18.9239 19.2792 18.7574 19.2616 18.6077 19.1958H18.6086ZM13.9397 19.0261C14.1442 18.3855 14.5796 17.8439 15.1611 17.5064C15.5353 17.2908 15.9548 17.166 16.3859 17.142C16.817 17.1181 17.2477 17.1956 17.6434 17.3684L18.7954 17.8741C19.5354 17.0173 20.1082 16.0294 20.484 14.9615L19.4649 14.2098V14.2089C19.1179 13.9542 18.8356 13.6215 18.6407 13.2377C18.4458 12.8539 18.3438 12.4297 18.3429 11.9992C18.3429 11.1189 18.7689 10.3021 19.4632 9.79121L19.4649 9.79035L20.4823 9.03864C20.1062 7.97097 19.5331 6.98332 18.7929 6.12693L17.6503 6.62921L17.6486 6.63007C17.3006 6.78436 16.926 6.86321 16.5463 6.86321C15.871 6.8622 15.2199 6.61229 14.7173 6.16129C14.2148 5.71028 13.8961 5.08985 13.8223 4.41864V4.41693L13.6826 3.1655C13.1312 3.0628 12.572 3.00746 12.0111 3.00007C11.4334 3.00778 10.8711 3.0635 10.3183 3.1655L10.1786 4.41778C10.1305 4.84512 9.98289 5.25523 9.74753 5.61514C9.51216 5.97504 9.19564 6.27471 8.82341 6.49005C8.45118 6.70539 8.03361 6.83039 7.60428 6.855C7.17495 6.87962 6.74584 6.80316 6.35143 6.63178L5.20629 6.12778C4.466 6.98415 3.89294 7.97181 3.51686 9.0395L4.53686 9.79121C4.88311 10.0462 5.16457 10.379 5.35856 10.7628C5.55254 11.1465 5.65361 11.5705 5.65361 12.0005C5.65361 12.4305 5.55254 12.8545 5.35856 13.2382C5.16457 13.622 4.88311 13.9548 4.53686 14.2098L3.51686 14.9624C3.89223 16.0317 4.46501 17.0212 5.20543 17.8792L6.35829 17.3735C6.75145 17.2014 7.17956 17.1241 7.60807 17.148C8.03658 17.1718 8.45349 17.296 8.82515 17.5106C9.19665 17.7253 9.51263 18.024 9.74768 18.3829C9.98274 18.7418 10.1303 19.1509 10.1786 19.5772V19.5815L10.3174 20.8364C11.4291 21.0549 12.5717 21.0549 13.6834 20.8364L13.8223 19.5789C13.8429 19.3904 13.8823 19.2044 13.9406 19.0261H13.9397Z"
                                                        fill="#333333"
                                                    />
                                                </svg>
                                            </span>
                                            <span class="pl-4"
                                                >Profile Settings</span
                                            ></a
                                        >
                                    </li>
                                    <li>
                                        <a
                                            @click="userLogout"
                                            class="py-4 flex px-4 items-center block hover:bg-gray-200"
                                            ><span class="">
                                                <svg
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M4.5 22.5H13.5C13.8977 22.4996 14.279 22.3414 14.5602 22.0602C14.8414 21.779 14.9996 21.3977 15 21V18.75H13.5V21H4.5V3H13.5V5.25H15V3C14.9996 2.6023 14.8414 2.221 14.5602 1.93978C14.279 1.65856 13.8977 1.5004 13.5 1.5H4.5C4.1023 1.5004 3.721 1.65856 3.43978 1.93978C3.15856 2.221 3.0004 2.6023 3 3V21C3.0004 21.3977 3.15856 21.779 3.43978 22.0602C3.721 22.3414 4.1023 22.4996 4.5 22.5Z"
                                                        fill="#333333"
                                                    />
                                                    <path
                                                        d="M15.4395 15.4395L18.129 12.75H7.5V11.25H18.129L15.4395 8.5605L16.5 7.5L21 12L16.5 16.5L15.4395 15.4395Z"
                                                        fill="#333333"
                                                    />
                                                </svg>
                                            </span>
                                            <span class="pl-4">Logout</span></a
                                        >
                                    </li>
                                </ul>
                            </div>
                          </div>
                        </div>
                        <div ref="subCategoryDetail"  v-if="$store.state.modal.showSubCategoryDetail" class=" mt-4 md:mt-8 relative  bg-gray w-full h-full">
             
                            <div id="sub-category-detail" class="w-full">
                                <div class="header mb-4 flex justify-between w-full">
                                    
                                    <span  style="line-height: 24px;" class="text-black font-medium capitalize text-base">
                                                    {{sub_category_detail.sub_category_name}}
                                                </span>

                                    <a style="font-size: 14px" @click="$store.state.modal.showSubCategoryDetail = false" class="text-gray-600 cursor-pointer px-4  ">
                                        <i class="fas fa-times"></i>
                                    </a>
                    
                                </div>
                                <div style="border-bottom:1px solid lightgray" class="body text-sm py-4 border-b text-gray-700">
                                   <div class="flex pb-4 items-center justify-between">
                                        <span >
                                            Last Month’s Left Over
                                        </span>

                                         <span class="px-4">
                                            
                                            <format-rupiah :item="lastMonthBudget"></format-rupiah>
                                        </span>
                                    </div>
                                    <div class="flex pb-4 items-center justify-between">
                                        <span >
                                           This Month’s Budget
                                        </span>

                                        <span class="px-4">
                                            <format-rupiah :item="currentMonthBudget"></format-rupiah>
                                        </span>
                                    </div>
                                  <div class="flex pb-4 items-center justify-between">
                                        <span >
                                           Money Spent
                                        </span>

                                        <span class="px-4">
                                             <format-rupiah :item="totalSpent"></format-rupiah>
                                        </span>
                                    </div>
                                    <div class="flex pb-4 items-center justify-between">
                                        <span class="text-black">
                                           Available
                                        </span>

                                        <span class="bg-green-400 rounded-2xl py-1 px-4">
                                          
                                             <format-rupiah :item="totalSubAvailable"></format-rupiah>
                                        </span>
                                    </div>

                                </div>

                                <div class="pt-8">
                                    <div class="flex mb-6 justify-between items-center">
                                        <h1 class="block  text-black text-base capitalize">
                                            saving goals
                                        </h1>

                                        <a @click="showGoals=true" class="text-gray-500 capitalize font-semibold" v-if="sub_category_detail.finishBy && showGoals == false">
                                            edit
                                        </a>

                                         <a @click="showGoals=false, updateSavingGoals(sub_category_detail.id)  " class="text-blue-400 font-semibold capitalize" v-if="sub_category_detail.finishBy && showGoals == true">
                                            done
                                        </a>
                                    </div>

                                    <div class="relative ">
                                        <div v-if="sub_category_detail.finishBy">
                                            <div>
                                                <div class="py-3">
                                                    <div class="flex mb-3 items-center justify-between">
                                                        <h1 class="text-sm capitalize font-medium text-black">
                                                            {{sub_category_detail.finishBy | parsingMonth }}
                                                        </h1>

                                                        <span class="text-xs font-normal">
                                                            <format-rupiah :item="sub_category_detail.amount"></format-rupiah>
                                                        </span>
                                                    </div>
                                                   <div>
                                                        
                                                        <span v-if="savingGoalsBar < 100" class="font-semibold text-red-400 mb-4">
                                                            {{savingGoalsBar}}%
                                                        </span>
                                                        <span v-else class="text-green-400 font-semibold mb-4">
                                                            {{savingGoalsBar - 100 }}+%
                                                        </span>
                                                        <div class="relative">
                                                            <div  style="width: 100%; z-index: 1" class="h-3 absolute top-0 transition-all duration-1000 bg-gray-100 rounded-2xl">
                                                        
                                                            </div>
                                                            <div style="z-index: 10" :style="{width: [savingGoalsBar > 100 ? 100 : savingGoalsBar < 0 ? 0 : savingGoalsBar]   +'%'}"class="h-3 absolute top-0 transition-all duration-1000  rounded-2xl" :class="[savingGoalsBar > 100 ? 'bg-green-300' : 'bg-red-300']">
                                                        
                                                        </div>
                                                        </div>
                                                   </div>
                                                </div>

                                                <div class="flex py-3 items-center justify-between">
                                                    <h1 class="text-sm capitalize font-medium text-black">
                                                            Dana Terkumpul
                                                        </h1>

                                                        <span class="text-xs font-normal">
                                                            <format-rupiah :item="totalSubAvailable"></format-rupiah>
                                                        </span>
                                                </div>
                                                 <div class="flex py-3 items-center justify-between">
                                                    <h1 class="text-sm capitalize font-medium text-black">
                                                            {{sub_category_detail.period}} Saving
                                                        </h1>

                                                        <span class="text-xs font-normal">
                                                            <format-rupiah :item="periodSaving"></format-rupiah>
                                                        </span>
                                                </div>

                                            </div>
                                        </div>
                                        <div @click="showGoals = true" v-else class="flex items-center">
                                               <a 
                                        class="rounded-full w-6  text-white flex justify-center items-center mr-6 text-white h-6 bg-blue-400">
                                            <span class="material-icons">
                                                add
                                            </span>
                                        </a>

                                        <span class="font-semibold capitalize text-blue-400">
                                            create new goals
                                        </span>
                                        </div>

                                        <div v-show="showGoals" class="absolute bg-white w-full h-full top-0 z-10">
                                            <div class="flex-col">
                                                <div class="mt-2">
                                                    <label for="" class="pb-2 capitalize block">
                                                        Amount
                                                    </label>

                                                    <input style="border-width: 1px;"
                                                    v-model="form.saving_goals.amount"
                                                   
                                                    type="number" class="py-2 
                                                    outline-none rounded-lg focus:border-blue-300 border-gray-300 px-4 block" >
                                                </div>
                                                  <div class="mt-2">
                                                    <label for="" class="pb-2 block capitalize">
                                                        finish by
                                                    </label>

                                                    <input style="border-width: 1px" class="py-2 outline-none rounded-lg focus:border-blue-300 py-2 px-3 border-gray-300 block"
                                                    placeholder="2020-10-11"
                                                   
                                                    v-model="form.saving_goals.finishBy"
                                                      type="date"/> 
                                                   <!--  <input style="border-width: 1px;" type="date" class="" > -->
                                                </div>
                                                <div class="mt-2">
                                                    <div class="flex-col ">
                                                        <label for="" class="pb-2 block capitalize">
                                                        period
                                                    </label>

                                                    <select style="border-width: 1px;" type="text" 
                                                    v-model="form.saving_goals.period"
                                                   
                                                    class="py-2 outline-none
                                                    capitalize
                                                     bg-white rounded-lg focus:border-blue-300 border-white-300 px-4 block" >

                                                     <option value="" disabled="" selected> {{
                                                        sub_category_detail.period
                                                     }}</option>
                                                        <option value="day">
                                                          day
                                                        </option>
                                                        <option value="weekly">
                                                          weekly
                                                        </option>
                                                        <option value="month">
                                                          month
                                                        </option>

                                                    </select>
                                                    </div>

                                                     <div class="mt-4 flex outline-none justify-between">
                                                        <a @click="showGoals = false"class="py-2 rounded-lg px-3 bg-red-400 capitalize text-white text-sm">
                                                            cancel
                                                        </a>
                                                       <a @click="updateSavingGoals(sub_category_detail.id)" class="py-2 rounded-lg px-3 capitalize bg-blue-400 text-white text-sm">
                                                            add
                                                        </a>
                                                      </div>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div v-show="$store.state.modal.showSubCategoryDetail == false" class="mt-4 md:mt-8">
                            <div class="">
                            <h1 class="text-black capitalize font-semibold">
                                Monthly Report
                            </h1>
                            <div class="flex mt-4 flex-col">
                                <div class="flex pb-4">
                                    <div
                                        class="w-12 rounded-xl flex justify-center items-center h-12 bg-green-100"
                                    >
                                        <a
                                            href=""
                                            style="font-size:16px;"
                                            class="text-green-600"
                                        >
                                            <i class="fas fa-money-bill-wave">
                                            </i>
                                        </a>
                                    </div>
                                    <div
                                        class="flex pl-4 justify-center flex-col"
                                    >
                                        <span
                                            class="text-gray-600 mb-1 capitalize"
                                        >
                                            daily spend limit
                                        </span>
                                        <span class="font-semibold">
                                         
                                            <format-rupiah :item="daily_spend_limit">
                                                
                                            </format-rupiah>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex pb-4">
                                    <div
                                        class="w-12 rounded-xl flex justify-center items-center h-12 bg-red-100"
                                    >
                                        <a
                                            href=""
                                            style="font-size:16px;"
                                            class="text-red-400"
                                        >
                                            <i class="fas fa-wallet"> </i>
                                        </a>
                                    </div>
                                    <div
                                        class="flex pl-4 justify-center flex-col"
                                    >
                                        <span
                                            class="text-gray-600 mb-1 capitalize"
                                        >
                                            budget available
                                        </span>
                                        <span class="font-semibold">
                                            <format-rupiah :item="total_available"></format-rupiah>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex pb-4">
                                    <div
                                        class="w-12 rounded-xl flex justify-center items-center h-12 bg-green-100"
                                    >
                                        <a
                                            href=""
                                            style="font-size:16px;"
                                            class="text-green-400"
                                        >
                                            <i class="fas fa-box-open"> </i>
                                        </a>
                                    </div>
                                    <div
                                        class="flex pl-4 justify-center flex-col"
                                    >
                                        <span
                                            class="text-gray-600 mb-1 capitalize"
                                        >
                                            total income
                                        </span>
                                        <span class="font-semibold">
                                           <format-rupiah :item="total_income"></format-rupiah>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex pb-4">
                                    <div
                                        class="w-12 rounded-xl flex justify-center items-center h-12 bg-blue-100"
                                    >
                                        <a
                                            href=""
                                            style="font-size:16px;"
                                            class="text-blue-400"
                                        >
                                            <svg
                                                width="22"
                                                height="22"
                                                viewBox="0 0 22 22"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M13.2 17.7224C13.2 17.5604 13.1357 17.4049 13.0211 17.2903C12.9064 17.1757 12.751 17.1113 12.5889 17.1113H8.92227C8.76019 17.1113 8.60475 17.1757 8.49015 17.2903C8.37554 17.4049 8.31116 17.5604 8.31116 17.7224C8.31116 17.8845 8.37554 18.04 8.49015 18.1546C8.60475 18.2692 8.76019 18.3335 8.92227 18.3335H12.5889C12.751 18.3335 12.9064 18.2692 13.0211 18.1546C13.1357 18.04 13.2 17.8845 13.2 17.7224Z"
                                                    fill="#7082F5"
                                                />
                                                <path
                                                    d="M13.7744 14.6665H10.1078C9.94568 14.6665 9.79024 14.7309 9.67563 14.8455C9.56103 14.9601 9.49664 15.1155 9.49664 15.2776C9.49664 15.4397 9.56103 15.5951 9.67563 15.7097C9.79024 15.8243 9.94568 15.8887 10.1078 15.8887H13.7744C13.9365 15.8887 14.0919 15.8243 14.2065 15.7097C14.3211 15.5951 14.3855 15.4397 14.3855 15.2776C14.3855 15.1155 14.3211 14.9601 14.2065 14.8455C14.0919 14.7309 13.9365 14.6665 13.7744 14.6665Z"
                                                    fill="#7082F5"
                                                />
                                                <path
                                                    d="M13.4445 19.5557H9.7778C9.61572 19.5557 9.46028 19.62 9.34568 19.7347C9.23107 19.8493 9.16669 20.0047 9.16669 20.1668C9.16669 20.3289 9.23107 20.4843 9.34568 20.5989C9.46028 20.7135 9.61572 20.7779 9.7778 20.7779H13.4445C13.6065 20.7779 13.762 20.7135 13.8766 20.5989C13.9912 20.4843 14.0556 20.3289 14.0556 20.1668C14.0556 20.0047 13.9912 19.8493 13.8766 19.7347C13.762 19.62 13.6065 19.5557 13.4445 19.5557Z"
                                                    fill="#7082F5"
                                                />
                                                <path
                                                    d="M19.9834 19.5557H15.7056C15.5435 19.5557 15.3881 19.62 15.2735 19.7347C15.1589 19.8493 15.0945 20.0047 15.0945 20.1668C15.0945 20.3289 15.1589 20.4843 15.2735 20.5989C15.3881 20.7135 15.5435 20.7779 15.7056 20.7779H19.9834C20.1454 20.7779 20.3009 20.7135 20.4155 20.5989C20.5301 20.4843 20.5945 20.3289 20.5945 20.1668C20.5945 20.0047 20.5301 19.8493 20.4155 19.7347C20.3009 19.62 20.1454 19.5557 19.9834 19.5557Z"
                                                    fill="#7082F5"
                                                />
                                                <path
                                                    d="M20.5945 17.1113H16.3167C16.1546 17.1113 15.9992 17.1757 15.8846 17.2903C15.77 17.4049 15.7056 17.5604 15.7056 17.7224C15.7056 17.8845 15.77 18.04 15.8846 18.1546C15.9992 18.2692 16.1546 18.3335 16.3167 18.3335H20.5945C20.7565 18.3335 20.912 18.2692 21.0266 18.1546C21.1412 18.04 21.2056 17.8845 21.2056 17.7224C21.2056 17.5604 21.1412 17.4049 21.0266 17.2903C20.912 17.1757 20.7565 17.1113 20.5945 17.1113Z"
                                                    fill="#7082F5"
                                                />
                                                <path
                                                    d="M20.6189 15.8888C20.4398 13.7371 19.855 11.6387 18.8955 9.70439C17.9764 7.95645 16.6521 6.45401 15.0333 5.32273L16.5 2.08995C16.5473 1.99333 16.5682 1.88595 16.5607 1.77864C16.5532 1.67134 16.5175 1.56792 16.4572 1.47884C16.4016 1.40069 16.3283 1.33673 16.2434 1.29214C16.1585 1.24755 16.0642 1.22358 15.9683 1.22217H5.98887C5.88614 1.22192 5.785 1.24756 5.69481 1.29675C5.60461 1.34593 5.52827 1.41705 5.47284 1.50355C5.41741 1.59005 5.38468 1.68912 5.37767 1.79161C5.37067 1.89411 5.38962 1.99671 5.43276 2.08995L6.92999 5.33495C5.32306 6.46729 4.00777 7.9648 3.09221 9.70439C1.77832 12.1488 1.36887 15.1372 1.25887 17.2088C1.24086 17.5121 1.28586 17.8158 1.39104 18.1009C1.49622 18.3859 1.65929 18.6461 1.86999 18.865C2.09143 19.08 2.35363 19.2487 2.64118 19.361C2.92874 19.4733 3.23584 19.5269 3.54443 19.5188H7.33332V18.3333H3.49554C3.35724 18.3329 3.22045 18.3045 3.09338 18.2499C2.96631 18.1953 2.85159 18.1155 2.7561 18.0155C2.66046 17.9163 2.5866 17.7981 2.53925 17.6687C2.49189 17.5393 2.47209 17.4014 2.4811 17.2638C2.56665 15.6688 2.90276 12.6316 4.16776 10.2666C5.05952 8.57207 6.37817 7.13966 7.99332 6.11106H8.60443C8.19031 6.68395 7.80878 7.27971 7.46165 7.8955C7.10811 8.55076 6.8077 9.23332 6.56332 9.93661L7.40054 10.4988C7.64789 9.76917 7.95235 9.06012 8.3111 8.37828C8.75162 7.58547 9.25216 6.82751 9.80832 6.11106H10.4194C10.8294 7.09091 11.1187 8.11695 11.2811 9.16662C11.4138 9.94584 11.4793 10.7351 11.4767 11.5255L12.4422 10.8472C12.4153 10.2326 12.35 9.62028 12.2467 9.01384C12.0827 8.02273 11.8207 7.05036 11.4644 6.11106H11.9411L12.4972 4.88884H8.07276L6.94221 2.44439H15.015L13.4872 5.78717C13.7491 5.92745 14.0003 6.08676 14.2389 6.26384C15.7362 7.29686 16.9642 8.67363 17.82 10.2788C18.6772 12.039 19.2092 13.9395 19.3905 15.8888H20.6189Z"
                                                    fill="#7082F5"
                                                />
                                            </svg>
                                        </a>
                                    </div>
                                    <div
                                        class="flex pl-4 justify-center flex-col"
                                    >
                                        <span
                                            class="text-gray-600 mb-1 capitalize"
                                        >
                                            total budget
                                        </span>
                                        <span class="font-semibold">
                                            <format-rupiah :item="total_budget"></format-rupiah>
                                        </span>
                                    </div>
                                </div>
                                <div class="flex pb-4">
                                    <div
                                        class="w-12 rounded-xl flex justify-center items-center h-12 bg-yellow-100"
                                    >
                                        <a
                                            href=""
                                            style="font-size:16px;"
                                            class="text-yellow-400"
                                        >
                                            <svg
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M20.3436 11.4539C20.3808 11.7407 20.4 12.0455 20.4 12.3695C20.4 14.2115 19.842 15.4499 19.308 16.2191C19.038 16.6067 18.7704 16.8791 18.576 17.0531C18.4861 17.1337 18.3915 17.209 18.2928 17.2787L18.282 17.2859C18.1957 17.3398 18.1246 17.4148 18.0752 17.5038C18.0259 17.5928 18 17.6929 18 17.7947V19.7999C18 19.959 17.9368 20.1116 17.8243 20.2241C17.7118 20.3366 17.5592 20.3999 17.4 20.3999H15.7392C15.7023 20.3999 15.6669 20.3852 15.6408 20.3591C15.6147 20.333 15.6 20.2976 15.6 20.2607C15.6 19.5203 15 18.9203 14.2608 18.9203H12.1392C11.4 18.9203 10.8 19.5203 10.8 20.2607C10.8 20.2976 10.7854 20.333 10.7593 20.3591C10.7331 20.3852 10.6977 20.3999 10.6608 20.3999H9.00002C8.84089 20.3999 8.68828 20.3366 8.57576 20.2241C8.46324 20.1116 8.40002 19.959 8.40002 19.7999V18.7799C8.39968 18.6542 8.35988 18.5318 8.28624 18.43C8.21261 18.3281 8.10886 18.252 7.98962 18.2123L7.94162 18.1895C7.84633 18.1426 7.75414 18.0897 7.66562 18.0311C7.40162 17.8607 6.98522 17.5439 6.42722 16.9787C5.92391 16.4606 5.51857 15.8556 5.23082 15.1931C5.01002 14.6867 4.54802 14.2415 3.93002 14.1371C3.83803 14.1215 3.75448 14.074 3.69411 14.0028C3.63374 13.9317 3.60042 13.8416 3.60002 13.7483V11.9399C3.60002 11.8575 3.6292 11.7779 3.68237 11.7151C3.73553 11.6522 3.80925 11.6103 3.89042 11.5967C4.55042 11.4851 5.01842 10.9799 5.20082 10.4231C5.35682 9.94546 5.63762 9.31906 6.10322 8.84746C6.49586 8.45592 6.93516 8.11415 7.41122 7.82986C7.60197 7.71514 7.7982 7.60982 7.99922 7.51426L8.03042 7.49986L8.03642 7.49746C8.14461 7.45108 8.23677 7.3739 8.30142 7.27554C8.36607 7.17717 8.40036 7.06197 8.40002 6.94426V4.42786C8.70362 4.69186 9.05762 4.97746 9.43922 5.23186C9.96002 5.58226 10.5804 5.91106 11.2176 6.02986C11.364 5.63026 11.5584 5.24866 11.7936 4.89226C11.7204 4.88449 11.6472 4.87689 11.574 4.86946C11.148 4.82626 10.6356 4.58986 10.1064 4.23586C9.62995 3.9082 9.18233 3.54047 8.76842 3.13666C8.63891 3.01309 8.47633 2.92975 8.30039 2.89673C8.12446 2.86372 7.94273 2.88245 7.77722 2.95066C7.60738 3.01733 7.46152 3.13355 7.35858 3.28421C7.25565 3.43486 7.2004 3.61299 7.20002 3.79546V6.57226C6.48301 6.95131 5.82559 7.43366 5.24882 8.00386C4.59722 8.66386 4.24322 9.49186 4.06082 10.0499C3.98882 10.2635 3.83282 10.3895 3.69122 10.4135C3.33049 10.4741 3.0029 10.6606 2.76655 10.9398C2.53019 11.219 2.40034 11.5729 2.40002 11.9387V13.7471C2.39984 14.1243 2.53328 14.4894 2.77667 14.7776C3.02007 15.0658 3.35768 15.2585 3.72962 15.3215C3.87962 15.3455 4.04162 15.4679 4.13042 15.6731C4.47722 16.4705 4.96595 17.1983 5.57282 17.8211C6.18362 18.4403 6.66602 18.8135 7.01162 19.0379C7.08002 19.0823 7.14362 19.1207 7.20002 19.1543V19.7999C7.20002 20.0362 7.24658 20.2703 7.33704 20.4887C7.4275 20.7071 7.56009 20.9055 7.72723 21.0726C7.89438 21.2398 8.09281 21.3724 8.31119 21.4628C8.52958 21.5533 8.76364 21.5999 9.00002 21.5999H10.6608C11.4 21.5999 12 20.9999 12 20.2607C12 20.1827 12.0624 20.1203 12.1392 20.1203H14.2608C14.3376 20.1203 14.4 20.1827 14.4 20.2607C14.4 20.9999 15 21.5999 15.7392 21.5999H17.4C17.8774 21.5999 18.3353 21.4102 18.6728 21.0726C19.0104 20.7351 19.2 20.2772 19.2 19.7999V18.0971C19.6167 17.7511 19.9841 17.3498 20.292 16.9043C20.958 15.9479 21.6 14.4731 21.6 12.3695C21.6 11.4983 21.4788 10.7183 21.2484 10.0211C21.0252 10.5407 20.7204 11.0243 20.3436 11.4539Z"
                                                    fill="#E0B406"
                                                />
                                                <path
                                                    d="M20.1624 6.27844C20.5226 7.14862 20.5799 8.1146 20.325 9.02124C20.0702 9.92788 19.518 10.7226 18.7572 11.2776C18.2412 11.652 17.5608 11.6256 16.9728 11.382L13.3248 9.87124C12.7368 9.62764 12.2364 9.16564 12.1368 8.53684C11.9816 7.52346 12.2023 6.48828 12.7574 5.62639C13.3126 4.7645 14.1638 4.13542 15.1507 3.85771C16.1376 3.58 17.1919 3.67285 18.1151 4.11874C19.0383 4.56464 19.7665 5.3328 20.1624 6.27844ZM18.0504 10.308C18.4816 9.99444 18.8214 9.57161 19.0348 9.08308C19.2483 8.59454 19.3277 8.05795 19.2649 7.52853C19.2021 6.99911 18.9993 6.49599 18.6775 6.07096C18.3556 5.64593 17.9264 5.31433 17.4338 5.11031C16.9413 4.90629 16.4032 4.83722 15.8751 4.91019C15.347 4.98316 14.8479 5.19555 14.4291 5.5255C14.0104 5.85544 13.6871 6.29102 13.4926 6.7874C13.2981 7.28378 13.2393 7.82303 13.3224 8.34964C13.3365 8.41772 13.3713 8.47977 13.422 8.52724C13.4988 8.60884 13.6212 8.69524 13.7844 8.76244L17.4324 10.2744C17.5944 10.3404 17.7432 10.3656 17.8548 10.362C17.9244 10.3648 17.9932 10.3459 18.0516 10.308H18.0504Z"
                                                    fill="#E0B406"
                                                />
                                                <path
                                                    d="M8.10001 11.4001C8.33871 11.4001 8.56763 11.3053 8.73641 11.1365C8.90519 10.9677 9.00001 10.7388 9.00001 10.5001C9.00001 10.2614 8.90519 10.0325 8.73641 9.8637C8.56763 9.69492 8.33871 9.6001 8.10001 9.6001C7.86132 9.6001 7.6324 9.69492 7.46362 9.8637C7.29483 10.0325 7.20001 10.2614 7.20001 10.5001C7.20001 10.7388 7.29483 10.9677 7.46362 11.1365C7.6324 11.3053 7.86132 11.4001 8.10001 11.4001Z"
                                                    fill="#E0B406"
                                                />
                                            </svg>
                                        </a>
                                    </div>
                                    <div
                                        class="flex pl-4 justify-center flex-col"
                                    >
                                        <span
                                            class="text-gray-600 mb-1 capitalize"
                                        >
                                            total saving Goals
                                        </span>
                                        <span class="font-semibold">

                                            <format-rupiah :item="totalSaving">
                                                
                                            </format-rupiah>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <doughnut-chart :chart-data="dataChart" :options="optionChart"  ></doughnut-chart>
                        </div>
                        <div class="pt-8">
                            <h1 class="text-sm font-semibold">
                                Where I spent my money?
                              
                               <!--  {{categoryChart}} -->
                            </h1>
                            <div class="mt-4 flex flex-col">
                                <div v-for="category in categoryChart" :key="category.id" :category-id="category.id" class="py-2">
                                    <div
                                        class="flex justify-between items-center"
                                    >
                                        <h2
                                            class="text-gray-900 font-semibold text-xs"
                                        >
                                            {{category.category_name}}
                                        </h2>
                                        <h4 class="text-gray-800 text-xs">
                                            <format-rupiah :item="category.chartData"></format-rupiah>
                                        </h4>
                                    </div>
                                    <div
                                        :style="{ width: category.bar+'%' }"
                                        class=" h-4 mt-2 bg-red-200 transition-all duration-700 rounded-full"
                                    ></div>
                                </div>
                            </div>
                        </div>
                            
                        </div>
                        <div style="bottom:16px; right:6px;" class="fixed z-30">
                            <div id="helper" class="relative text-xs">
                                <div
                                    v-show="showMenuHelper"
                                    style="bottom:86px; right:8px;"
                                    class="bg-white pt-4 shadow-xl w-64 absolute   rounded-lg"
                                >
                                    <ul>
                                        <li>
                                            <a
                                                @click="faqAddTransaction"
                                                class="py-4 px-4 cursor-pointer block hover:bg-gray-200"
                                                >Add New Transaction</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                @click="faqChangeCategoryName"
                                                class="py-4 px-4 cursor-pointer block hover:bg-gray-200"
                                                >Change Category Names</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                @click="faqTransactionHistory"
                                                class="py-4 px-4 cursor-pointer block hover:bg-gray-200"
                                                >Transaction History</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                @click="faqMonthlySavingGoals"
                                                class="py-4 cursor-pointer px-4 block hover:bg-gray-200"
                                                >Monthly Saving Goals</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href=""
                                                style="border-top-width:1px;"
                                                class=" border-gray-200 py-4 px-4 block hover:bg-gray-200"
                                                >Show All Guides</a
                                            >
                                        </li>
                                    </ul>
                                </div>
                                <a
                                    @click="showMenuHelper = !showMenuHelper"
                                    style="z-index: 100; right:0px; bottom:16px;"
                                    class="absolute w-12 h-12 bg-blue-400 text-white black flex justify-center items-center rounded-full"
                                >
                                   <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </template>
            </sidebar-vue>
        </div>
    </div>
</template>

<script>
import FormatRupiah from '../../components/FormatRupiah';
import brand from "../../assets/images/logo.png";
// import Chart from "chart.js";
import Modal from "../../components/Modal";
import icon_calendar from "../../assets/images/icon_calendar.png";
import icon_box from "../../assets/images/icon_box.png";
import icon_ayam from "../../assets/images/ayam.png";
import Category from "../../components/Category.vue";
import SidebarVue from "../../components/Sidebar.vue";
import faqGoals from "../../assets/images/faqGoals.png";
import CardVue from "../../components/Card.vue";
import DatePicker from 'vue2-datepicker';
import BudgetDetail from '../../mixins/BudgetDetailMixins';
// import FormatLocaleDateMixins from '../../mixins/FormatLocaleDate  Mixins.js';
// import DoughnutChart from '../../components/chart/Dougnut.vue';
import DoughnutChart from '../../components/chart/donat.js';

import { mapActions, mapGetters, mapState } from "vuex";

import moment from 'moment';

export default {
    components: {
        Category,
        SidebarVue,
        CardVue,
        Modal,
        FormatRupiah,
        DoughnutChart,
        DatePicker
    },
    data() {
        return {
            modalCategoryGroup: false,
            notCorrectPassword: false,
            faqGoals: faqGoals,
            brand: brand,
            showProfileSetting: false,
            showNewBudget: false,
            icon_ayam: icon_ayam,
            icon_calendar: icon_calendar,
            icon_box: icon_box,
            sub_category_id: null,
            showProfileMenu: false,
            showMenuHelper: false,
            showNotif: false,
            avatar: null,
            avatarUrl : null,
            filterCategoryByMonth: null,
            showSubCategoryDetail: false, 
            budgeted:[],
            editPassword: false,
            showGoals : false,
            activity:[],
            coba: '2019-20-11',
            showFaq: false,
            faqPosition: {},
            faq: null,
            currentFaq: null,
            modalFaq: {
                style: {},
                header: '',
                body: ''
            },
           

            form: {
                budget: {
                    name_budget: null
                },
                category: {
                    name_category: null
                },
                transaction: {
                    date: moment().format('YYYY-MM-DD'),
                    expense: 0,
                    income: 0,
                    sub_category:null,
                },
                user: {
                    firstname: null,
                    lastname: null,
                    email: null,
                    photos: null,
                    password: null,
                    password_confirmation: null,

                },
                saving_goals: {
                    amount: null,
                    finishBy: null,
                    period: null,
                },
                error: null
            }
        };
    },
    methods: {
        ...mapActions({
            //budget
            createBudget: "budget/createBudget",
            fetchData: "budget/fetchData",


            //category
            fetchCategoryData: "category/fetchData",
            addNewCategory: "category/addNewCategory",

            //transaction
            storeActivity : "activity/storeActivity",

            userUpdate: 'user/update',
            editSavingGoals: 'sub_category/editSavingGoals',
            //auth
            logout: 'user/logout',
        }),
        changeAvatar() {
            this.avatar = this.$refs.avatar.files[0];
            this.avatarUrl = URL.createObjectURL(this.avatar);
        },
        formatDate(value){
            const date = new Date(value);
            // console.log(date);
            const dd = date.getDay();
            const mm = date.getMonth()+1;
            const yy = date.getFullYear();

            if(mm > 9 || dd > 9) {

                return `${yy}-${mm}-${dd}`;
            }
            return `${yy}-0${mm}-0${dd}`;
        },
        updateSavingGoals(id){
            const data = this.form.saving_goals;
            data['id'] = id

            this.editSavingGoals(data).then((res) => {
                this.showGoals = false
            })
            
        },
        subCategoryDetail(id) {
            // console.log(id);
            this.$store.state.modal.showSubCategoryDetail = true
            this.sub_category_id = id
            
            if(this.$store.state.modal.showSubCategoryDetail) {
             

                if(this.sub_category_detail != null) {
                    this.form.saving_goals = this.sub_category_detail
                   
                }
                 
            }
        },
        updateUser() {
            const formData = new FormData()

            if(this.form.user.password != undefined || this.form.user.password != null)
            {
                formData.append('password', this.form.user.password);
            }
            formData.append('photos', this.avatar);
            formData.append('firstname', this.form.user.firstname)
            formData.append('lastname', this.form.user.lastname)
            

            // const data = this.form.user
            // data.photos = this.avatar
            // console.log(data);
            // console.log(this.form.user.password);
            this.userUpdate(formData)
            .then((resp) => {
                this.showProfileSetting = false
                this.editPassword = false
                // console.log(resp)
            })
            .catch((err) => {
                console.log(err.response)
            })
        },
        userLogout() {
            this.logout().then(()=> {
                this.$router.replace('/')
            })
        },
        addTransaction() {
            // console.log(this.form.transaction);
            const transaction = this.form.transaction
            
            console.log(transaction);
             
            this.storeActivity(this.form.transaction).then((res)=> {
               window.location.reload();
            });
        },
        createNewBudget(e) {
            const data = {
                name_budget: this.form.budget.new_budget
            };
            this.createBudget(data)
                .then(res => {
                    // console.log(res.data);
                    this.showNewBudget = false;
                })
                .catch(err => {
                    console.log(err);
                });
            e.preventDefault();
        },
        fetchCategory(budget_id) {
         
            this.fetchCategoryData(budget_id).then(res => {
              console.log(res);
            });
            
            // console.log(this.category)
        },
        addCategory() {
            const data = {
                name_category: this.form.category.name_category,
                budget_id: localStorage.getItem("budget_id")
            };
            this.addNewCategory(data);

            this.modalCategoryGroup = false;
        },
         password_confirmation(key) {

            // console.log(key);
            // if(this.form.user.password != this.form.user.password_confirmation) {
            //     console.log("password salah");
            //     this.error = "password confirmation incorrected"
            // }
            // else {
            //     console.log('password benar');
            //     console.log(this.error);

            //     this.error = null;
            // }
        },
         updateChart() {

            this.categoryChart.forEach( function(element, index) {
                this.chart.push(element);
            });
        },
        faqAddTransaction(){
            this.faqPosition = {}
            this.currentFaq = 'transaction'
            
            this.faq = this.$refs.transaction.outerHTML;
            this.modalFaq['style']['bottom'] = '-225px'
            this.modalFaq['style']['left'] = '0px';
            this.modalFaq['style']['right'] = ''
            this.modalFaq['style']['top'] = ''
            this.modalFaq['style']['max-width'] = '400px'
            
            this.modalFaq['header'] = 'Tambahkan pengeluaran dan pemasukanmu'
            this.modalFaq['body'] = `Untuk mulai budgeting, kamu bisa sekaligus langsung
                                        memasukan pengeluaran dan pemasukan kamu sesuai
                        dengan kategorinya`
           

            this.showFaq = true
            this.showMenuHelper = false
            
            const faq = {}
           
            window.scrollTo(0, 0);

            const faqTransaction = this.$refs.transaction.getBoundingClientRect()
            //  console.log(faqTransaction);
            for (let key in faqTransaction) {
                faq[key] = faqTransaction[key]+'px';
            }
            

            this.faqPosition = faq;

          

        },
        faqChangeCategoryName() {
             this.showFaq = true
             this.currentFaq = 'category'
             this.faq = `<div class="p-4 bg-white rounded-2xl shadow-md">
                 
              <svg width="471" height="310" viewBox="0 0 471 310" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M10.0001 2.42847C14.7337 2.42847 18.5716 6.26632 18.5716 10.9999C18.5716 15.7335 14.7337 19.5713 10.0001 19.5713C5.26657 19.5713 1.42871 15.7335 1.42871 10.9999C1.42871 6.26632 5.26657 2.42847 10.0001 2.42847ZM10.0001 3.4999C5.858 3.4999 2.50014 6.85775 2.50014 10.9999C2.50014 15.142 5.858 18.4999 10.0001 18.4999C14.1423 18.4999 17.5001 15.142 17.5001 10.9999C17.5001 6.85775 14.1423 3.4999 10.0001 3.4999ZM10.0001 6.71418C10.1422 6.71418 10.2785 6.77062 10.3789 6.87109C10.4794 6.97155 10.5359 7.10781 10.5359 7.2499V10.4642H13.7501C13.8922 10.4642 14.0285 10.5206 14.1289 10.6211C14.2294 10.7216 14.2859 10.8578 14.2859 10.9999C14.2859 11.142 14.2294 11.2782 14.1289 11.3787C14.0285 11.4792 13.8922 11.5356 13.7501 11.5356H10.5359V14.7499C10.5359 14.892 10.4794 15.0282 10.3789 15.1287C10.2785 15.2292 10.1422 15.2856 10.0001 15.2856C9.85806 15.2856 9.7218 15.2292 9.62133 15.1287C9.52087 15.0282 9.46443 14.892 9.46443 14.7499V11.5356H6.25014C6.10806 11.5356 5.9718 11.4792 5.87133 11.3787C5.77087 11.2782 5.71443 11.142 5.71443 10.9999C5.71443 10.8578 5.77087 10.7216 5.87133 10.6211C5.9718 10.5206 6.10806 10.4642 6.25014 10.4642H9.46443V7.2499C9.46443 7.10781 9.52087 6.97155 9.62133 6.87109C9.7218 6.77062 9.85806 6.71418 10.0001 6.71418Z" fill="black"/>
<path d="M36.518 10.114C36.518 9.162 36.7373 8.308 37.176 7.552C37.624 6.796 38.226 6.208 38.982 5.788C39.7473 5.35867 40.5827 5.144 41.488 5.144C42.524 5.144 43.4433 5.40067 44.246 5.914C45.058 6.418 45.646 7.13667 46.01 8.07H44.092C43.84 7.55667 43.49 7.174 43.042 6.922C42.594 6.67 42.076 6.544 41.488 6.544C40.844 6.544 40.27 6.68867 39.766 6.978C39.262 7.26733 38.8653 7.68267 38.576 8.224C38.296 8.76533 38.156 9.39533 38.156 10.114C38.156 10.8327 38.296 11.4627 38.576 12.004C38.8653 12.5453 39.262 12.9653 39.766 13.264C40.27 13.5533 40.844 13.698 41.488 13.698C42.076 13.698 42.594 13.572 43.042 13.32C43.49 13.068 43.84 12.6853 44.092 12.172H46.01C45.646 13.1053 45.058 13.824 44.246 14.328C43.4433 14.832 42.524 15.084 41.488 15.084C40.5733 15.084 39.738 14.874 38.982 14.454C38.226 14.0247 37.624 13.432 37.176 12.676C36.7373 11.92 36.518 11.066 36.518 10.114ZM47.3461 11.108C47.3461 10.3333 47.5048 9.64733 47.8221 9.05C48.1488 8.45267 48.5875 7.99067 49.1381 7.664C49.6981 7.328 50.3141 7.16 50.9861 7.16C51.5928 7.16 52.1201 7.28133 52.5681 7.524C53.0255 7.75733 53.3895 8.05133 53.6601 8.406V7.286H55.2701V15H53.6601V13.852C53.3895 14.216 53.0208 14.5193 52.5541 14.762C52.0875 15.0047 51.5555 15.126 50.9581 15.126C50.2955 15.126 49.6888 14.958 49.1381 14.622C48.5875 14.2767 48.1488 13.8007 47.8221 13.194C47.5048 12.578 47.3461 11.8827 47.3461 11.108ZM53.6601 11.136C53.6601 10.604 53.5481 10.142 53.3241 9.75C53.1095 9.358 52.8248 9.05933 52.4701 8.854C52.1155 8.64867 51.7328 8.546 51.3221 8.546C50.9115 8.546 50.5288 8.64867 50.1741 8.854C49.8195 9.05 49.5301 9.344 49.3061 9.736C49.0915 10.1187 48.9841 10.576 48.9841 11.108C48.9841 11.64 49.0915 12.1067 49.3061 12.508C49.5301 12.9093 49.8195 13.2173 50.1741 13.432C50.5381 13.6373 50.9208 13.74 51.3221 13.74C51.7328 13.74 52.1155 13.6373 52.4701 13.432C52.8248 13.2267 53.1095 12.928 53.3241 12.536C53.5481 12.1347 53.6601 11.668 53.6601 11.136ZM59.2284 8.588V12.858C59.2284 13.1473 59.2937 13.3573 59.4244 13.488C59.5644 13.6093 59.7977 13.67 60.1244 13.67H61.1044V15H59.8444C59.1257 15 58.5751 14.832 58.1924 14.496C57.8097 14.16 57.6184 13.614 57.6184 12.858V8.588H56.7084V7.286H57.6184V5.368H59.2284V7.286H61.1044V8.588H59.2284ZM69.6454 10.954C69.6454 11.2433 69.6267 11.5047 69.5894 11.738H63.6954C63.7421 12.354 63.9707 12.8487 64.3814 13.222C64.7921 13.5953 65.2961 13.782 65.8934 13.782C66.7521 13.782 67.3587 13.4227 67.7134 12.704H69.4354C69.2021 13.4133 68.7774 13.9967 68.1614 14.454C67.5547 14.902 66.7987 15.126 65.8934 15.126C65.1561 15.126 64.4934 14.9627 63.9054 14.636C63.3267 14.3 62.8694 13.8333 62.5334 13.236C62.2067 12.6293 62.0434 11.9293 62.0434 11.136C62.0434 10.3427 62.2021 9.64733 62.5194 9.05C62.8461 8.44333 63.2987 7.97667 63.8774 7.65C64.4654 7.32333 65.1374 7.16 65.8934 7.16C66.6214 7.16 67.2701 7.31867 67.8394 7.636C68.4087 7.95333 68.8521 8.40133 69.1694 8.98C69.4867 9.54933 69.6454 10.2073 69.6454 10.954ZM67.9794 10.45C67.9701 9.862 67.7601 9.39067 67.3494 9.036C66.9387 8.68133 66.4301 8.504 65.8234 8.504C65.2727 8.504 64.8014 8.68133 64.4094 9.036C64.0174 9.38133 63.7841 9.85267 63.7094 10.45H67.9794ZM74.324 7.16C74.9213 7.16 75.4487 7.28133 75.906 7.524C76.3727 7.75733 76.7367 8.05133 76.998 8.406V7.286H78.608V15.126C78.608 15.8353 78.4587 16.4653 78.16 17.016C77.8613 17.576 77.4273 18.0147 76.858 18.332C76.298 18.6493 75.626 18.808 74.842 18.808C73.7967 18.808 72.9287 18.5607 72.238 18.066C71.5473 17.5807 71.1553 16.918 71.062 16.078H72.644C72.7653 16.4793 73.022 16.8013 73.414 17.044C73.8153 17.296 74.2913 17.422 74.842 17.422C75.486 17.422 76.004 17.226 76.396 16.834C76.7973 16.442 76.998 15.8727 76.998 15.126V13.838C76.7273 14.202 76.3587 14.51 75.892 14.762C75.4347 15.0047 74.912 15.126 74.324 15.126C73.652 15.126 73.036 14.958 72.476 14.622C71.9253 14.2767 71.4867 13.8007 71.16 13.194C70.8427 12.578 70.684 11.8827 70.684 11.108C70.684 10.3333 70.8427 9.64733 71.16 9.05C71.4867 8.45267 71.9253 7.99067 72.476 7.664C73.036 7.328 73.652 7.16 74.324 7.16ZM76.998 11.136C76.998 10.604 76.886 10.142 76.662 9.75C76.4473 9.358 76.1627 9.05933 75.808 8.854C75.4533 8.64867 75.0707 8.546 74.66 8.546C74.2493 8.546 73.8667 8.64867 73.512 8.854C73.1573 9.05 72.868 9.344 72.644 9.736C72.4293 10.1187 72.322 10.576 72.322 11.108C72.322 11.64 72.4293 12.1067 72.644 12.508C72.868 12.9093 73.1573 13.2173 73.512 13.432C73.876 13.6373 74.2587 13.74 74.66 13.74C75.0707 13.74 75.4533 13.6373 75.808 13.432C76.1627 13.2267 76.4473 12.928 76.662 12.536C76.886 12.1347 76.998 11.668 76.998 11.136ZM84.0503 15.126C83.3223 15.126 82.6643 14.9627 82.0763 14.636C81.4883 14.3 81.0263 13.8333 80.6903 13.236C80.3543 12.6293 80.1863 11.9293 80.1863 11.136C80.1863 10.352 80.359 9.65667 80.7043 9.05C81.0496 8.44333 81.521 7.97667 82.1183 7.65C82.7156 7.32333 83.383 7.16 84.1203 7.16C84.8576 7.16 85.525 7.32333 86.1223 7.65C86.7196 7.97667 87.191 8.44333 87.5363 9.05C87.8816 9.65667 88.0543 10.352 88.0543 11.136C88.0543 11.92 87.877 12.6153 87.5223 13.222C87.1676 13.8287 86.6823 14.3 86.0663 14.636C85.4596 14.9627 84.7876 15.126 84.0503 15.126ZM84.0503 13.74C84.461 13.74 84.8436 13.642 85.1983 13.446C85.5623 13.25 85.8563 12.956 86.0803 12.564C86.3043 12.172 86.4163 11.696 86.4163 11.136C86.4163 10.576 86.309 10.1047 86.0943 9.722C85.8796 9.33 85.595 9.036 85.2403 8.84C84.8856 8.644 84.503 8.546 84.0923 8.546C83.6816 8.546 83.299 8.644 82.9443 8.84C82.599 9.036 82.3236 9.33 82.1183 9.722C81.913 10.1047 81.8103 10.576 81.8103 11.136C81.8103 11.9667 82.0203 12.6107 82.4403 13.068C82.8696 13.516 83.4063 13.74 84.0503 13.74ZM91.228 8.406C91.4614 8.014 91.7694 7.71067 92.152 7.496C92.544 7.272 93.006 7.16 93.538 7.16V8.812H93.132C92.5067 8.812 92.0307 8.97067 91.704 9.288C91.3867 9.60533 91.228 10.156 91.228 10.94V15H89.632V7.286H91.228V8.406ZM101.949 7.286L97.2171 18.626H95.5651L97.1331 14.874L94.0951 7.286H95.8731L98.0431 13.166L100.297 7.286H101.949ZM113.832 8.07C113.58 7.58467 113.23 7.22067 112.782 6.978C112.334 6.726 111.816 6.6 111.228 6.6C110.584 6.6 110.01 6.74467 109.506 7.034C109.002 7.32333 108.606 7.734 108.316 8.266C108.036 8.798 107.896 9.414 107.896 10.114C107.896 10.814 108.036 11.4347 108.316 11.976C108.606 12.508 109.002 12.9187 109.506 13.208C110.01 13.4973 110.584 13.642 111.228 13.642C112.096 13.642 112.801 13.3993 113.342 12.914C113.884 12.4287 114.215 11.7707 114.336 10.94H110.682V9.666H116.044V10.912C115.942 11.668 115.671 12.3633 115.232 12.998C114.803 13.6327 114.238 14.1413 113.538 14.524C112.848 14.8973 112.078 15.084 111.228 15.084C110.314 15.084 109.478 14.874 108.722 14.454C107.966 14.0247 107.364 13.432 106.916 12.676C106.478 11.92 106.258 11.066 106.258 10.114C106.258 9.162 106.478 8.308 106.916 7.552C107.364 6.796 107.966 6.208 108.722 5.788C109.488 5.35867 110.323 5.144 111.228 5.144C112.264 5.144 113.184 5.40067 113.986 5.914C114.798 6.418 115.386 7.13667 115.75 8.07H113.832ZM119.214 8.406C119.448 8.014 119.756 7.71067 120.138 7.496C120.53 7.272 120.992 7.16 121.524 7.16V8.812H121.118C120.493 8.812 120.017 8.97067 119.69 9.288C119.373 9.60533 119.214 10.156 119.214 10.94V15H117.618V7.286H119.214V8.406ZM126.337 15.126C125.609 15.126 124.951 14.9627 124.363 14.636C123.775 14.3 123.313 13.8333 122.977 13.236C122.641 12.6293 122.473 11.9293 122.473 11.136C122.473 10.352 122.646 9.65667 122.991 9.05C123.337 8.44333 123.808 7.97667 124.405 7.65C125.003 7.32333 125.67 7.16 126.407 7.16C127.145 7.16 127.812 7.32333 128.409 7.65C129.007 7.97667 129.478 8.44333 129.823 9.05C130.169 9.65667 130.341 10.352 130.341 11.136C130.341 11.92 130.164 12.6153 129.809 13.222C129.455 13.8287 128.969 14.3 128.353 14.636C127.747 14.9627 127.075 15.126 126.337 15.126ZM126.337 13.74C126.748 13.74 127.131 13.642 127.485 13.446C127.849 13.25 128.143 12.956 128.367 12.564C128.591 12.172 128.703 11.696 128.703 11.136C128.703 10.576 128.596 10.1047 128.381 9.722C128.167 9.33 127.882 9.036 127.527 8.84C127.173 8.644 126.79 8.546 126.379 8.546C125.969 8.546 125.586 8.644 125.231 8.84C124.886 9.036 124.611 9.33 124.405 9.722C124.2 10.1047 124.097 10.576 124.097 11.136C124.097 11.9667 124.307 12.6107 124.727 13.068C125.157 13.516 125.693 13.74 126.337 13.74ZM138.905 7.286V15H137.309V14.09C137.057 14.4073 136.726 14.6593 136.315 14.846C135.914 15.0233 135.484 15.112 135.027 15.112C134.42 15.112 133.874 14.986 133.389 14.734C132.913 14.482 132.535 14.1087 132.255 13.614C131.984 13.1193 131.849 12.522 131.849 11.822V7.286H133.431V11.584C133.431 12.2747 133.604 12.8067 133.949 13.18C134.294 13.544 134.766 13.726 135.363 13.726C135.96 13.726 136.432 13.544 136.777 13.18C137.132 12.8067 137.309 12.2747 137.309 11.584V7.286H138.905ZM142.607 8.42C142.878 8.06533 143.246 7.76667 143.713 7.524C144.18 7.28133 144.707 7.16 145.295 7.16C145.967 7.16 146.578 7.328 147.129 7.664C147.689 7.99067 148.128 8.45267 148.445 9.05C148.762 9.64733 148.921 10.3333 148.921 11.108C148.921 11.8827 148.762 12.578 148.445 13.194C148.128 13.8007 147.689 14.2767 147.129 14.622C146.578 14.958 145.967 15.126 145.295 15.126C144.707 15.126 144.184 15.0093 143.727 14.776C143.27 14.5333 142.896 14.2347 142.607 13.88V18.668H141.011V7.286H142.607V8.42ZM147.297 11.108C147.297 10.576 147.185 10.1187 146.961 9.736C146.746 9.344 146.457 9.05 146.093 8.854C145.738 8.64867 145.356 8.546 144.945 8.546C144.544 8.546 144.161 8.64867 143.797 8.854C143.442 9.05933 143.153 9.358 142.929 9.75C142.714 10.142 142.607 10.604 142.607 11.136C142.607 11.668 142.714 12.1347 142.929 12.536C143.153 12.928 143.442 13.2267 143.797 13.432C144.161 13.6373 144.544 13.74 144.945 13.74C145.356 13.74 145.738 13.6373 146.093 13.432C146.457 13.2173 146.746 12.9093 146.961 12.508C147.185 12.1067 147.297 11.64 147.297 11.108Z" fill="black"/>
<path d="M36.518 10.114C36.518 9.162 36.7373 8.308 37.176 7.552C37.624 6.796 38.226 6.208 38.982 5.788C39.7473 5.35867 40.5827 5.144 41.488 5.144C42.524 5.144 43.4433 5.40067 44.246 5.914C45.058 6.418 45.646 7.13667 46.01 8.07H44.092C43.84 7.55667 43.49 7.174 43.042 6.922C42.594 6.67 42.076 6.544 41.488 6.544C40.844 6.544 40.27 6.68867 39.766 6.978C39.262 7.26733 38.8653 7.68267 38.576 8.224C38.296 8.76533 38.156 9.39533 38.156 10.114C38.156 10.8327 38.296 11.4627 38.576 12.004C38.8653 12.5453 39.262 12.9653 39.766 13.264C40.27 13.5533 40.844 13.698 41.488 13.698C42.076 13.698 42.594 13.572 43.042 13.32C43.49 13.068 43.84 12.6853 44.092 12.172H46.01C45.646 13.1053 45.058 13.824 44.246 14.328C43.4433 14.832 42.524 15.084 41.488 15.084C40.5733 15.084 39.738 14.874 38.982 14.454C38.226 14.0247 37.624 13.432 37.176 12.676C36.7373 11.92 36.518 11.066 36.518 10.114ZM47.3461 11.108C47.3461 10.3333 47.5048 9.64733 47.8221 9.05C48.1488 8.45267 48.5875 7.99067 49.1381 7.664C49.6981 7.328 50.3141 7.16 50.9861 7.16C51.5928 7.16 52.1201 7.28133 52.5681 7.524C53.0255 7.75733 53.3895 8.05133 53.6601 8.406V7.286H55.2701V15H53.6601V13.852C53.3895 14.216 53.0208 14.5193 52.5541 14.762C52.0875 15.0047 51.5555 15.126 50.9581 15.126C50.2955 15.126 49.6888 14.958 49.1381 14.622C48.5875 14.2767 48.1488 13.8007 47.8221 13.194C47.5048 12.578 47.3461 11.8827 47.3461 11.108ZM53.6601 11.136C53.6601 10.604 53.5481 10.142 53.3241 9.75C53.1095 9.358 52.8248 9.05933 52.4701 8.854C52.1155 8.64867 51.7328 8.546 51.3221 8.546C50.9115 8.546 50.5288 8.64867 50.1741 8.854C49.8195 9.05 49.5301 9.344 49.3061 9.736C49.0915 10.1187 48.9841 10.576 48.9841 11.108C48.9841 11.64 49.0915 12.1067 49.3061 12.508C49.5301 12.9093 49.8195 13.2173 50.1741 13.432C50.5381 13.6373 50.9208 13.74 51.3221 13.74C51.7328 13.74 52.1155 13.6373 52.4701 13.432C52.8248 13.2267 53.1095 12.928 53.3241 12.536C53.5481 12.1347 53.6601 11.668 53.6601 11.136ZM59.2284 8.588V12.858C59.2284 13.1473 59.2937 13.3573 59.4244 13.488C59.5644 13.6093 59.7977 13.67 60.1244 13.67H61.1044V15H59.8444C59.1257 15 58.5751 14.832 58.1924 14.496C57.8097 14.16 57.6184 13.614 57.6184 12.858V8.588H56.7084V7.286H57.6184V5.368H59.2284V7.286H61.1044V8.588H59.2284ZM69.6454 10.954C69.6454 11.2433 69.6267 11.5047 69.5894 11.738H63.6954C63.7421 12.354 63.9707 12.8487 64.3814 13.222C64.7921 13.5953 65.2961 13.782 65.8934 13.782C66.7521 13.782 67.3587 13.4227 67.7134 12.704H69.4354C69.2021 13.4133 68.7774 13.9967 68.1614 14.454C67.5547 14.902 66.7987 15.126 65.8934 15.126C65.1561 15.126 64.4934 14.9627 63.9054 14.636C63.3267 14.3 62.8694 13.8333 62.5334 13.236C62.2067 12.6293 62.0434 11.9293 62.0434 11.136C62.0434 10.3427 62.2021 9.64733 62.5194 9.05C62.8461 8.44333 63.2987 7.97667 63.8774 7.65C64.4654 7.32333 65.1374 7.16 65.8934 7.16C66.6214 7.16 67.2701 7.31867 67.8394 7.636C68.4087 7.95333 68.8521 8.40133 69.1694 8.98C69.4867 9.54933 69.6454 10.2073 69.6454 10.954ZM67.9794 10.45C67.9701 9.862 67.7601 9.39067 67.3494 9.036C66.9387 8.68133 66.4301 8.504 65.8234 8.504C65.2727 8.504 64.8014 8.68133 64.4094 9.036C64.0174 9.38133 63.7841 9.85267 63.7094 10.45H67.9794ZM74.324 7.16C74.9213 7.16 75.4487 7.28133 75.906 7.524C76.3727 7.75733 76.7367 8.05133 76.998 8.406V7.286H78.608V15.126C78.608 15.8353 78.4587 16.4653 78.16 17.016C77.8613 17.576 77.4273 18.0147 76.858 18.332C76.298 18.6493 75.626 18.808 74.842 18.808C73.7967 18.808 72.9287 18.5607 72.238 18.066C71.5473 17.5807 71.1553 16.918 71.062 16.078H72.644C72.7653 16.4793 73.022 16.8013 73.414 17.044C73.8153 17.296 74.2913 17.422 74.842 17.422C75.486 17.422 76.004 17.226 76.396 16.834C76.7973 16.442 76.998 15.8727 76.998 15.126V13.838C76.7273 14.202 76.3587 14.51 75.892 14.762C75.4347 15.0047 74.912 15.126 74.324 15.126C73.652 15.126 73.036 14.958 72.476 14.622C71.9253 14.2767 71.4867 13.8007 71.16 13.194C70.8427 12.578 70.684 11.8827 70.684 11.108C70.684 10.3333 70.8427 9.64733 71.16 9.05C71.4867 8.45267 71.9253 7.99067 72.476 7.664C73.036 7.328 73.652 7.16 74.324 7.16ZM76.998 11.136C76.998 10.604 76.886 10.142 76.662 9.75C76.4473 9.358 76.1627 9.05933 75.808 8.854C75.4533 8.64867 75.0707 8.546 74.66 8.546C74.2493 8.546 73.8667 8.64867 73.512 8.854C73.1573 9.05 72.868 9.344 72.644 9.736C72.4293 10.1187 72.322 10.576 72.322 11.108C72.322 11.64 72.4293 12.1067 72.644 12.508C72.868 12.9093 73.1573 13.2173 73.512 13.432C73.876 13.6373 74.2587 13.74 74.66 13.74C75.0707 13.74 75.4533 13.6373 75.808 13.432C76.1627 13.2267 76.4473 12.928 76.662 12.536C76.886 12.1347 76.998 11.668 76.998 11.136ZM84.0503 15.126C83.3223 15.126 82.6643 14.9627 82.0763 14.636C81.4883 14.3 81.0263 13.8333 80.6903 13.236C80.3543 12.6293 80.1863 11.9293 80.1863 11.136C80.1863 10.352 80.359 9.65667 80.7043 9.05C81.0496 8.44333 81.521 7.97667 82.1183 7.65C82.7156 7.32333 83.383 7.16 84.1203 7.16C84.8576 7.16 85.525 7.32333 86.1223 7.65C86.7196 7.97667 87.191 8.44333 87.5363 9.05C87.8816 9.65667 88.0543 10.352 88.0543 11.136C88.0543 11.92 87.877 12.6153 87.5223 13.222C87.1676 13.8287 86.6823 14.3 86.0663 14.636C85.4596 14.9627 84.7876 15.126 84.0503 15.126ZM84.0503 13.74C84.461 13.74 84.8436 13.642 85.1983 13.446C85.5623 13.25 85.8563 12.956 86.0803 12.564C86.3043 12.172 86.4163 11.696 86.4163 11.136C86.4163 10.576 86.309 10.1047 86.0943 9.722C85.8796 9.33 85.595 9.036 85.2403 8.84C84.8856 8.644 84.503 8.546 84.0923 8.546C83.6816 8.546 83.299 8.644 82.9443 8.84C82.599 9.036 82.3236 9.33 82.1183 9.722C81.913 10.1047 81.8103 10.576 81.8103 11.136C81.8103 11.9667 82.0203 12.6107 82.4403 13.068C82.8696 13.516 83.4063 13.74 84.0503 13.74ZM91.228 8.406C91.4614 8.014 91.7694 7.71067 92.152 7.496C92.544 7.272 93.006 7.16 93.538 7.16V8.812H93.132C92.5067 8.812 92.0307 8.97067 91.704 9.288C91.3867 9.60533 91.228 10.156 91.228 10.94V15H89.632V7.286H91.228V8.406ZM101.949 7.286L97.2171 18.626H95.5651L97.1331 14.874L94.0951 7.286H95.8731L98.0431 13.166L100.297 7.286H101.949ZM113.832 8.07C113.58 7.58467 113.23 7.22067 112.782 6.978C112.334 6.726 111.816 6.6 111.228 6.6C110.584 6.6 110.01 6.74467 109.506 7.034C109.002 7.32333 108.606 7.734 108.316 8.266C108.036 8.798 107.896 9.414 107.896 10.114C107.896 10.814 108.036 11.4347 108.316 11.976C108.606 12.508 109.002 12.9187 109.506 13.208C110.01 13.4973 110.584 13.642 111.228 13.642C112.096 13.642 112.801 13.3993 113.342 12.914C113.884 12.4287 114.215 11.7707 114.336 10.94H110.682V9.666H116.044V10.912C115.942 11.668 115.671 12.3633 115.232 12.998C114.803 13.6327 114.238 14.1413 113.538 14.524C112.848 14.8973 112.078 15.084 111.228 15.084C110.314 15.084 109.478 14.874 108.722 14.454C107.966 14.0247 107.364 13.432 106.916 12.676C106.478 11.92 106.258 11.066 106.258 10.114C106.258 9.162 106.478 8.308 106.916 7.552C107.364 6.796 107.966 6.208 108.722 5.788C109.488 5.35867 110.323 5.144 111.228 5.144C112.264 5.144 113.184 5.40067 113.986 5.914C114.798 6.418 115.386 7.13667 115.75 8.07H113.832ZM119.214 8.406C119.448 8.014 119.756 7.71067 120.138 7.496C120.53 7.272 120.992 7.16 121.524 7.16V8.812H121.118C120.493 8.812 120.017 8.97067 119.69 9.288C119.373 9.60533 119.214 10.156 119.214 10.94V15H117.618V7.286H119.214V8.406ZM126.337 15.126C125.609 15.126 124.951 14.9627 124.363 14.636C123.775 14.3 123.313 13.8333 122.977 13.236C122.641 12.6293 122.473 11.9293 122.473 11.136C122.473 10.352 122.646 9.65667 122.991 9.05C123.337 8.44333 123.808 7.97667 124.405 7.65C125.003 7.32333 125.67 7.16 126.407 7.16C127.145 7.16 127.812 7.32333 128.409 7.65C129.007 7.97667 129.478 8.44333 129.823 9.05C130.169 9.65667 130.341 10.352 130.341 11.136C130.341 11.92 130.164 12.6153 129.809 13.222C129.455 13.8287 128.969 14.3 128.353 14.636C127.747 14.9627 127.075 15.126 126.337 15.126ZM126.337 13.74C126.748 13.74 127.131 13.642 127.485 13.446C127.849 13.25 128.143 12.956 128.367 12.564C128.591 12.172 128.703 11.696 128.703 11.136C128.703 10.576 128.596 10.1047 128.381 9.722C128.167 9.33 127.882 9.036 127.527 8.84C127.173 8.644 126.79 8.546 126.379 8.546C125.969 8.546 125.586 8.644 125.231 8.84C124.886 9.036 124.611 9.33 124.405 9.722C124.2 10.1047 124.097 10.576 124.097 11.136C124.097 11.9667 124.307 12.6107 124.727 13.068C125.157 13.516 125.693 13.74 126.337 13.74ZM138.905 7.286V15H137.309V14.09C137.057 14.4073 136.726 14.6593 136.315 14.846C135.914 15.0233 135.484 15.112 135.027 15.112C134.42 15.112 133.874 14.986 133.389 14.734C132.913 14.482 132.535 14.1087 132.255 13.614C131.984 13.1193 131.849 12.522 131.849 11.822V7.286H133.431V11.584C133.431 12.2747 133.604 12.8067 133.949 13.18C134.294 13.544 134.766 13.726 135.363 13.726C135.96 13.726 136.432 13.544 136.777 13.18C137.132 12.8067 137.309 12.2747 137.309 11.584V7.286H138.905ZM142.607 8.42C142.878 8.06533 143.246 7.76667 143.713 7.524C144.18 7.28133 144.707 7.16 145.295 7.16C145.967 7.16 146.578 7.328 147.129 7.664C147.689 7.99067 148.128 8.45267 148.445 9.05C148.762 9.64733 148.921 10.3333 148.921 11.108C148.921 11.8827 148.762 12.578 148.445 13.194C148.128 13.8007 147.689 14.2767 147.129 14.622C146.578 14.958 145.967 15.126 145.295 15.126C144.707 15.126 144.184 15.0093 143.727 14.776C143.27 14.5333 142.896 14.2347 142.607 13.88V18.668H141.011V7.286H142.607V8.42ZM147.297 11.108C147.297 10.576 147.185 10.1187 146.961 9.736C146.746 9.344 146.457 9.05 146.093 8.854C145.738 8.64867 145.356 8.546 144.945 8.546C144.544 8.546 144.161 8.64867 143.797 8.854C143.442 9.05933 143.153 9.358 142.929 9.75C142.714 10.142 142.607 10.604 142.607 11.136C142.607 11.668 142.714 12.1347 142.929 12.536C143.153 12.928 143.442 13.2267 143.797 13.432C144.161 13.6373 144.544 13.74 144.945 13.74C145.356 13.74 145.738 13.6373 146.093 13.432C146.457 13.2173 146.746 12.9093 146.961 12.508C147.185 12.1067 147.297 11.64 147.297 11.108Z" fill="black"/>
<rect x="1" y="57" width="14" height="14" rx="3" stroke="#D5D5D5" stroke-width="2"/>
<path opacity="0.89" d="M51.518 63.114C51.518 62.162 51.7373 61.308 52.176 60.552C52.624 59.796 53.226 59.208 53.982 58.788C54.7473 58.3587 55.5827 58.144 56.488 58.144C57.524 58.144 58.4433 58.4007 59.246 58.914C60.058 59.418 60.646 60.1367 61.01 61.07H59.092C58.84 60.5567 58.49 60.174 58.042 59.922C57.594 59.67 57.076 59.544 56.488 59.544C55.844 59.544 55.27 59.6887 54.766 59.978C54.262 60.2673 53.8653 60.6827 53.576 61.224C53.296 61.7653 53.156 62.3953 53.156 63.114C53.156 63.8327 53.296 64.4627 53.576 65.004C53.8653 65.5453 54.262 65.9653 54.766 66.264C55.27 66.5533 55.844 66.698 56.488 66.698C57.076 66.698 57.594 66.572 58.042 66.32C58.49 66.068 58.84 65.6853 59.092 65.172H61.01C60.646 66.1053 60.058 66.824 59.246 67.328C58.4433 67.832 57.524 68.084 56.488 68.084C55.5733 68.084 54.738 67.874 53.982 67.454C53.226 67.0247 52.624 66.432 52.176 65.676C51.7373 64.92 51.518 64.066 51.518 63.114ZM62.4861 64.108C62.4861 63.3333 62.6448 62.6473 62.9621 62.05C63.2888 61.4527 63.7275 60.9907 64.2781 60.664C64.8381 60.328 65.4541 60.16 66.1261 60.16C66.7328 60.16 67.2601 60.2813 67.7081 60.524C68.1655 60.7573 68.5295 61.0513 68.8001 61.406V60.286H70.4101V68H68.8001V66.852C68.5295 67.216 68.1608 67.5193 67.6941 67.762C67.2275 68.0047 66.6955 68.126 66.0981 68.126C65.4355 68.126 64.8288 67.958 64.2781 67.622C63.7275 67.2767 63.2888 66.8007 62.9621 66.194C62.6448 65.578 62.4861 64.8827 62.4861 64.108ZM68.8001 64.136C68.8001 63.604 68.6881 63.142 68.4641 62.75C68.2495 62.358 67.9648 62.0593 67.6101 61.854C67.2555 61.6487 66.8728 61.546 66.4621 61.546C66.0515 61.546 65.6688 61.6487 65.3141 61.854C64.9595 62.05 64.6701 62.344 64.4461 62.736C64.2315 63.1187 64.1241 63.576 64.1241 64.108C64.1241 64.64 64.2315 65.1067 64.4461 65.508C64.6701 65.9093 64.9595 66.2173 65.3141 66.432C65.6781 66.6373 66.0608 66.74 66.4621 66.74C66.8728 66.74 67.2555 66.6373 67.6101 66.432C67.9648 66.2267 68.2495 65.928 68.4641 65.536C68.6881 65.1347 68.8001 64.668 68.8001 64.136ZM74.5084 61.588V65.858C74.5084 66.1473 74.5737 66.3573 74.7044 66.488C74.8444 66.6093 75.0777 66.67 75.4044 66.67H76.3844V68H75.1244C74.4057 68 73.8551 67.832 73.4724 67.496C73.0897 67.16 72.8984 66.614 72.8984 65.858V61.588H71.9884V60.286H72.8984V58.368H74.5084V60.286H76.3844V61.588H74.5084ZM85.0654 63.954C85.0654 64.2433 85.0467 64.5047 85.0094 64.738H79.1154C79.1621 65.354 79.3907 65.8487 79.8014 66.222C80.2121 66.5953 80.7161 66.782 81.3134 66.782C82.1721 66.782 82.7787 66.4227 83.1334 65.704H84.8554C84.6221 66.4133 84.1974 66.9967 83.5814 67.454C82.9747 67.902 82.2187 68.126 81.3134 68.126C80.5761 68.126 79.9134 67.9627 79.3254 67.636C78.7467 67.3 78.2894 66.8333 77.9534 66.236C77.6267 65.6293 77.4634 64.9293 77.4634 64.136C77.4634 63.3427 77.6221 62.6473 77.9394 62.05C78.2661 61.4433 78.7187 60.9767 79.2974 60.65C79.8854 60.3233 80.5574 60.16 81.3134 60.16C82.0414 60.16 82.6901 60.3187 83.2594 60.636C83.8287 60.9533 84.2721 61.4013 84.5894 61.98C84.9067 62.5493 85.0654 63.2073 85.0654 63.954ZM83.3994 63.45C83.3901 62.862 83.1801 62.3907 82.7694 62.036C82.3587 61.6813 81.8501 61.504 81.2434 61.504C80.6927 61.504 80.2214 61.6813 79.8294 62.036C79.4374 62.3813 79.2041 62.8527 79.1294 63.45H83.3994ZM89.884 60.16C90.4814 60.16 91.0087 60.2813 91.466 60.524C91.9327 60.7573 92.2967 61.0513 92.558 61.406V60.286H94.168V68.126C94.168 68.8353 94.0187 69.4653 93.72 70.016C93.4214 70.576 92.9874 71.0147 92.418 71.332C91.858 71.6493 91.186 71.808 90.402 71.808C89.3567 71.808 88.4887 71.5607 87.798 71.066C87.1074 70.5807 86.7154 69.918 86.622 69.078H88.204C88.3254 69.4793 88.582 69.8013 88.974 70.044C89.3754 70.296 89.8514 70.422 90.402 70.422C91.046 70.422 91.564 70.226 91.956 69.834C92.3574 69.442 92.558 68.8727 92.558 68.126V66.838C92.2874 67.202 91.9187 67.51 91.452 67.762C90.9947 68.0047 90.472 68.126 89.884 68.126C89.212 68.126 88.596 67.958 88.036 67.622C87.4854 67.2767 87.0467 66.8007 86.72 66.194C86.4027 65.578 86.244 64.8827 86.244 64.108C86.244 63.3333 86.4027 62.6473 86.72 62.05C87.0467 61.4527 87.4854 60.9907 88.036 60.664C88.596 60.328 89.212 60.16 89.884 60.16ZM92.558 64.136C92.558 63.604 92.446 63.142 92.222 62.75C92.0074 62.358 91.7227 62.0593 91.368 61.854C91.0134 61.6487 90.6307 61.546 90.22 61.546C89.8094 61.546 89.4267 61.6487 89.072 61.854C88.7174 62.05 88.428 62.344 88.204 62.736C87.9894 63.1187 87.882 63.576 87.882 64.108C87.882 64.64 87.9894 65.1067 88.204 65.508C88.428 65.9093 88.7174 66.2173 89.072 66.432C89.436 66.6373 89.8187 66.74 90.22 66.74C90.6307 66.74 91.0134 66.6373 91.368 66.432C91.7227 66.2267 92.0074 65.928 92.222 65.536C92.446 65.1347 92.558 64.668 92.558 64.136ZM99.7503 68.126C99.0223 68.126 98.3643 67.9627 97.7763 67.636C97.1883 67.3 96.7263 66.8333 96.3903 66.236C96.0543 65.6293 95.8863 64.9293 95.8863 64.136C95.8863 63.352 96.059 62.6567 96.4043 62.05C96.7496 61.4433 97.221 60.9767 97.8183 60.65C98.4156 60.3233 99.083 60.16 99.8203 60.16C100.558 60.16 101.225 60.3233 101.822 60.65C102.42 60.9767 102.891 61.4433 103.236 62.05C103.582 62.6567 103.754 63.352 103.754 64.136C103.754 64.92 103.577 65.6153 103.222 66.222C102.868 66.8287 102.382 67.3 101.766 67.636C101.16 67.9627 100.488 68.126 99.7503 68.126ZM99.7503 66.74C100.161 66.74 100.544 66.642 100.898 66.446C101.262 66.25 101.556 65.956 101.78 65.564C102.004 65.172 102.116 64.696 102.116 64.136C102.116 63.576 102.009 63.1047 101.794 62.722C101.58 62.33 101.295 62.036 100.94 61.84C100.586 61.644 100.203 61.546 99.7923 61.546C99.3816 61.546 98.999 61.644 98.6443 61.84C98.299 62.036 98.0236 62.33 97.8183 62.722C97.613 63.1047 97.5103 63.576 97.5103 64.136C97.5103 64.9667 97.7203 65.6107 98.1403 66.068C98.5696 66.516 99.1063 66.74 99.7503 66.74ZM107.068 61.406C107.301 61.014 107.609 60.7107 107.992 60.496C108.384 60.272 108.846 60.16 109.378 60.16V61.812H108.972C108.347 61.812 107.871 61.9707 107.544 62.288C107.227 62.6053 107.068 63.156 107.068 63.94V68H105.472V60.286H107.068V61.406ZM117.929 60.286L113.197 71.626H111.545L113.113 67.874L110.075 60.286H111.853L114.023 66.166L116.277 60.286H117.929Z" fill="black"/>
<path d="M383.258 63.002C383.781 63.0953 384.224 63.3707 384.588 63.828C384.952 64.2853 385.134 64.8033 385.134 65.382C385.134 65.8767 385.003 66.3247 384.742 66.726C384.49 67.118 384.121 67.4307 383.636 67.664C383.151 67.888 382.586 68 381.942 68H378.05V58.27H381.76C382.423 58.27 382.992 58.382 383.468 58.606C383.944 58.83 384.303 59.1333 384.546 59.516C384.789 59.8893 384.91 60.3093 384.91 60.776C384.91 61.336 384.761 61.8027 384.462 62.176C384.163 62.5493 383.762 62.8247 383.258 63.002ZM379.646 62.358H381.62C382.143 62.358 382.549 62.2413 382.838 62.008C383.137 61.7653 383.286 61.42 383.286 60.972C383.286 60.5333 383.137 60.1927 382.838 59.95C382.549 59.698 382.143 59.572 381.62 59.572H379.646V62.358ZM381.802 66.698C382.343 66.698 382.768 66.5673 383.076 66.306C383.384 66.0447 383.538 65.6807 383.538 65.214C383.538 64.738 383.375 64.36 383.048 64.08C382.721 63.8 382.287 63.66 381.746 63.66H379.646V66.698H381.802ZM393.994 60.286V68H392.398V67.09C392.146 67.4073 391.815 67.6593 391.404 67.846C391.003 68.0233 390.574 68.112 390.116 68.112C389.51 68.112 388.964 67.986 388.478 67.734C388.002 67.482 387.624 67.1087 387.344 66.614C387.074 66.1193 386.938 65.522 386.938 64.822V60.286H388.52V64.584C388.52 65.2747 388.693 65.8067 389.038 66.18C389.384 66.544 389.855 66.726 390.452 66.726C391.05 66.726 391.521 66.544 391.866 66.18C392.221 65.8067 392.398 65.2747 392.398 64.584V60.286H393.994ZM395.708 64.108C395.708 63.3333 395.867 62.6473 396.184 62.05C396.511 61.4527 396.949 60.9907 397.5 60.664C398.06 60.328 398.681 60.16 399.362 60.16C399.866 60.16 400.361 60.272 400.846 60.496C401.341 60.7107 401.733 61 402.022 61.364V57.64H403.632V68H402.022V66.838C401.761 67.2113 401.397 67.5193 400.93 67.762C400.473 68.0047 399.945 68.126 399.348 68.126C398.676 68.126 398.06 67.958 397.5 67.622C396.949 67.2767 396.511 66.8007 396.184 66.194C395.867 65.578 395.708 64.8827 395.708 64.108ZM402.022 64.136C402.022 63.604 401.91 63.142 401.686 62.75C401.471 62.358 401.187 62.0593 400.832 61.854C400.477 61.6487 400.095 61.546 399.684 61.546C399.273 61.546 398.891 61.6487 398.536 61.854C398.181 62.05 397.892 62.344 397.668 62.736C397.453 63.1187 397.346 63.576 397.346 64.108C397.346 64.64 397.453 65.1067 397.668 65.508C397.892 65.9093 398.181 66.2173 398.536 66.432C398.9 66.6373 399.283 66.74 399.684 66.74C400.095 66.74 400.477 66.6373 400.832 66.432C401.187 66.2267 401.471 65.928 401.686 65.536C401.91 65.1347 402.022 64.668 402.022 64.136ZM408.976 60.16C409.574 60.16 410.101 60.2813 410.558 60.524C411.025 60.7573 411.389 61.0513 411.65 61.406V60.286H413.26V68.126C413.26 68.8353 413.111 69.4653 412.812 70.016C412.514 70.576 412.08 71.0147 411.51 71.332C410.95 71.6493 410.278 71.808 409.494 71.808C408.449 71.808 407.581 71.5607 406.89 71.066C406.2 70.5807 405.808 69.918 405.714 69.078H407.296C407.418 69.4793 407.674 69.8013 408.066 70.044C408.468 70.296 408.944 70.422 409.494 70.422C410.138 70.422 410.656 70.226 411.048 69.834C411.45 69.442 411.65 68.8727 411.65 68.126V66.838C411.38 67.202 411.011 67.51 410.544 67.762C410.087 68.0047 409.564 68.126 408.976 68.126C408.304 68.126 407.688 67.958 407.128 67.622C406.578 67.2767 406.139 66.8007 405.812 66.194C405.495 65.578 405.336 64.8827 405.336 64.108C405.336 63.3333 405.495 62.6473 405.812 62.05C406.139 61.4527 406.578 60.9907 407.128 60.664C407.688 60.328 408.304 60.16 408.976 60.16ZM411.65 64.136C411.65 63.604 411.538 63.142 411.314 62.75C411.1 62.358 410.815 62.0593 410.46 61.854C410.106 61.6487 409.723 61.546 409.312 61.546C408.902 61.546 408.519 61.6487 408.164 61.854C407.81 62.05 407.52 62.344 407.296 62.736C407.082 63.1187 406.974 63.576 406.974 64.108C406.974 64.64 407.082 65.1067 407.296 65.508C407.52 65.9093 407.81 66.2173 408.164 66.432C408.528 66.6373 408.911 66.74 409.312 66.74C409.723 66.74 410.106 66.6373 410.46 66.432C410.815 66.2267 411.1 65.928 411.314 65.536C411.538 65.1347 411.65 64.668 411.65 64.136ZM422.567 63.954C422.567 64.2433 422.548 64.5047 422.511 64.738H416.617C416.663 65.354 416.892 65.8487 417.303 66.222C417.713 66.5953 418.217 66.782 418.815 66.782C419.673 66.782 420.28 66.4227 420.635 65.704H422.357C422.123 66.4133 421.699 66.9967 421.083 67.454C420.476 67.902 419.72 68.126 418.815 68.126C418.077 68.126 417.415 67.9627 416.827 67.636C416.248 67.3 415.791 66.8333 415.455 66.236C415.128 65.6293 414.965 64.9293 414.965 64.136C414.965 63.3427 415.123 62.6473 415.441 62.05C415.767 61.4433 416.22 60.9767 416.799 60.65C417.387 60.3233 418.059 60.16 418.815 60.16C419.543 60.16 420.191 60.3187 420.761 60.636C421.33 60.9533 421.773 61.4013 422.091 61.98C422.408 62.5493 422.567 63.2073 422.567 63.954ZM420.901 63.45C420.891 62.862 420.681 62.3907 420.271 62.036C419.86 61.6813 419.351 61.504 418.745 61.504C418.194 61.504 417.723 61.6813 417.331 62.036C416.939 62.3813 416.705 62.8527 416.631 63.45H420.901ZM426.139 61.588V65.858C426.139 66.1473 426.205 66.3573 426.335 66.488C426.475 66.6093 426.709 66.67 427.035 66.67H428.015V68H426.755C426.037 68 425.486 67.832 425.103 67.496C424.721 67.16 424.529 66.614 424.529 65.858V61.588H423.619V60.286H424.529V58.368H426.139V60.286H428.015V61.588H426.139ZM436.696 63.954C436.696 64.2433 436.678 64.5047 436.64 64.738H430.746C430.793 65.354 431.022 65.8487 431.432 66.222C431.843 66.5953 432.347 66.782 432.944 66.782C433.803 66.782 434.41 66.4227 434.764 65.704H436.486C436.253 66.4133 435.828 66.9967 435.212 67.454C434.606 67.902 433.85 68.126 432.944 68.126C432.207 68.126 431.544 67.9627 430.956 67.636C430.378 67.3 429.92 66.8333 429.584 66.236C429.258 65.6293 429.094 64.9293 429.094 64.136C429.094 63.3427 429.253 62.6473 429.57 62.05C429.897 61.4433 430.35 60.9767 430.928 60.65C431.516 60.3233 432.188 60.16 432.944 60.16C433.672 60.16 434.321 60.3187 434.89 60.636C435.46 60.9533 435.903 61.4013 436.22 61.98C436.538 62.5493 436.696 63.2073 436.696 63.954ZM435.03 63.45C435.021 62.862 434.811 62.3907 434.4 62.036C433.99 61.6813 433.481 61.504 432.874 61.504C432.324 61.504 431.852 61.6813 431.46 62.036C431.068 62.3813 430.835 62.8527 430.76 63.45H435.03ZM437.875 64.108C437.875 63.3333 438.034 62.6473 438.351 62.05C438.678 61.4527 439.116 60.9907 439.667 60.664C440.227 60.328 440.848 60.16 441.529 60.16C442.033 60.16 442.528 60.272 443.013 60.496C443.508 60.7107 443.9 61 444.189 61.364V57.64H445.799V68H444.189V66.838C443.928 67.2113 443.564 67.5193 443.097 67.762C442.64 68.0047 442.112 68.126 441.515 68.126C440.843 68.126 440.227 67.958 439.667 67.622C439.116 67.2767 438.678 66.8007 438.351 66.194C438.034 65.578 437.875 64.8827 437.875 64.108ZM444.189 64.136C444.189 63.604 444.077 63.142 443.853 62.75C443.638 62.358 443.354 62.0593 442.999 61.854C442.644 61.6487 442.262 61.546 441.851 61.546C441.44 61.546 441.058 61.6487 440.703 61.854C440.348 62.05 440.059 62.344 439.835 62.736C439.62 63.1187 439.513 63.576 439.513 64.108C439.513 64.64 439.62 65.1067 439.835 65.508C440.059 65.9093 440.348 66.2173 440.703 66.432C441.067 66.6373 441.45 66.74 441.851 66.74C442.262 66.74 442.644 66.6373 442.999 66.432C443.354 66.2267 443.638 65.928 443.853 65.536C444.077 65.1347 444.189 64.668 444.189 64.136Z" fill="black"/>
<path d="M61.9432 114.148C61.5455 111.659 59.5966 110.205 57.1364 110.205C54.125 110.205 51.9034 112.46 51.9034 116.182C51.9034 119.903 54.1136 122.159 57.1364 122.159C59.6932 122.159 61.5625 120.557 61.9432 118.256L60.1705 118.25C59.8693 119.739 58.6193 120.557 57.1477 120.557C55.1534 120.557 53.6477 119.028 53.6477 116.182C53.6477 113.358 55.1477 111.807 57.1534 111.807C58.6364 111.807 59.8807 112.642 60.1705 114.148H61.9432ZM66.4474 122.193C67.8906 122.193 68.7031 121.46 69.027 120.807H69.0952V122H70.7543V116.205C70.7543 113.665 68.7543 113.159 67.3679 113.159C65.7884 113.159 64.3338 113.795 63.7656 115.386L65.3622 115.75C65.6122 115.131 66.2486 114.534 67.3906 114.534C68.4872 114.534 69.0497 115.108 69.0497 116.097V116.136C69.0497 116.756 68.4134 116.744 66.8452 116.926C65.1918 117.119 63.4986 117.551 63.4986 119.534C63.4986 121.25 64.7884 122.193 66.4474 122.193ZM66.8168 120.83C65.8565 120.83 65.1634 120.398 65.1634 119.557C65.1634 118.648 65.9702 118.324 66.9531 118.193C67.5043 118.119 68.8111 117.972 69.0554 117.727V118.852C69.0554 119.886 68.2315 120.83 66.8168 120.83ZM77.0909 113.273H75.3011V111.182H73.6023V113.273H72.3239V114.636H73.6023V119.79C73.5966 121.375 74.8068 122.142 76.1477 122.114C76.6875 122.108 77.0511 122.006 77.25 121.932L76.9432 120.528C76.8295 120.551 76.6193 120.602 76.3466 120.602C75.7955 120.602 75.3011 120.42 75.3011 119.438V114.636H77.0909V113.273ZM82.6378 122.176C84.5412 122.176 85.8878 121.239 86.2741 119.818L84.6662 119.528C84.3594 120.352 83.6207 120.773 82.6548 120.773C81.2003 120.773 80.223 119.83 80.1776 118.148H86.3821V117.545C86.3821 114.392 84.4957 113.159 82.5185 113.159C80.0866 113.159 78.4844 115.011 78.4844 117.693C78.4844 120.403 80.0639 122.176 82.6378 122.176ZM80.1832 116.875C80.2514 115.636 81.1491 114.562 82.5298 114.562C83.848 114.562 84.7116 115.54 84.7173 116.875H80.1832ZM91.9261 125.455C94.1477 125.455 95.8636 124.438 95.8636 122.193V113.273H94.1989V114.688H94.0739C93.7727 114.148 93.1705 113.159 91.5455 113.159C89.4375 113.159 87.8864 114.824 87.8864 117.602C87.8864 120.386 89.4716 121.869 91.5341 121.869C93.1364 121.869 93.7557 120.966 94.0625 120.409H94.1705V122.125C94.1705 123.494 93.233 124.085 91.9432 124.085C90.5284 124.085 89.9773 123.375 89.6761 122.875L88.2159 123.477C88.6761 124.545 89.8409 125.455 91.9261 125.455ZM91.9091 120.46C90.392 120.46 89.6023 119.295 89.6023 117.58C89.6023 115.903 90.375 114.602 91.9091 114.602C93.392 114.602 94.1875 115.812 94.1875 117.58C94.1875 119.381 93.375 120.46 91.9091 120.46ZM101.818 122.176C104.278 122.176 105.886 120.375 105.886 117.676C105.886 114.96 104.278 113.159 101.818 113.159C99.358 113.159 97.75 114.96 97.75 117.676C97.75 120.375 99.358 122.176 101.818 122.176ZM101.824 120.75C100.216 120.75 99.4659 119.347 99.4659 117.67C99.4659 116 100.216 114.58 101.824 114.58C103.42 114.58 104.17 116 104.17 117.67C104.17 119.347 103.42 120.75 101.824 120.75ZM107.783 122H109.482V116.67C109.482 115.528 110.362 114.705 111.567 114.705C111.919 114.705 112.317 114.767 112.453 114.807V113.182C112.283 113.159 111.947 113.142 111.732 113.142C110.709 113.142 109.834 113.722 109.516 114.659H109.425V113.273H107.783V122ZM115.263 125.273C116.666 125.273 117.553 124.54 118.058 123.165L121.666 113.29L119.831 113.273L117.621 120.045H117.53L115.32 113.273H113.501L116.695 122.114L116.484 122.693C116.053 123.852 115.445 123.949 114.513 123.693L114.104 125.085C114.308 125.176 114.751 125.273 115.263 125.273ZM131.893 110.364H130.183L127.28 112.261V113.943L130.064 112.125H130.132V122H131.893V110.364Z" fill="black"/>
<path d="M31.247 120.14L26.451 114.658C25.885 114.013 26.345 113 27.204 113H36.796C36.9883 113 37.1765 113.055 37.3381 113.159C37.4998 113.263 37.628 113.412 37.7075 113.587C37.7869 113.762 37.8142 113.956 37.7861 114.146C37.758 114.336 37.6757 114.514 37.549 114.659L32.753 120.139C32.6591 120.246 32.5434 120.332 32.4135 120.391C32.2836 120.45 32.1427 120.481 32 120.481C31.8574 120.481 31.7164 120.45 31.5865 120.391C31.4566 120.332 31.3409 120.246 31.247 120.139V120.14Z" fill="black"/>
<rect x="1" y="160" width="14" height="14" rx="3" stroke="#D5D5D5" stroke-width="2"/>
<rect x="1" y="205" width="14" height="14" rx="3" stroke="#D5D5D5" stroke-width="2"/>
<path d="M57.8011 254.364H58.9943C58.9396 252.827 57.5227 251.679 55.554 251.679C53.6051 251.679 52.0739 252.812 52.0739 254.523C52.0739 255.895 53.0682 256.71 54.6591 257.168L55.9119 257.526C56.9858 257.824 57.9403 258.202 57.9403 259.216C57.9403 260.33 56.8665 261.065 55.4545 261.065C54.2415 261.065 53.1676 260.528 53.0682 259.375H51.7955C51.9148 261.045 53.267 262.179 55.4545 262.179C57.8011 262.179 59.1335 260.886 59.1335 259.236C59.1335 257.327 57.3239 256.71 56.2699 256.432L55.2358 256.153C54.4801 255.955 53.267 255.557 53.267 254.463C53.267 253.489 54.1619 252.773 55.5142 252.773C56.7472 252.773 57.6818 253.359 57.8011 254.364ZM65.8141 258.878C65.8141 260.31 64.7203 260.966 63.8453 260.966C62.8709 260.966 62.1749 260.25 62.1749 259.136V254.364H61.0016V259.216C61.0016 261.165 62.0357 262.099 63.4675 262.099C64.6209 262.099 65.3766 261.483 65.7346 260.707H65.8141V262H66.9874V254.364H65.8141V258.878ZM69.2955 262H70.429V260.827H70.5682C70.8267 261.244 71.3239 262.159 72.7955 262.159C74.7045 262.159 76.0369 260.628 76.0369 258.202C76.0369 255.795 74.7045 254.264 72.7756 254.264C71.2841 254.264 70.8267 255.179 70.5682 255.577H70.4688V251.818H69.2955V262ZM70.4489 258.182C70.4489 256.472 71.2045 255.318 72.6364 255.318C74.1278 255.318 74.8636 256.571 74.8636 258.182C74.8636 259.812 74.108 261.105 72.6364 261.105C71.2244 261.105 70.4489 259.912 70.4489 258.182ZM82.2067 257.088H77.7521V258.182H82.2067V257.088ZM87.3734 262.159C89.0637 262.159 90.1774 261.125 90.3762 259.773H89.2029C88.9842 260.608 88.2882 261.105 87.3734 261.105C85.9814 261.105 85.0865 259.952 85.0865 258.182C85.0865 256.452 86.0012 255.318 87.3734 255.318C88.4075 255.318 89.024 255.955 89.2029 256.651H90.3762C90.1774 255.219 88.9643 254.264 87.3535 254.264C85.2853 254.264 83.9132 255.895 83.9132 258.222C83.9132 260.509 85.2257 262.159 87.3734 262.159ZM94.3386 262.179C95.671 262.179 96.367 261.463 96.6056 260.966H96.6653V262H97.8386V256.969C97.8386 254.543 95.9892 254.264 95.0147 254.264C93.8613 254.264 92.5488 254.662 91.9522 256.054L93.0659 256.452C93.3244 255.895 93.9359 255.298 95.0545 255.298C96.1333 255.298 96.6653 255.87 96.6653 256.849V256.889C96.6653 257.456 96.0886 257.406 94.6966 257.585C93.2797 257.769 91.7335 258.082 91.7335 259.832C91.7335 261.324 92.8869 262.179 94.3386 262.179ZM94.5176 261.125C93.5829 261.125 92.9068 260.707 92.9068 259.892C92.9068 258.997 93.7221 258.719 94.6369 258.599C95.1341 258.54 96.4664 258.401 96.6653 258.162V259.236C96.6653 260.19 95.9096 261.125 94.5176 261.125ZM103.301 254.364H101.67V252.534H100.497V254.364H99.3438V255.358H100.497V260.131C100.497 261.463 101.571 262.099 102.565 262.099C103.003 262.099 103.281 262.02 103.44 261.96L103.202 260.906C103.102 260.926 102.943 260.966 102.685 260.966C102.168 260.966 101.67 260.807 101.67 259.812V255.358H103.301V254.364ZM108.186 262.159C109.737 262.159 110.87 261.384 111.228 260.23L110.095 259.912C109.797 260.707 109.105 261.105 108.186 261.105C106.809 261.105 105.859 260.215 105.804 258.58H111.348V258.082C111.348 255.239 109.657 254.264 108.066 254.264C105.998 254.264 104.626 255.895 104.626 258.241C104.626 260.588 105.978 262.159 108.186 262.159ZM105.804 257.565C105.884 256.377 106.724 255.318 108.066 255.318C109.339 255.318 110.154 256.273 110.154 257.565H105.804ZM116.215 265.023C118.044 265.023 119.516 264.188 119.516 262.219V254.364H118.382V255.577H118.263C118.005 255.179 117.527 254.264 116.036 254.264C114.107 254.264 112.775 255.795 112.775 258.142C112.775 260.528 114.167 261.881 116.016 261.881C117.507 261.881 117.985 261.006 118.243 260.588H118.343V262.139C118.343 263.412 117.448 263.989 116.215 263.989C114.828 263.989 114.341 263.258 114.027 262.835L113.093 263.491C113.57 264.292 114.51 265.023 116.215 265.023ZM116.175 260.827C114.703 260.827 113.948 259.713 113.948 258.122C113.948 256.571 114.684 255.318 116.175 255.318C117.607 255.318 118.363 256.472 118.363 258.122C118.363 259.812 117.587 260.827 116.175 260.827ZM124.766 262.159C126.834 262.159 128.226 260.588 128.226 258.222C128.226 255.835 126.834 254.264 124.766 254.264C122.698 254.264 121.306 255.835 121.306 258.222C121.306 260.588 122.698 262.159 124.766 262.159ZM124.766 261.105C123.195 261.105 122.479 259.753 122.479 258.222C122.479 256.69 123.195 255.318 124.766 255.318C126.337 255.318 127.053 256.69 127.053 258.222C127.053 259.753 126.337 261.105 124.766 261.105ZM130.017 262H131.191V257.168C131.191 256.134 132.006 255.378 133.119 255.378C133.433 255.378 133.756 255.438 133.835 255.457V254.264C133.701 254.254 133.393 254.244 133.219 254.244C132.304 254.244 131.509 254.761 131.23 255.517H131.151V254.364H130.017V262ZM136.214 264.864C137.273 264.864 138.019 264.302 138.461 263.114L141.713 254.384L140.43 254.364L138.322 260.449H138.243L136.135 254.364H134.862L137.686 262.04L137.467 262.636C137.04 263.8 136.513 263.909 135.657 263.69L135.359 264.724C135.479 264.784 135.817 264.864 136.214 264.864ZM150.623 262.139C152.597 262.139 154.064 260.901 154.064 259.236C154.064 257.943 153.298 257.004 152.015 256.79V256.71C153.044 256.397 153.686 255.552 153.686 254.403C153.686 252.962 152.547 251.679 150.663 251.679C148.903 251.679 147.441 252.763 147.382 254.364H148.575C148.62 253.349 149.584 252.753 150.643 252.753C151.767 252.753 152.493 253.434 152.493 254.463C152.493 255.537 151.652 256.233 150.444 256.233H149.629V257.327H150.444C151.99 257.327 152.85 258.112 152.85 259.236C152.85 260.315 151.911 261.045 150.603 261.045C149.425 261.045 148.49 260.439 148.416 259.455H147.163C147.238 261.055 148.65 262.139 150.623 262.139Z" fill="black"/>
<rect x="1" y="250" width="14" height="14" rx="3" stroke="#D5D5D5" stroke-width="2"/>
<rect x="1" y="295" width="14" height="14" rx="3" stroke="#D5D5D5" stroke-width="2"/>
<rect x="331.75" y="102.75" width="138.5" height="28.5" rx="9.25" fill="white" stroke="#56CCF2" stroke-width="1.5"/>
<path d="M372.233 122H373.466V118.023H375.693C375.783 118.023 375.867 118.023 375.952 118.018L378.099 122H379.531L377.229 117.794C378.527 117.352 379.134 116.293 379.134 114.94C379.134 113.141 378.06 111.818 375.673 111.818H372.233V122ZM373.466 116.909V112.912H375.634C377.284 112.912 377.92 113.717 377.92 114.94C377.92 116.163 377.284 116.909 375.653 116.909H373.466ZM381.029 124.864H382.202V120.827H382.302C382.56 121.244 383.057 122.159 384.529 122.159C386.438 122.159 387.77 120.628 387.77 118.202C387.77 115.795 386.438 114.264 384.509 114.264C383.018 114.264 382.56 115.179 382.302 115.577H382.162V114.364H381.029V124.864ZM382.182 118.182C382.182 116.472 382.938 115.318 384.37 115.318C385.861 115.318 386.597 116.571 386.597 118.182C386.597 119.812 385.841 121.105 384.37 121.105C382.958 121.105 382.182 119.912 382.182 118.182ZM393.12 111.818H391.887L389.341 113.509V114.761L391.827 113.111H391.887V122H393.12V111.818ZM396.322 122.08C396.814 122.08 397.216 121.677 397.216 121.185C397.216 120.692 396.814 120.29 396.322 120.29C395.829 120.29 395.427 120.692 395.427 121.185C395.427 121.677 395.829 122.08 396.322 122.08ZM402.268 122.139C404.515 122.139 405.807 120.235 405.807 116.909C405.807 113.608 404.495 111.679 402.268 111.679C400.04 111.679 398.728 113.608 398.728 116.909C398.728 120.235 400.02 122.139 402.268 122.139ZM402.268 121.045C400.786 121.045 399.921 119.559 399.921 116.909C399.921 114.264 400.796 112.753 402.268 112.753C403.739 112.753 404.614 114.264 404.614 116.909C404.614 119.559 403.749 121.045 402.268 121.045ZM411.018 122.139C413.265 122.139 414.557 120.235 414.557 116.909C414.557 113.608 413.245 111.679 411.018 111.679C408.79 111.679 407.478 113.608 407.478 116.909C407.478 120.235 408.77 122.139 411.018 122.139ZM411.018 121.045C409.536 121.045 408.671 119.559 408.671 116.909C408.671 114.264 409.546 112.753 411.018 112.753C412.489 112.753 413.364 114.264 413.364 116.909C413.364 119.559 412.499 121.045 411.018 121.045ZM419.768 122.139C422.015 122.139 423.307 120.235 423.307 116.909C423.307 113.608 421.995 111.679 419.768 111.679C417.54 111.679 416.228 113.608 416.228 116.909C416.228 120.235 417.52 122.139 419.768 122.139ZM419.768 121.045C418.286 121.045 417.421 119.559 417.421 116.909C417.421 114.264 418.296 112.753 419.768 112.753C421.239 112.753 422.114 114.264 422.114 116.909C422.114 119.559 421.249 121.045 419.768 121.045ZM425.716 122.08C426.208 122.08 426.611 121.677 426.611 121.185C426.611 120.692 426.208 120.29 425.716 120.29C425.224 120.29 424.821 120.692 424.821 121.185C424.821 121.677 425.224 122.08 425.716 122.08ZM431.662 122.139C433.909 122.139 435.202 120.235 435.202 116.909C435.202 113.608 433.889 111.679 431.662 111.679C429.435 111.679 428.122 113.608 428.122 116.909C428.122 120.235 429.415 122.139 431.662 122.139ZM431.662 121.045C430.181 121.045 429.316 119.559 429.316 116.909C429.316 114.264 430.191 112.753 431.662 112.753C433.134 112.753 434.009 114.264 434.009 116.909C434.009 119.559 433.144 121.045 431.662 121.045ZM440.412 122.139C442.659 122.139 443.952 120.235 443.952 116.909C443.952 113.608 442.639 111.679 440.412 111.679C438.185 111.679 436.872 113.608 436.872 116.909C436.872 120.235 438.165 122.139 440.412 122.139ZM440.412 121.045C438.931 121.045 438.066 119.559 438.066 116.909C438.066 114.264 438.941 112.753 440.412 112.753C441.884 112.753 442.759 114.264 442.759 116.909C442.759 119.559 441.894 121.045 440.412 121.045ZM449.162 122.139C451.409 122.139 452.702 120.235 452.702 116.909C452.702 113.608 451.389 111.679 449.162 111.679C446.935 111.679 445.622 113.608 445.622 116.909C445.622 120.235 446.915 122.139 449.162 122.139ZM449.162 121.045C447.681 121.045 446.816 119.559 446.816 116.909C446.816 114.264 447.691 112.753 449.162 112.753C450.634 112.753 451.509 114.264 451.509 116.909C451.509 119.559 450.644 121.045 449.162 121.045Z" fill="black"/>
<path d="M347.438 121.375C347.438 121.458 347.405 121.537 347.346 121.596C347.287 121.654 347.208 121.687 347.125 121.687H344.938V123.875C344.938 123.958 344.905 124.037 344.846 124.096C344.787 124.154 344.708 124.187 344.625 124.187C344.542 124.187 344.463 124.154 344.404 124.096C344.345 124.037 344.312 123.958 344.312 123.875V121.687H342.125C342.042 121.687 341.963 121.654 341.904 121.596C341.845 121.537 341.812 121.458 341.812 121.375C341.812 121.292 341.845 121.213 341.904 121.154C341.963 121.095 342.042 121.062 342.125 121.062H344.312V118.875C344.312 118.792 344.345 118.713 344.404 118.654C344.463 118.595 344.542 118.562 344.625 118.562C344.708 118.562 344.787 118.595 344.846 118.654C344.905 118.713 344.938 118.792 344.938 118.875V121.062H347.125C347.208 121.062 347.287 121.095 347.346 121.154C347.405 121.213 347.438 121.292 347.438 121.375ZM347.125 112.312H342.125C342.042 112.312 341.963 112.345 341.904 112.404C341.845 112.463 341.812 112.542 341.812 112.625C341.812 112.708 341.845 112.787 341.904 112.846C341.963 112.904 342.042 112.937 342.125 112.937H347.125C347.208 112.937 347.287 112.904 347.346 112.846C347.405 112.787 347.438 112.708 347.438 112.625C347.438 112.542 347.405 112.463 347.346 112.404C347.287 112.345 347.208 112.312 347.125 112.312ZM350.875 120.443H355.875C355.958 120.443 356.037 120.41 356.096 120.351C356.155 120.292 356.188 120.213 356.188 120.13C356.188 120.047 356.155 119.968 356.096 119.909C356.037 119.85 355.958 119.818 355.875 119.818H350.875C350.792 119.818 350.713 119.85 350.654 119.909C350.595 119.968 350.562 120.047 350.562 120.13C350.562 120.213 350.595 120.292 350.654 120.351C350.713 120.41 350.792 120.443 350.875 120.443ZM355.875 122.307H350.875C350.792 122.307 350.713 122.34 350.654 122.399C350.595 122.457 350.562 122.537 350.562 122.62C350.562 122.703 350.595 122.782 350.654 122.841C350.713 122.899 350.792 122.932 350.875 122.932H355.875C355.958 122.932 356.037 122.899 356.096 122.841C356.155 122.782 356.188 122.703 356.188 122.62C356.188 122.537 356.155 122.457 356.096 122.399C356.037 122.34 355.958 122.307 355.875 122.307ZM351.279 114.721C351.308 114.75 351.342 114.773 351.38 114.789C351.418 114.804 351.459 114.812 351.5 114.812C351.541 114.812 351.582 114.804 351.62 114.789C351.658 114.773 351.692 114.75 351.721 114.721L353.375 113.067L355.029 114.721C355.088 114.78 355.167 114.812 355.25 114.812C355.333 114.812 355.412 114.78 355.471 114.721C355.53 114.662 355.563 114.583 355.563 114.5C355.563 114.417 355.53 114.337 355.471 114.279L353.817 112.625L355.471 110.971C355.53 110.912 355.563 110.833 355.563 110.75C355.563 110.667 355.53 110.587 355.471 110.529C355.412 110.47 355.333 110.437 355.25 110.437C355.167 110.437 355.088 110.47 355.029 110.529L353.375 112.183L351.721 110.529C351.662 110.47 351.583 110.437 351.5 110.437C351.417 110.437 351.338 110.47 351.279 110.529C351.22 110.587 351.187 110.667 351.187 110.75C351.187 110.833 351.22 110.912 351.279 110.971L352.933 112.625L351.279 114.279C351.25 114.308 351.227 114.342 351.211 114.38C351.195 114.418 351.187 114.459 351.187 114.5C351.187 114.541 351.195 114.582 351.211 114.62C351.227 114.657 351.25 114.692 351.279 114.721Z" fill="black"/>
<path d="M372.233 172H373.466V168.023H375.693C375.783 168.023 375.867 168.023 375.952 168.018L378.099 172H379.531L377.229 167.794C378.527 167.352 379.134 166.293 379.134 164.94C379.134 163.141 378.06 161.818 375.673 161.818H372.233V172ZM373.466 166.909V162.912H375.634C377.284 162.912 377.92 163.717 377.92 164.94C377.92 166.163 377.284 166.909 375.653 166.909H373.466ZM381.029 174.864H382.202V170.827H382.302C382.56 171.244 383.057 172.159 384.529 172.159C386.438 172.159 387.77 170.628 387.77 168.202C387.77 165.795 386.438 164.264 384.509 164.264C383.018 164.264 382.56 165.179 382.302 165.577H382.162V164.364H381.029V174.864ZM382.182 168.182C382.182 166.472 382.938 165.318 384.37 165.318C385.861 165.318 386.597 166.571 386.597 168.182C386.597 169.812 385.841 171.105 384.37 171.105C382.958 171.105 382.182 169.912 382.182 168.182ZM393.12 161.818H391.887L389.341 163.509V164.761L391.827 163.111H391.887V172H393.12V161.818ZM396.322 172.08C396.814 172.08 397.216 171.677 397.216 171.185C397.216 170.692 396.814 170.29 396.322 170.29C395.829 170.29 395.427 170.692 395.427 171.185C395.427 171.677 395.829 172.08 396.322 172.08ZM402.268 172.139C404.515 172.139 405.807 170.235 405.807 166.909C405.807 163.608 404.495 161.679 402.268 161.679C400.04 161.679 398.728 163.608 398.728 166.909C398.728 170.235 400.02 172.139 402.268 172.139ZM402.268 171.045C400.786 171.045 399.921 169.559 399.921 166.909C399.921 164.264 400.796 162.753 402.268 162.753C403.739 162.753 404.614 164.264 404.614 166.909C404.614 169.559 403.749 171.045 402.268 171.045ZM411.018 172.139C413.265 172.139 414.557 170.235 414.557 166.909C414.557 163.608 413.245 161.679 411.018 161.679C408.79 161.679 407.478 163.608 407.478 166.909C407.478 170.235 408.77 172.139 411.018 172.139ZM411.018 171.045C409.536 171.045 408.671 169.559 408.671 166.909C408.671 164.264 409.546 162.753 411.018 162.753C412.489 162.753 413.364 164.264 413.364 166.909C413.364 169.559 412.499 171.045 411.018 171.045ZM419.768 172.139C422.015 172.139 423.307 170.235 423.307 166.909C423.307 163.608 421.995 161.679 419.768 161.679C417.54 161.679 416.228 163.608 416.228 166.909C416.228 170.235 417.52 172.139 419.768 172.139ZM419.768 171.045C418.286 171.045 417.421 169.559 417.421 166.909C417.421 164.264 418.296 162.753 419.768 162.753C421.239 162.753 422.114 164.264 422.114 166.909C422.114 169.559 421.249 171.045 419.768 171.045ZM425.716 172.08C426.208 172.08 426.611 171.677 426.611 171.185C426.611 170.692 426.208 170.29 425.716 170.29C425.224 170.29 424.821 170.692 424.821 171.185C424.821 171.677 425.224 172.08 425.716 172.08ZM431.662 172.139C433.909 172.139 435.202 170.235 435.202 166.909C435.202 163.608 433.889 161.679 431.662 161.679C429.435 161.679 428.122 163.608 428.122 166.909C428.122 170.235 429.415 172.139 431.662 172.139ZM431.662 171.045C430.181 171.045 429.316 169.559 429.316 166.909C429.316 164.264 430.191 162.753 431.662 162.753C433.134 162.753 434.009 164.264 434.009 166.909C434.009 169.559 433.144 171.045 431.662 171.045ZM440.412 172.139C442.659 172.139 443.952 170.235 443.952 166.909C443.952 163.608 442.639 161.679 440.412 161.679C438.185 161.679 436.872 163.608 436.872 166.909C436.872 170.235 438.165 172.139 440.412 172.139ZM440.412 171.045C438.931 171.045 438.066 169.559 438.066 166.909C438.066 164.264 438.941 162.753 440.412 162.753C441.884 162.753 442.759 164.264 442.759 166.909C442.759 169.559 441.894 171.045 440.412 171.045ZM449.162 172.139C451.409 172.139 452.702 170.235 452.702 166.909C452.702 163.608 451.389 161.679 449.162 161.679C446.935 161.679 445.622 163.608 445.622 166.909C445.622 170.235 446.915 172.139 449.162 172.139ZM449.162 171.045C447.681 171.045 446.816 169.559 446.816 166.909C446.816 164.264 447.691 162.753 449.162 162.753C450.634 162.753 451.509 164.264 451.509 166.909C451.509 169.559 450.644 171.045 449.162 171.045Z" fill="black"/>
<path d="M372.233 217H373.466V213.023H375.693C375.783 213.023 375.867 213.023 375.952 213.018L378.099 217H379.531L377.229 212.794C378.527 212.352 379.134 211.293 379.134 209.94C379.134 208.141 378.06 206.818 375.673 206.818H372.233V217ZM373.466 211.909V207.912H375.634C377.284 207.912 377.92 208.717 377.92 209.94C377.92 211.163 377.284 211.909 375.653 211.909H373.466ZM381.029 219.864H382.202V215.827H382.302C382.56 216.244 383.057 217.159 384.529 217.159C386.438 217.159 387.77 215.628 387.77 213.202C387.77 210.795 386.438 209.264 384.509 209.264C383.018 209.264 382.56 210.179 382.302 210.577H382.162V209.364H381.029V219.864ZM382.182 213.182C382.182 211.472 382.938 210.318 384.37 210.318C385.861 210.318 386.597 211.571 386.597 213.182C386.597 214.812 385.841 216.105 384.37 216.105C382.958 216.105 382.182 214.912 382.182 213.182ZM393.12 206.818H391.887L389.341 208.509V209.761L391.827 208.111H391.887V217H393.12V206.818ZM396.322 217.08C396.814 217.08 397.216 216.677 397.216 216.185C397.216 215.692 396.814 215.29 396.322 215.29C395.829 215.29 395.427 215.692 395.427 216.185C395.427 216.677 395.829 217.08 396.322 217.08ZM402.268 217.139C404.515 217.139 405.807 215.235 405.807 211.909C405.807 208.608 404.495 206.679 402.268 206.679C400.04 206.679 398.728 208.608 398.728 211.909C398.728 215.235 400.02 217.139 402.268 217.139ZM402.268 216.045C400.786 216.045 399.921 214.559 399.921 211.909C399.921 209.264 400.796 207.753 402.268 207.753C403.739 207.753 404.614 209.264 404.614 211.909C404.614 214.559 403.749 216.045 402.268 216.045ZM411.018 217.139C413.265 217.139 414.557 215.235 414.557 211.909C414.557 208.608 413.245 206.679 411.018 206.679C408.79 206.679 407.478 208.608 407.478 211.909C407.478 215.235 408.77 217.139 411.018 217.139ZM411.018 216.045C409.536 216.045 408.671 214.559 408.671 211.909C408.671 209.264 409.546 207.753 411.018 207.753C412.489 207.753 413.364 209.264 413.364 211.909C413.364 214.559 412.499 216.045 411.018 216.045ZM419.768 217.139C422.015 217.139 423.307 215.235 423.307 211.909C423.307 208.608 421.995 206.679 419.768 206.679C417.54 206.679 416.228 208.608 416.228 211.909C416.228 215.235 417.52 217.139 419.768 217.139ZM419.768 216.045C418.286 216.045 417.421 214.559 417.421 211.909C417.421 209.264 418.296 207.753 419.768 207.753C421.239 207.753 422.114 209.264 422.114 211.909C422.114 214.559 421.249 216.045 419.768 216.045ZM425.716 217.08C426.208 217.08 426.611 216.677 426.611 216.185C426.611 215.692 426.208 215.29 425.716 215.29C425.224 215.29 424.821 215.692 424.821 216.185C424.821 216.677 425.224 217.08 425.716 217.08ZM431.662 217.139C433.909 217.139 435.202 215.235 435.202 211.909C435.202 208.608 433.889 206.679 431.662 206.679C429.435 206.679 428.122 208.608 428.122 211.909C428.122 215.235 429.415 217.139 431.662 217.139ZM431.662 216.045C430.181 216.045 429.316 214.559 429.316 211.909C429.316 209.264 430.191 207.753 431.662 207.753C433.134 207.753 434.009 209.264 434.009 211.909C434.009 214.559 433.144 216.045 431.662 216.045ZM440.412 217.139C442.659 217.139 443.952 215.235 443.952 211.909C443.952 208.608 442.639 206.679 440.412 206.679C438.185 206.679 436.872 208.608 436.872 211.909C436.872 215.235 438.165 217.139 440.412 217.139ZM440.412 216.045C438.931 216.045 438.066 214.559 438.066 211.909C438.066 209.264 438.941 207.753 440.412 207.753C441.884 207.753 442.759 209.264 442.759 211.909C442.759 214.559 441.894 216.045 440.412 216.045ZM449.162 217.139C451.409 217.139 452.702 215.235 452.702 211.909C452.702 208.608 451.389 206.679 449.162 206.679C446.935 206.679 445.622 208.608 445.622 211.909C445.622 215.235 446.915 217.139 449.162 217.139ZM449.162 216.045C447.681 216.045 446.816 214.559 446.816 211.909C446.816 209.264 447.691 207.753 449.162 207.753C450.634 207.753 451.509 209.264 451.509 211.909C451.509 214.559 450.644 216.045 449.162 216.045Z" fill="black"/>
<path d="M372.233 262H373.466V258.023H375.693C375.783 258.023 375.867 258.023 375.952 258.018L378.099 262H379.531L377.229 257.794C378.527 257.352 379.134 256.293 379.134 254.94C379.134 253.141 378.06 251.818 375.673 251.818H372.233V262ZM373.466 256.909V252.912H375.634C377.284 252.912 377.92 253.717 377.92 254.94C377.92 256.163 377.284 256.909 375.653 256.909H373.466ZM381.029 264.864H382.202V260.827H382.302C382.56 261.244 383.057 262.159 384.529 262.159C386.438 262.159 387.77 260.628 387.77 258.202C387.77 255.795 386.438 254.264 384.509 254.264C383.018 254.264 382.56 255.179 382.302 255.577H382.162V254.364H381.029V264.864ZM382.182 258.182C382.182 256.472 382.938 255.318 384.37 255.318C385.861 255.318 386.597 256.571 386.597 258.182C386.597 259.812 385.841 261.105 384.37 261.105C382.958 261.105 382.182 259.912 382.182 258.182ZM393.12 251.818H391.887L389.341 253.509V254.761L391.827 253.111H391.887V262H393.12V251.818ZM396.322 262.08C396.814 262.08 397.216 261.677 397.216 261.185C397.216 260.692 396.814 260.29 396.322 260.29C395.829 260.29 395.427 260.692 395.427 261.185C395.427 261.677 395.829 262.08 396.322 262.08ZM402.268 262.139C404.515 262.139 405.807 260.235 405.807 256.909C405.807 253.608 404.495 251.679 402.268 251.679C400.04 251.679 398.728 253.608 398.728 256.909C398.728 260.235 400.02 262.139 402.268 262.139ZM402.268 261.045C400.786 261.045 399.921 259.559 399.921 256.909C399.921 254.264 400.796 252.753 402.268 252.753C403.739 252.753 404.614 254.264 404.614 256.909C404.614 259.559 403.749 261.045 402.268 261.045ZM411.018 262.139C413.265 262.139 414.557 260.235 414.557 256.909C414.557 253.608 413.245 251.679 411.018 251.679C408.79 251.679 407.478 253.608 407.478 256.909C407.478 260.235 408.77 262.139 411.018 262.139ZM411.018 261.045C409.536 261.045 408.671 259.559 408.671 256.909C408.671 254.264 409.546 252.753 411.018 252.753C412.489 252.753 413.364 254.264 413.364 256.909C413.364 259.559 412.499 261.045 411.018 261.045ZM419.768 262.139C422.015 262.139 423.307 260.235 423.307 256.909C423.307 253.608 421.995 251.679 419.768 251.679C417.54 251.679 416.228 253.608 416.228 256.909C416.228 260.235 417.52 262.139 419.768 262.139ZM419.768 261.045C418.286 261.045 417.421 259.559 417.421 256.909C417.421 254.264 418.296 252.753 419.768 252.753C421.239 252.753 422.114 254.264 422.114 256.909C422.114 259.559 421.249 261.045 419.768 261.045ZM425.716 262.08C426.208 262.08 426.611 261.677 426.611 261.185C426.611 260.692 426.208 260.29 425.716 260.29C425.224 260.29 424.821 260.692 424.821 261.185C424.821 261.677 425.224 262.08 425.716 262.08ZM431.662 262.139C433.909 262.139 435.202 260.235 435.202 256.909C435.202 253.608 433.889 251.679 431.662 251.679C429.435 251.679 428.122 253.608 428.122 256.909C428.122 260.235 429.415 262.139 431.662 262.139ZM431.662 261.045C430.181 261.045 429.316 259.559 429.316 256.909C429.316 254.264 430.191 252.753 431.662 252.753C433.134 252.753 434.009 254.264 434.009 256.909C434.009 259.559 433.144 261.045 431.662 261.045ZM440.412 262.139C442.659 262.139 443.952 260.235 443.952 256.909C443.952 253.608 442.639 251.679 440.412 251.679C438.185 251.679 436.872 253.608 436.872 256.909C436.872 260.235 438.165 262.139 440.412 262.139ZM440.412 261.045C438.931 261.045 438.066 259.559 438.066 256.909C438.066 254.264 438.941 252.753 440.412 252.753C441.884 252.753 442.759 254.264 442.759 256.909C442.759 259.559 441.894 261.045 440.412 261.045ZM449.162 262.139C451.409 262.139 452.702 260.235 452.702 256.909C452.702 253.608 451.389 251.679 449.162 251.679C446.935 251.679 445.622 253.608 445.622 256.909C445.622 260.235 446.915 262.139 449.162 262.139ZM449.162 261.045C447.681 261.045 446.816 259.559 446.816 256.909C446.816 254.264 447.691 252.753 449.162 252.753C450.634 252.753 451.509 254.264 451.509 256.909C451.509 259.559 450.644 261.045 449.162 261.045Z" fill="black"/>
<rect y="109" width="16" height="16" rx="4" fill="#2F80ED"/>
<path d="M13.1003 112.279C12.8657 112.078 12.5611 111.979 12.2535 112.004C11.9458 112.028 11.6604 112.173 11.4598 112.407L6.44981 118.267L3.75456 116.017C3.64786 115.925 3.52398 115.855 3.39012 115.812C3.25626 115.768 3.1151 115.752 2.97483 115.763C2.83456 115.775 2.69798 115.814 2.57304 115.879C2.4481 115.944 2.33729 116.033 2.24704 116.141C2.1568 116.249 2.08892 116.374 2.04736 116.508C2.0058 116.643 1.99138 116.784 2.00494 116.924C2.01851 117.064 2.05978 117.2 2.12637 117.324C2.19295 117.448 2.28352 117.558 2.39281 117.646L6.00381 120.661C6.11516 120.754 6.24443 120.823 6.38357 120.864C6.52271 120.905 6.66874 120.916 6.81256 120.898C6.96509 120.886 7.1138 120.844 7.25017 120.775C7.38654 120.706 7.50791 120.61 7.60731 120.494L13.2281 113.919C13.4282 113.684 13.5271 113.38 13.503 113.072C13.4788 112.764 13.3337 112.479 13.0993 112.278" fill="#F4F4F4"/>
<path d="M57.8011 170.364H58.9943C58.9396 168.827 57.5227 167.679 55.554 167.679C53.6051 167.679 52.0739 168.812 52.0739 170.523C52.0739 171.895 53.0682 172.71 54.6591 173.168L55.9119 173.526C56.9858 173.824 57.9403 174.202 57.9403 175.216C57.9403 176.33 56.8665 177.065 55.4545 177.065C54.2415 177.065 53.1676 176.528 53.0682 175.375H51.7955C51.9148 177.045 53.267 178.179 55.4545 178.179C57.8011 178.179 59.1335 176.886 59.1335 175.236C59.1335 173.327 57.3239 172.71 56.2699 172.432L55.2358 172.153C54.4801 171.955 53.267 171.557 53.267 170.463C53.267 169.489 54.1619 168.773 55.5142 168.773C56.7472 168.773 57.6818 169.359 57.8011 170.364ZM65.8141 174.878C65.8141 176.31 64.7203 176.966 63.8453 176.966C62.8709 176.966 62.1749 176.25 62.1749 175.136V170.364H61.0016V175.216C61.0016 177.165 62.0357 178.099 63.4675 178.099C64.6209 178.099 65.3766 177.483 65.7346 176.707H65.8141V178H66.9874V170.364H65.8141V174.878ZM69.2955 178H70.429V176.827H70.5682C70.8267 177.244 71.3239 178.159 72.7955 178.159C74.7045 178.159 76.0369 176.628 76.0369 174.202C76.0369 171.795 74.7045 170.264 72.7756 170.264C71.2841 170.264 70.8267 171.179 70.5682 171.577H70.4688V167.818H69.2955V178ZM70.4489 174.182C70.4489 172.472 71.2045 171.318 72.6364 171.318C74.1278 171.318 74.8636 172.571 74.8636 174.182C74.8636 175.812 74.108 177.105 72.6364 177.105C71.2244 177.105 70.4489 175.912 70.4489 174.182ZM82.2067 173.088H77.7521V174.182H82.2067V173.088ZM87.3734 178.159C89.0637 178.159 90.1774 177.125 90.3762 175.773H89.2029C88.9842 176.608 88.2882 177.105 87.3734 177.105C85.9814 177.105 85.0865 175.952 85.0865 174.182C85.0865 172.452 86.0012 171.318 87.3734 171.318C88.4075 171.318 89.024 171.955 89.2029 172.651H90.3762C90.1774 171.219 88.9643 170.264 87.3535 170.264C85.2853 170.264 83.9132 171.895 83.9132 174.222C83.9132 176.509 85.2257 178.159 87.3734 178.159ZM94.3386 178.179C95.671 178.179 96.367 177.463 96.6056 176.966H96.6653V178H97.8386V172.969C97.8386 170.543 95.9892 170.264 95.0147 170.264C93.8613 170.264 92.5488 170.662 91.9522 172.054L93.0659 172.452C93.3244 171.895 93.9359 171.298 95.0545 171.298C96.1333 171.298 96.6653 171.87 96.6653 172.849V172.889C96.6653 173.456 96.0886 173.406 94.6966 173.585C93.2797 173.769 91.7335 174.082 91.7335 175.832C91.7335 177.324 92.8869 178.179 94.3386 178.179ZM94.5176 177.125C93.5829 177.125 92.9068 176.707 92.9068 175.892C92.9068 174.997 93.7221 174.719 94.6369 174.599C95.1341 174.54 96.4664 174.401 96.6653 174.162V175.236C96.6653 176.19 95.9096 177.125 94.5176 177.125ZM103.301 170.364H101.67V168.534H100.497V170.364H99.3438V171.358H100.497V176.131C100.497 177.463 101.571 178.099 102.565 178.099C103.003 178.099 103.281 178.02 103.44 177.96L103.202 176.906C103.102 176.926 102.943 176.966 102.685 176.966C102.168 176.966 101.67 176.807 101.67 175.812V171.358H103.301V170.364ZM108.186 178.159C109.737 178.159 110.87 177.384 111.228 176.23L110.095 175.912C109.797 176.707 109.105 177.105 108.186 177.105C106.809 177.105 105.859 176.215 105.804 174.58H111.348V174.082C111.348 171.239 109.657 170.264 108.066 170.264C105.998 170.264 104.626 171.895 104.626 174.241C104.626 176.588 105.978 178.159 108.186 178.159ZM105.804 173.565C105.884 172.377 106.724 171.318 108.066 171.318C109.339 171.318 110.154 172.273 110.154 173.565H105.804ZM116.215 181.023C118.044 181.023 119.516 180.188 119.516 178.219V170.364H118.382V171.577H118.263C118.005 171.179 117.527 170.264 116.036 170.264C114.107 170.264 112.775 171.795 112.775 174.142C112.775 176.528 114.167 177.881 116.016 177.881C117.507 177.881 117.985 177.006 118.243 176.588H118.343V178.139C118.343 179.412 117.448 179.989 116.215 179.989C114.828 179.989 114.341 179.258 114.027 178.835L113.093 179.491C113.57 180.292 114.51 181.023 116.215 181.023ZM116.175 176.827C114.703 176.827 113.948 175.713 113.948 174.122C113.948 172.571 114.684 171.318 116.175 171.318C117.607 171.318 118.363 172.472 118.363 174.122C118.363 175.812 117.587 176.827 116.175 176.827ZM124.766 178.159C126.834 178.159 128.226 176.588 128.226 174.222C128.226 171.835 126.834 170.264 124.766 170.264C122.698 170.264 121.306 171.835 121.306 174.222C121.306 176.588 122.698 178.159 124.766 178.159ZM124.766 177.105C123.195 177.105 122.479 175.753 122.479 174.222C122.479 172.69 123.195 171.318 124.766 171.318C126.337 171.318 127.053 172.69 127.053 174.222C127.053 175.753 126.337 177.105 124.766 177.105ZM130.017 178H131.191V173.168C131.191 172.134 132.006 171.378 133.119 171.378C133.433 171.378 133.756 171.438 133.835 171.457V170.264C133.701 170.254 133.393 170.244 133.219 170.244C132.304 170.244 131.509 170.761 131.23 171.517H131.151V170.364H130.017V178ZM136.214 180.864C137.273 180.864 138.019 180.302 138.461 179.114L141.713 170.384L140.43 170.364L138.322 176.449H138.243L136.135 170.364H134.862L137.686 178.04L137.467 178.636C137.04 179.8 136.513 179.909 135.657 179.69L135.359 180.724C135.479 180.784 135.817 180.864 136.214 180.864ZM150.762 167.818H149.529L146.984 169.509V170.761L149.47 169.111H149.529V178H150.762V167.818Z" fill="black"/>
<path d="M57.8011 215.364H58.9943C58.9396 213.827 57.5227 212.679 55.554 212.679C53.6051 212.679 52.0739 213.812 52.0739 215.523C52.0739 216.895 53.0682 217.71 54.6591 218.168L55.9119 218.526C56.9858 218.824 57.9403 219.202 57.9403 220.216C57.9403 221.33 56.8665 222.065 55.4545 222.065C54.2415 222.065 53.1676 221.528 53.0682 220.375H51.7955C51.9148 222.045 53.267 223.179 55.4545 223.179C57.8011 223.179 59.1335 221.886 59.1335 220.236C59.1335 218.327 57.3239 217.71 56.2699 217.432L55.2358 217.153C54.4801 216.955 53.267 216.557 53.267 215.463C53.267 214.489 54.1619 213.773 55.5142 213.773C56.7472 213.773 57.6818 214.359 57.8011 215.364ZM65.8141 219.878C65.8141 221.31 64.7203 221.966 63.8453 221.966C62.8709 221.966 62.1749 221.25 62.1749 220.136V215.364H61.0016V220.216C61.0016 222.165 62.0357 223.099 63.4675 223.099C64.6209 223.099 65.3766 222.483 65.7346 221.707H65.8141V223H66.9874V215.364H65.8141V219.878ZM69.2955 223H70.429V221.827H70.5682C70.8267 222.244 71.3239 223.159 72.7955 223.159C74.7045 223.159 76.0369 221.628 76.0369 219.202C76.0369 216.795 74.7045 215.264 72.7756 215.264C71.2841 215.264 70.8267 216.179 70.5682 216.577H70.4688V212.818H69.2955V223ZM70.4489 219.182C70.4489 217.472 71.2045 216.318 72.6364 216.318C74.1278 216.318 74.8636 217.571 74.8636 219.182C74.8636 220.812 74.108 222.105 72.6364 222.105C71.2244 222.105 70.4489 220.912 70.4489 219.182ZM82.2067 218.088H77.7521V219.182H82.2067V218.088ZM87.3734 223.159C89.0637 223.159 90.1774 222.125 90.3762 220.773H89.2029C88.9842 221.608 88.2882 222.105 87.3734 222.105C85.9814 222.105 85.0865 220.952 85.0865 219.182C85.0865 217.452 86.0012 216.318 87.3734 216.318C88.4075 216.318 89.024 216.955 89.2029 217.651H90.3762C90.1774 216.219 88.9643 215.264 87.3535 215.264C85.2853 215.264 83.9132 216.895 83.9132 219.222C83.9132 221.509 85.2257 223.159 87.3734 223.159ZM94.3386 223.179C95.671 223.179 96.367 222.463 96.6056 221.966H96.6653V223H97.8386V217.969C97.8386 215.543 95.9892 215.264 95.0147 215.264C93.8613 215.264 92.5488 215.662 91.9522 217.054L93.0659 217.452C93.3244 216.895 93.9359 216.298 95.0545 216.298C96.1333 216.298 96.6653 216.87 96.6653 217.849V217.889C96.6653 218.456 96.0886 218.406 94.6966 218.585C93.2797 218.769 91.7335 219.082 91.7335 220.832C91.7335 222.324 92.8869 223.179 94.3386 223.179ZM94.5176 222.125C93.5829 222.125 92.9068 221.707 92.9068 220.892C92.9068 219.997 93.7221 219.719 94.6369 219.599C95.1341 219.54 96.4664 219.401 96.6653 219.162V220.236C96.6653 221.19 95.9096 222.125 94.5176 222.125ZM103.301 215.364H101.67V213.534H100.497V215.364H99.3438V216.358H100.497V221.131C100.497 222.463 101.571 223.099 102.565 223.099C103.003 223.099 103.281 223.02 103.44 222.96L103.202 221.906C103.102 221.926 102.943 221.966 102.685 221.966C102.168 221.966 101.67 221.807 101.67 220.812V216.358H103.301V215.364ZM108.186 223.159C109.737 223.159 110.87 222.384 111.228 221.23L110.095 220.912C109.797 221.707 109.105 222.105 108.186 222.105C106.809 222.105 105.859 221.215 105.804 219.58H111.348V219.082C111.348 216.239 109.657 215.264 108.066 215.264C105.998 215.264 104.626 216.895 104.626 219.241C104.626 221.588 105.978 223.159 108.186 223.159ZM105.804 218.565C105.884 217.377 106.724 216.318 108.066 216.318C109.339 216.318 110.154 217.273 110.154 218.565H105.804ZM116.215 226.023C118.044 226.023 119.516 225.188 119.516 223.219V215.364H118.382V216.577H118.263C118.005 216.179 117.527 215.264 116.036 215.264C114.107 215.264 112.775 216.795 112.775 219.142C112.775 221.528 114.167 222.881 116.016 222.881C117.507 222.881 117.985 222.006 118.243 221.588H118.343V223.139C118.343 224.412 117.448 224.989 116.215 224.989C114.828 224.989 114.341 224.258 114.027 223.835L113.093 224.491C113.57 225.292 114.51 226.023 116.215 226.023ZM116.175 221.827C114.703 221.827 113.948 220.713 113.948 219.122C113.948 217.571 114.684 216.318 116.175 216.318C117.607 216.318 118.363 217.472 118.363 219.122C118.363 220.812 117.587 221.827 116.175 221.827ZM124.766 223.159C126.834 223.159 128.226 221.588 128.226 219.222C128.226 216.835 126.834 215.264 124.766 215.264C122.698 215.264 121.306 216.835 121.306 219.222C121.306 221.588 122.698 223.159 124.766 223.159ZM124.766 222.105C123.195 222.105 122.479 220.753 122.479 219.222C122.479 217.69 123.195 216.318 124.766 216.318C126.337 216.318 127.053 217.69 127.053 219.222C127.053 220.753 126.337 222.105 124.766 222.105ZM130.017 223H131.191V218.168C131.191 217.134 132.006 216.378 133.119 216.378C133.433 216.378 133.756 216.438 133.835 216.457V215.264C133.701 215.254 133.393 215.244 133.219 215.244C132.304 215.244 131.509 215.761 131.23 216.517H131.151V215.364H130.017V223ZM136.214 225.864C137.273 225.864 138.019 225.302 138.461 224.114L141.713 215.384L140.43 215.364L138.322 221.449H138.243L136.135 215.364H134.862L137.686 223.04L137.467 223.636C137.04 224.8 136.513 224.909 135.657 224.69L135.359 225.724C135.479 225.784 135.817 225.864 136.214 225.864ZM147.183 223H153.606V221.906H148.873V221.827L151.16 219.381C152.91 217.506 153.427 216.631 153.427 215.503C153.427 213.932 152.154 212.679 150.365 212.679C148.58 212.679 147.223 213.892 147.223 215.682H148.396C148.396 214.523 149.147 213.753 150.325 213.753C151.429 213.753 152.274 214.429 152.274 215.503C152.274 216.442 151.722 217.138 150.544 218.426L147.183 222.105V223Z" fill="black"/>
<path opacity="0.89" d="M61.518 171.114C61.518 170.162 61.7373 169.308 62.176 168.552C62.624 167.796 63.226 167.208 63.982 166.788C64.7473 166.359 65.5827 166.144 66.488 166.144C67.524 166.144 68.4433 166.401 69.246 166.914C70.058 167.418 70.646 168.137 71.01 169.07H69.092C68.84 168.557 68.49 168.174 68.042 167.922C67.594 167.67 67.076 167.544 66.488 167.544C65.844 167.544 65.27 167.689 64.766 167.978C64.262 168.267 63.8653 168.683 63.576 169.224C63.296 169.765 63.156 170.395 63.156 171.114C63.156 171.833 63.296 172.463 63.576 173.004C63.8653 173.545 64.262 173.965 64.766 174.264C65.27 174.553 65.844 174.698 66.488 174.698C67.076 174.698 67.594 174.572 68.042 174.32C68.49 174.068 68.84 173.685 69.092 173.172H71.01C70.646 174.105 70.058 174.824 69.246 175.328C68.4433 175.832 67.524 176.084 66.488 176.084C65.5733 176.084 64.738 175.874 63.982 175.454C63.226 175.025 62.624 174.432 62.176 173.676C61.7373 172.92 61.518 172.066 61.518 171.114ZM72.4861 172.108C72.4861 171.333 72.6448 170.647 72.9621 170.05C73.2888 169.453 73.7275 168.991 74.2781 168.664C74.8381 168.328 75.4541 168.16 76.1261 168.16C76.7328 168.16 77.2601 168.281 77.7081 168.524C78.1655 168.757 78.5295 169.051 78.8001 169.406V168.286H80.4101V176H78.8001V174.852C78.5295 175.216 78.1608 175.519 77.6941 175.762C77.2275 176.005 76.6955 176.126 76.0981 176.126C75.4355 176.126 74.8288 175.958 74.2781 175.622C73.7275 175.277 73.2888 174.801 72.9621 174.194C72.6448 173.578 72.4861 172.883 72.4861 172.108ZM78.8001 172.136C78.8001 171.604 78.6881 171.142 78.4641 170.75C78.2495 170.358 77.9648 170.059 77.6101 169.854C77.2555 169.649 76.8728 169.546 76.4621 169.546C76.0515 169.546 75.6688 169.649 75.3141 169.854C74.9595 170.05 74.6701 170.344 74.4461 170.736C74.2315 171.119 74.1241 171.576 74.1241 172.108C74.1241 172.64 74.2315 173.107 74.4461 173.508C74.6701 173.909 74.9595 174.217 75.3141 174.432C75.6781 174.637 76.0608 174.74 76.4621 174.74C76.8728 174.74 77.2555 174.637 77.6101 174.432C77.9648 174.227 78.2495 173.928 78.4641 173.536C78.6881 173.135 78.8001 172.668 78.8001 172.136ZM84.5084 169.588V173.858C84.5084 174.147 84.5737 174.357 84.7044 174.488C84.8444 174.609 85.0777 174.67 85.4044 174.67H86.3844V176H85.1244C84.4057 176 83.8551 175.832 83.4724 175.496C83.0897 175.16 82.8984 174.614 82.8984 173.858V169.588H81.9884V168.286H82.8984V166.368H84.5084V168.286H86.3844V169.588H84.5084ZM95.0654 171.954C95.0654 172.243 95.0467 172.505 95.0094 172.738H89.1154C89.1621 173.354 89.3907 173.849 89.8014 174.222C90.2121 174.595 90.7161 174.782 91.3134 174.782C92.1721 174.782 92.7787 174.423 93.1334 173.704H94.8554C94.6221 174.413 94.1974 174.997 93.5814 175.454C92.9747 175.902 92.2187 176.126 91.3134 176.126C90.5761 176.126 89.9134 175.963 89.3254 175.636C88.7467 175.3 88.2894 174.833 87.9534 174.236C87.6267 173.629 87.4634 172.929 87.4634 172.136C87.4634 171.343 87.6221 170.647 87.9394 170.05C88.2661 169.443 88.7187 168.977 89.2974 168.65C89.8854 168.323 90.5574 168.16 91.3134 168.16C92.0414 168.16 92.6901 168.319 93.2594 168.636C93.8287 168.953 94.2721 169.401 94.5894 169.98C94.9067 170.549 95.0654 171.207 95.0654 171.954ZM93.3994 171.45C93.3901 170.862 93.1801 170.391 92.7694 170.036C92.3587 169.681 91.8501 169.504 91.2434 169.504C90.6927 169.504 90.2214 169.681 89.8294 170.036C89.4374 170.381 89.2041 170.853 89.1294 171.45H93.3994ZM99.884 168.16C100.481 168.16 101.009 168.281 101.466 168.524C101.933 168.757 102.297 169.051 102.558 169.406V168.286H104.168V176.126C104.168 176.835 104.019 177.465 103.72 178.016C103.421 178.576 102.987 179.015 102.418 179.332C101.858 179.649 101.186 179.808 100.402 179.808C99.3567 179.808 98.4887 179.561 97.798 179.066C97.1074 178.581 96.7154 177.918 96.622 177.078H98.204C98.3254 177.479 98.582 177.801 98.974 178.044C99.3754 178.296 99.8514 178.422 100.402 178.422C101.046 178.422 101.564 178.226 101.956 177.834C102.357 177.442 102.558 176.873 102.558 176.126V174.838C102.287 175.202 101.919 175.51 101.452 175.762C100.995 176.005 100.472 176.126 99.884 176.126C99.212 176.126 98.596 175.958 98.036 175.622C97.4854 175.277 97.0467 174.801 96.72 174.194C96.4027 173.578 96.244 172.883 96.244 172.108C96.244 171.333 96.4027 170.647 96.72 170.05C97.0467 169.453 97.4854 168.991 98.036 168.664C98.596 168.328 99.212 168.16 99.884 168.16ZM102.558 172.136C102.558 171.604 102.446 171.142 102.222 170.75C102.007 170.358 101.723 170.059 101.368 169.854C101.013 169.649 100.631 169.546 100.22 169.546C99.8094 169.546 99.4267 169.649 99.072 169.854C98.7174 170.05 98.428 170.344 98.204 170.736C97.9894 171.119 97.882 171.576 97.882 172.108C97.882 172.64 97.9894 173.107 98.204 173.508C98.428 173.909 98.7174 174.217 99.072 174.432C99.436 174.637 99.8187 174.74 100.22 174.74C100.631 174.74 101.013 174.637 101.368 174.432C101.723 174.227 102.007 173.928 102.222 173.536C102.446 173.135 102.558 172.668 102.558 172.136ZM109.75 176.126C109.022 176.126 108.364 175.963 107.776 175.636C107.188 175.3 106.726 174.833 106.39 174.236C106.054 173.629 105.886 172.929 105.886 172.136C105.886 171.352 106.059 170.657 106.404 170.05C106.75 169.443 107.221 168.977 107.818 168.65C108.416 168.323 109.083 168.16 109.82 168.16C110.558 168.16 111.225 168.323 111.822 168.65C112.42 168.977 112.891 169.443 113.236 170.05C113.582 170.657 113.754 171.352 113.754 172.136C113.754 172.92 113.577 173.615 113.222 174.222C112.868 174.829 112.382 175.3 111.766 175.636C111.16 175.963 110.488 176.126 109.75 176.126ZM109.75 174.74C110.161 174.74 110.544 174.642 110.898 174.446C111.262 174.25 111.556 173.956 111.78 173.564C112.004 173.172 112.116 172.696 112.116 172.136C112.116 171.576 112.009 171.105 111.794 170.722C111.58 170.33 111.295 170.036 110.94 169.84C110.586 169.644 110.203 169.546 109.792 169.546C109.382 169.546 108.999 169.644 108.644 169.84C108.299 170.036 108.024 170.33 107.818 170.722C107.613 171.105 107.51 171.576 107.51 172.136C107.51 172.967 107.72 173.611 108.14 174.068C108.57 174.516 109.106 174.74 109.75 174.74ZM117.068 169.406C117.301 169.014 117.609 168.711 117.992 168.496C118.384 168.272 118.846 168.16 119.378 168.16V169.812H118.972C118.347 169.812 117.871 169.971 117.544 170.288C117.227 170.605 117.068 171.156 117.068 171.94V176H115.472V168.286H117.068V169.406ZM127.929 168.286L123.197 179.626H121.545L123.113 175.874L120.075 168.286H121.853L124.023 174.166L126.277 168.286H127.929Z" fill="black"/>
<path d="M71.9432 222.148C71.5455 219.659 69.5966 218.205 67.1364 218.205C64.125 218.205 61.9034 220.46 61.9034 224.182C61.9034 227.903 64.1136 230.159 67.1364 230.159C69.6932 230.159 71.5625 228.557 71.9432 226.256L70.1705 226.25C69.8693 227.739 68.6193 228.557 67.1477 228.557C65.1534 228.557 63.6477 227.028 63.6477 224.182C63.6477 221.358 65.1477 219.807 67.1534 219.807C68.6364 219.807 69.8807 220.642 70.1705 222.148H71.9432ZM76.4474 230.193C77.8906 230.193 78.7031 229.46 79.027 228.807H79.0952V230H80.7543V224.205C80.7543 221.665 78.7543 221.159 77.3679 221.159C75.7884 221.159 74.3338 221.795 73.7656 223.386L75.3622 223.75C75.6122 223.131 76.2486 222.534 77.3906 222.534C78.4872 222.534 79.0497 223.108 79.0497 224.097V224.136C79.0497 224.756 78.4134 224.744 76.8452 224.926C75.1918 225.119 73.4986 225.551 73.4986 227.534C73.4986 229.25 74.7884 230.193 76.4474 230.193ZM76.8168 228.83C75.8565 228.83 75.1634 228.398 75.1634 227.557C75.1634 226.648 75.9702 226.324 76.9531 226.193C77.5043 226.119 78.8111 225.972 79.0554 225.727V226.852C79.0554 227.886 78.2315 228.83 76.8168 228.83ZM87.0909 221.273H85.3011V219.182H83.6023V221.273H82.3239V222.636H83.6023V227.79C83.5966 229.375 84.8068 230.142 86.1477 230.114C86.6875 230.108 87.0511 230.006 87.25 229.932L86.9432 228.528C86.8295 228.551 86.6193 228.602 86.3466 228.602C85.7955 228.602 85.3011 228.42 85.3011 227.438V222.636H87.0909V221.273ZM92.6378 230.176C94.5412 230.176 95.8878 229.239 96.2741 227.818L94.6662 227.528C94.3594 228.352 93.6207 228.773 92.6548 228.773C91.2003 228.773 90.223 227.83 90.1776 226.148H96.3821V225.545C96.3821 222.392 94.4957 221.159 92.5185 221.159C90.0866 221.159 88.4844 223.011 88.4844 225.693C88.4844 228.403 90.0639 230.176 92.6378 230.176ZM90.1832 224.875C90.2514 223.636 91.1491 222.562 92.5298 222.562C93.848 222.562 94.7116 223.54 94.7173 224.875H90.1832ZM101.926 233.455C104.148 233.455 105.864 232.438 105.864 230.193V221.273H104.199V222.688H104.074C103.773 222.148 103.17 221.159 101.545 221.159C99.4375 221.159 97.8864 222.824 97.8864 225.602C97.8864 228.386 99.4716 229.869 101.534 229.869C103.136 229.869 103.756 228.966 104.062 228.409H104.17V230.125C104.17 231.494 103.233 232.085 101.943 232.085C100.528 232.085 99.9773 231.375 99.6761 230.875L98.2159 231.477C98.6761 232.545 99.8409 233.455 101.926 233.455ZM101.909 228.46C100.392 228.46 99.6023 227.295 99.6023 225.58C99.6023 223.903 100.375 222.602 101.909 222.602C103.392 222.602 104.188 223.812 104.188 225.58C104.188 227.381 103.375 228.46 101.909 228.46ZM111.818 230.176C114.278 230.176 115.886 228.375 115.886 225.676C115.886 222.96 114.278 221.159 111.818 221.159C109.358 221.159 107.75 222.96 107.75 225.676C107.75 228.375 109.358 230.176 111.818 230.176ZM111.824 228.75C110.216 228.75 109.466 227.347 109.466 225.67C109.466 224 110.216 222.58 111.824 222.58C113.42 222.58 114.17 224 114.17 225.67C114.17 227.347 113.42 228.75 111.824 228.75ZM117.783 230H119.482V224.67C119.482 223.528 120.362 222.705 121.567 222.705C121.919 222.705 122.317 222.767 122.453 222.807V221.182C122.283 221.159 121.947 221.142 121.732 221.142C120.709 221.142 119.834 221.722 119.516 222.659H119.425V221.273H117.783V230ZM125.263 233.273C126.666 233.273 127.553 232.54 128.058 231.165L131.666 221.29L129.831 221.273L127.621 228.045H127.53L125.32 221.273H123.501L126.695 230.114L126.484 230.693C126.053 231.852 125.445 231.949 124.513 231.693L124.104 233.085C124.308 233.176 124.751 233.273 125.263 233.273ZM141.893 218.364H140.183L137.28 220.261V221.943L140.064 220.125H140.132V230H141.893V218.364Z" fill="black"/>
<g filter="url(#filter0_d)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M104.187 143.079L93.6388 134L83.0911 143.079H49C40.7157 143.079 34 149.795 34 158.079V234C34 242.284 40.7157 249 49 249H323C331.284 249 338 242.284 338 234V158.079C338 149.795 331.284 143.079 323 143.079H104.187Z" fill="white"/>
</g>
<path d="M122.207 221.111C121.909 219.244 120.447 218.153 118.602 218.153C116.344 218.153 114.678 219.845 114.678 222.636C114.678 225.428 116.335 227.119 118.602 227.119C120.52 227.119 121.922 225.918 122.207 224.192L120.878 224.188C120.652 225.304 119.714 225.918 118.611 225.918C117.115 225.918 115.986 224.771 115.986 222.636C115.986 220.518 117.111 219.355 118.615 219.355C119.727 219.355 120.661 219.982 120.878 221.111H122.207ZM125.586 227.145C126.668 227.145 127.277 226.595 127.52 226.105H127.571V227H128.816V222.653C128.816 220.749 127.316 220.369 126.276 220.369C125.091 220.369 124 220.847 123.574 222.04L124.772 222.312C124.959 221.848 125.436 221.401 126.293 221.401C127.115 221.401 127.537 221.831 127.537 222.572V222.602C127.537 223.067 127.06 223.058 125.884 223.195C124.644 223.339 123.374 223.663 123.374 225.151C123.374 226.438 124.341 227.145 125.586 227.145ZM125.863 226.122C125.142 226.122 124.623 225.798 124.623 225.168C124.623 224.486 125.228 224.243 125.965 224.145C126.378 224.089 127.358 223.979 127.542 223.795V224.639C127.542 225.415 126.924 226.122 125.863 226.122ZM131.787 223.114C131.787 222.07 132.426 221.473 133.312 221.473C134.178 221.473 134.702 222.04 134.702 222.99V227H135.976V222.837C135.976 221.217 135.085 220.369 133.747 220.369C132.763 220.369 132.119 220.825 131.817 221.52H131.736V220.455H130.513V227H131.787V223.114ZM140.442 227.132C141.989 227.132 142.99 226.203 143.131 224.929H141.891C141.729 225.636 141.179 226.054 140.45 226.054C139.372 226.054 138.678 225.155 138.678 223.727C138.678 222.325 139.385 221.443 140.45 221.443C141.26 221.443 141.754 221.955 141.891 222.568H143.131C142.994 221.247 141.916 220.369 140.429 220.369C138.584 220.369 137.391 221.759 137.391 223.757C137.391 225.73 138.541 227.132 140.442 227.132ZM147.314 227.132C148.742 227.132 149.752 226.429 150.042 225.364L148.836 225.146C148.605 225.764 148.051 226.08 147.327 226.08C146.236 226.08 145.503 225.372 145.469 224.111H150.123V223.659C150.123 221.294 148.708 220.369 147.225 220.369C145.401 220.369 144.199 221.759 144.199 223.77C144.199 225.803 145.384 227.132 147.314 227.132ZM145.473 223.156C145.525 222.227 146.198 221.422 147.233 221.422C148.222 221.422 148.87 222.155 148.874 223.156H145.473ZM152.81 218.273H151.536V227H152.81V218.273Z" fill="black"/>
<rect x="50.75" y="163.75" width="270.5" height="34.5" rx="7.25" fill="white" stroke="#56CCF2" stroke-width="1.5"/>
<path d="M74.9432 179.148C74.5455 176.659 72.5966 175.205 70.1364 175.205C67.125 175.205 64.9034 177.46 64.9034 181.182C64.9034 184.903 67.1136 187.159 70.1364 187.159C72.6932 187.159 74.5625 185.557 74.9432 183.256L73.1705 183.25C72.8693 184.739 71.6193 185.557 70.1477 185.557C68.1534 185.557 66.6477 184.028 66.6477 181.182C66.6477 178.358 68.1477 176.807 70.1534 176.807C71.6364 176.807 72.8807 177.642 73.1705 179.148H74.9432ZM79.4474 187.193C80.8906 187.193 81.7031 186.46 82.027 185.807H82.0952V187H83.7543V181.205C83.7543 178.665 81.7543 178.159 80.3679 178.159C78.7884 178.159 77.3338 178.795 76.7656 180.386L78.3622 180.75C78.6122 180.131 79.2486 179.534 80.3906 179.534C81.4872 179.534 82.0497 180.108 82.0497 181.097V181.136C82.0497 181.756 81.4134 181.744 79.8452 181.926C78.1918 182.119 76.4986 182.551 76.4986 184.534C76.4986 186.25 77.7884 187.193 79.4474 187.193ZM79.8168 185.83C78.8565 185.83 78.1634 185.398 78.1634 184.557C78.1634 183.648 78.9702 183.324 79.9531 183.193C80.5043 183.119 81.8111 182.972 82.0554 182.727V183.852C82.0554 184.886 81.2315 185.83 79.8168 185.83ZM90.0909 178.273H88.3011V176.182H86.6023V178.273H85.3239V179.636H86.6023V184.79C86.5966 186.375 87.8068 187.142 89.1477 187.114C89.6875 187.108 90.0511 187.006 90.25 186.932L89.9432 185.528C89.8295 185.551 89.6193 185.602 89.3466 185.602C88.7955 185.602 88.3011 185.42 88.3011 184.438V179.636H90.0909V178.273ZM95.6378 187.176C97.5412 187.176 98.8878 186.239 99.2741 184.818L97.6662 184.528C97.3594 185.352 96.6207 185.773 95.6548 185.773C94.2003 185.773 93.223 184.83 93.1776 183.148H99.3821V182.545C99.3821 179.392 97.4957 178.159 95.5185 178.159C93.0866 178.159 91.4844 180.011 91.4844 182.693C91.4844 185.403 93.0639 187.176 95.6378 187.176ZM93.1832 181.875C93.2514 180.636 94.1491 179.562 95.5298 179.562C96.848 179.562 97.7116 180.54 97.7173 181.875H93.1832ZM104.926 190.455C107.148 190.455 108.864 189.438 108.864 187.193V178.273H107.199V179.688H107.074C106.773 179.148 106.17 178.159 104.545 178.159C102.438 178.159 100.886 179.824 100.886 182.602C100.886 185.386 102.472 186.869 104.534 186.869C106.136 186.869 106.756 185.966 107.062 185.409H107.17V187.125C107.17 188.494 106.233 189.085 104.943 189.085C103.528 189.085 102.977 188.375 102.676 187.875L101.216 188.477C101.676 189.545 102.841 190.455 104.926 190.455ZM104.909 185.46C103.392 185.46 102.602 184.295 102.602 182.58C102.602 180.903 103.375 179.602 104.909 179.602C106.392 179.602 107.188 180.812 107.188 182.58C107.188 184.381 106.375 185.46 104.909 185.46ZM114.818 187.176C117.278 187.176 118.886 185.375 118.886 182.676C118.886 179.96 117.278 178.159 114.818 178.159C112.358 178.159 110.75 179.96 110.75 182.676C110.75 185.375 112.358 187.176 114.818 187.176ZM114.824 185.75C113.216 185.75 112.466 184.347 112.466 182.67C112.466 181 113.216 179.58 114.824 179.58C116.42 179.58 117.17 181 117.17 182.67C117.17 184.347 116.42 185.75 114.824 185.75ZM120.783 187H122.482V181.67C122.482 180.528 123.362 179.705 124.567 179.705C124.919 179.705 125.317 179.767 125.453 179.807V178.182C125.283 178.159 124.947 178.142 124.732 178.142C123.709 178.142 122.834 178.722 122.516 179.659H122.425V178.273H120.783V187ZM128.263 190.273C129.666 190.273 130.553 189.54 131.058 188.165L134.666 178.29L132.831 178.273L130.621 185.045H130.53L128.32 178.273H126.501L129.695 187.114L129.484 187.693C129.053 188.852 128.445 188.949 127.513 188.693L127.104 190.085C127.308 190.176 127.751 190.273 128.263 190.273ZM144.893 175.364H143.183L140.28 177.261V178.943L143.064 177.125H143.132V187H144.893V175.364Z" fill="#333333"/>
<rect x="266" y="209" width="56" height="28" rx="8" fill="#5E81F4"/>
<rect x="50.5" y="209.5" width="55" height="27" rx="7.5" stroke="#EB5757"/>
<path d="M283.696 227L284.497 224.69H287.906L288.703 227H290.101L286.96 218.273H285.439L282.298 227H283.696ZM284.881 223.582L286.168 219.858H286.236L287.523 223.582H284.881ZM293.604 227.128C294.797 227.128 295.266 226.399 295.496 225.982H295.602V227H296.847V218.273H295.572V221.516H295.496C295.266 221.111 294.831 220.369 293.612 220.369C292.031 220.369 290.868 221.618 290.868 223.74C290.868 225.858 292.014 227.128 293.604 227.128ZM293.885 226.041C292.747 226.041 292.155 225.04 292.155 223.727C292.155 222.428 292.734 221.452 293.885 221.452C294.997 221.452 295.594 222.359 295.594 223.727C295.594 225.104 294.984 226.041 293.885 226.041ZM301.115 227.128C302.309 227.128 302.777 226.399 303.007 225.982H303.114V227H304.358V218.273H303.084V221.516H303.007C302.777 221.111 302.343 220.369 301.124 220.369C299.543 220.369 298.38 221.618 298.38 223.74C298.38 225.858 299.526 227.128 301.115 227.128ZM301.397 226.041C300.259 226.041 299.667 225.04 299.667 223.727C299.667 222.428 300.246 221.452 301.397 221.452C302.509 221.452 303.105 222.359 303.105 223.727C303.105 225.104 302.496 226.041 301.397 226.041Z" fill="white"/>
<path d="M62.7841 227C65.4432 227 66.9815 225.351 66.9815 222.624C66.9815 219.909 65.4432 218.273 62.8736 218.273H59.9588V227H62.7841ZM61.2756 225.849V219.423H62.7926C64.7017 219.423 65.6861 220.565 65.6861 222.624C65.6861 224.69 64.7017 225.849 62.7116 225.849H61.2756ZM71.3377 227.132C72.7653 227.132 73.7752 226.429 74.065 225.364L72.859 225.146C72.6289 225.764 72.0749 226.08 71.3505 226.08C70.2596 226.08 69.5266 225.372 69.4925 224.111H74.146V223.659C74.146 221.294 72.7312 220.369 71.2482 220.369C69.4244 220.369 68.2227 221.759 68.2227 223.77C68.2227 225.803 69.4073 227.132 71.3377 227.132ZM69.4968 223.156C69.5479 222.227 70.2212 221.422 71.2567 221.422C72.2454 221.422 72.8931 222.155 72.8974 223.156H69.4968ZM76.8338 218.273H75.5597V227H76.8338V218.273ZM81.369 227.132C82.7965 227.132 83.8065 226.429 84.0962 225.364L82.8903 225.146C82.6602 225.764 82.1062 226.08 81.3817 226.08C80.2908 226.08 79.5579 225.372 79.5238 224.111H84.1772V223.659C84.1772 221.294 82.7624 220.369 81.2795 220.369C79.4556 220.369 78.2539 221.759 78.2539 223.77C78.2539 225.803 79.4386 227.132 81.369 227.132ZM79.5281 223.156C79.5792 222.227 80.2525 221.422 81.288 221.422C82.2766 221.422 82.9244 222.155 82.9286 223.156H79.5281ZM88.6463 220.455H87.304V218.886H86.0298V220.455H85.071V221.477H86.0298V225.342C86.0256 226.531 86.9332 227.107 87.9389 227.085C88.3438 227.081 88.6165 227.004 88.7656 226.949L88.5355 225.896C88.4503 225.913 88.2926 225.952 88.0881 225.952C87.6747 225.952 87.304 225.815 87.304 225.078V221.477H88.6463V220.455ZM92.8065 227.132C94.234 227.132 95.244 226.429 95.5337 225.364L94.3278 225.146C94.0977 225.764 93.5437 226.08 92.8192 226.08C91.7283 226.08 90.9954 225.372 90.9613 224.111H95.6147V223.659C95.6147 221.294 94.1999 220.369 92.717 220.369C90.8931 220.369 89.6914 221.759 89.6914 223.77C89.6914 225.803 90.8761 227.132 92.8065 227.132ZM90.9656 223.156C91.0167 222.227 91.69 221.422 92.7255 221.422C93.7141 221.422 94.3619 222.155 94.3661 223.156H90.9656Z" fill="#EB5757"/>
<defs>
<filter id="filter0_d" x="24" y="124" width="324" height="135" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feMorphology radius="2" operator="dilate" in="SourceAlpha" result="effect1_dropShadow"/>
<feOffset/>
<feGaussianBlur stdDeviation="4"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
</filter>
</defs>
</svg>
</div>
`          
             this.faqPosition = {}
            this.showMenuHelper = false

            window.scrollTo(0, 300);

            this.modalFaq['style']['bottom'] = '-225px'
            this.faqPosition['top'] = '100px';
            this.faqPosition['width'] = '500px';
            this.faqPosition['left'] = '50px';
            this.modalFaq['style']['max-width'] = '300px'
            this.modalFaq['style']['right'] = '-350px'
            this.modalFaq['style']['left'] = ''
            this.modalFaq['style']['top'] = ''
            this.modalFaq['header'] = 'Ubah kategori'
            this.modalFaq['body'] = `Klik tanda + untuk membuat kategori baru. Klik kategori 
untuk mengganti nama sesuai keinginanmu maupun 
menghapus kategori. Ini juga berlaku untuk sub-category 
yaa.`
        },
        faqTransactionHistory() {
            window.scrollTo(0, 300);
            this.currentFaq='history'
            this.faq = `
                <div
                class="bg-white shadow-md p-4 rounded-2xl">
                    <svg width="350" height="308" viewBox="0 0 350 308" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect x="230" width="120" height="29" rx="14.5" fill="#6FCF97"/>
<path d="M255.233 20H256.466V16.0227H258.693C258.783 16.0227 258.867 16.0227 258.952 16.0178L261.099 20H262.531L260.229 15.794C261.527 15.3516 262.134 14.2926 262.134 12.9403C262.134 11.1406 261.06 9.81818 258.673 9.81818H255.233V20ZM256.466 14.9091V10.9119H258.634C260.284 10.9119 260.92 11.7173 260.92 12.9403C260.92 14.1634 260.284 14.9091 258.653 14.9091H256.466ZM264.029 22.8636H265.202V18.8267H265.302C265.56 19.2443 266.057 20.1591 267.529 20.1591C269.438 20.1591 270.77 18.6278 270.77 16.2017C270.77 13.7955 269.438 12.2642 267.509 12.2642C266.018 12.2642 265.56 13.179 265.302 13.5767H265.162V12.3636H264.029V22.8636ZM265.182 16.1818C265.182 14.4716 265.938 13.3182 267.37 13.3182C268.861 13.3182 269.597 14.571 269.597 16.1818C269.597 17.8125 268.841 19.1051 267.37 19.1051C265.958 19.1051 265.182 17.9119 265.182 16.1818ZM272.858 20H274.151L278.685 10.9716V9.81818H272.162V10.9119H277.412V10.9915L272.858 20ZM283.641 20.1392C285.888 20.1392 287.18 18.2351 287.18 14.9091C287.18 11.608 285.868 9.67898 283.641 9.67898C281.413 9.67898 280.101 11.608 280.101 14.9091C280.101 18.2351 281.393 20.1392 283.641 20.1392ZM283.641 19.0455C282.159 19.0455 281.294 17.5589 281.294 14.9091C281.294 12.2642 282.169 10.7528 283.641 10.7528C285.112 10.7528 285.987 12.2642 285.987 14.9091C285.987 17.5589 285.122 19.0455 283.641 19.0455ZM292.391 20.1392C294.638 20.1392 295.93 18.2351 295.93 14.9091C295.93 11.608 294.618 9.67898 292.391 9.67898C290.163 9.67898 288.851 11.608 288.851 14.9091C288.851 18.2351 290.143 20.1392 292.391 20.1392ZM292.391 19.0455C290.909 19.0455 290.044 17.5589 290.044 14.9091C290.044 12.2642 290.919 10.7528 292.391 10.7528C293.862 10.7528 294.737 12.2642 294.737 14.9091C294.737 17.5589 293.872 19.0455 292.391 19.0455ZM298.339 20.0795C298.831 20.0795 299.234 19.6768 299.234 19.1847C299.234 18.6925 298.831 18.2898 298.339 18.2898C297.847 18.2898 297.444 18.6925 297.444 19.1847C297.444 19.6768 297.847 20.0795 298.339 20.0795ZM304.285 20.1392C306.532 20.1392 307.825 18.2351 307.825 14.9091C307.825 11.608 306.512 9.67898 304.285 9.67898C302.058 9.67898 300.745 11.608 300.745 14.9091C300.745 18.2351 302.038 20.1392 304.285 20.1392ZM304.285 19.0455C302.804 19.0455 301.939 17.5589 301.939 14.9091C301.939 12.2642 302.814 10.7528 304.285 10.7528C305.757 10.7528 306.632 12.2642 306.632 14.9091C306.632 17.5589 305.767 19.0455 304.285 19.0455ZM313.035 20.1392C315.282 20.1392 316.575 18.2351 316.575 14.9091C316.575 11.608 315.262 9.67898 313.035 9.67898C310.808 9.67898 309.495 11.608 309.495 14.9091C309.495 18.2351 310.788 20.1392 313.035 20.1392ZM313.035 19.0455C311.554 19.0455 310.689 17.5589 310.689 14.9091C310.689 12.2642 311.564 10.7528 313.035 10.7528C314.507 10.7528 315.382 12.2642 315.382 14.9091C315.382 17.5589 314.517 19.0455 313.035 19.0455ZM321.785 20.1392C324.032 20.1392 325.325 18.2351 325.325 14.9091C325.325 11.608 324.012 9.67898 321.785 9.67898C319.558 9.67898 318.245 11.608 318.245 14.9091C318.245 18.2351 319.538 20.1392 321.785 20.1392ZM321.785 19.0455C320.304 19.0455 319.439 17.5589 319.439 14.9091C319.439 12.2642 320.314 10.7528 321.785 10.7528C323.257 10.7528 324.132 12.2642 324.132 14.9091C324.132 17.5589 323.267 19.0455 321.785 19.0455Z" fill="black"/>
<rect x="230" y="45" width="120" height="29" rx="14.5" fill="#FAE09A"/>
<path d="M255.233 65H256.466V61.0227H258.693C258.783 61.0227 258.867 61.0227 258.952 61.0178L261.099 65H262.531L260.229 60.794C261.527 60.3516 262.134 59.2926 262.134 57.9403C262.134 56.1406 261.06 54.8182 258.673 54.8182H255.233V65ZM256.466 59.9091V55.9119H258.634C260.284 55.9119 260.92 56.7173 260.92 57.9403C260.92 59.1634 260.284 59.9091 258.653 59.9091H256.466ZM264.029 67.8636H265.202V63.8267H265.302C265.56 64.2443 266.057 65.1591 267.529 65.1591C269.438 65.1591 270.77 63.6278 270.77 61.2017C270.77 58.7955 269.438 57.2642 267.509 57.2642C266.018 57.2642 265.56 58.179 265.302 58.5767H265.162V57.3636H264.029V67.8636ZM265.182 61.1818C265.182 59.4716 265.938 58.3182 267.37 58.3182C268.861 58.3182 269.597 59.571 269.597 61.1818C269.597 62.8125 268.841 64.1051 267.37 64.1051C265.958 64.1051 265.182 62.9119 265.182 61.1818ZM272.858 65H274.151L278.685 55.9716V54.8182H272.162V55.9119H277.412V55.9915L272.858 65ZM283.641 65.1392C285.888 65.1392 287.18 63.2351 287.18 59.9091C287.18 56.608 285.868 54.679 283.641 54.679C281.413 54.679 280.101 56.608 280.101 59.9091C280.101 63.2351 281.393 65.1392 283.641 65.1392ZM283.641 64.0455C282.159 64.0455 281.294 62.5589 281.294 59.9091C281.294 57.2642 282.169 55.7528 283.641 55.7528C285.112 55.7528 285.987 57.2642 285.987 59.9091C285.987 62.5589 285.122 64.0455 283.641 64.0455ZM292.391 65.1392C294.638 65.1392 295.93 63.2351 295.93 59.9091C295.93 56.608 294.618 54.679 292.391 54.679C290.163 54.679 288.851 56.608 288.851 59.9091C288.851 63.2351 290.143 65.1392 292.391 65.1392ZM292.391 64.0455C290.909 64.0455 290.044 62.5589 290.044 59.9091C290.044 57.2642 290.919 55.7528 292.391 55.7528C293.862 55.7528 294.737 57.2642 294.737 59.9091C294.737 62.5589 293.872 64.0455 292.391 64.0455ZM298.339 65.0795C298.831 65.0795 299.234 64.6768 299.234 64.1847C299.234 63.6925 298.831 63.2898 298.339 63.2898C297.847 63.2898 297.444 63.6925 297.444 64.1847C297.444 64.6768 297.847 65.0795 298.339 65.0795ZM304.285 65.1392C306.532 65.1392 307.825 63.2351 307.825 59.9091C307.825 56.608 306.512 54.679 304.285 54.679C302.058 54.679 300.745 56.608 300.745 59.9091C300.745 63.2351 302.038 65.1392 304.285 65.1392ZM304.285 64.0455C302.804 64.0455 301.939 62.5589 301.939 59.9091C301.939 57.2642 302.814 55.7528 304.285 55.7528C305.757 55.7528 306.632 57.2642 306.632 59.9091C306.632 62.5589 305.767 64.0455 304.285 64.0455ZM313.035 65.1392C315.282 65.1392 316.575 63.2351 316.575 59.9091C316.575 56.608 315.262 54.679 313.035 54.679C310.808 54.679 309.495 56.608 309.495 59.9091C309.495 63.2351 310.788 65.1392 313.035 65.1392ZM313.035 64.0455C311.554 64.0455 310.689 62.5589 310.689 59.9091C310.689 57.2642 311.564 55.7528 313.035 55.7528C314.507 55.7528 315.382 57.2642 315.382 59.9091C315.382 62.5589 314.517 64.0455 313.035 64.0455ZM321.785 65.1392C324.032 65.1392 325.325 63.2351 325.325 59.9091C325.325 56.608 324.012 54.679 321.785 54.679C319.558 54.679 318.245 56.608 318.245 59.9091C318.245 63.2351 319.538 65.1392 321.785 65.1392ZM321.785 64.0455C320.304 64.0455 319.439 62.5589 319.439 59.9091C319.439 57.2642 320.314 55.7528 321.785 55.7528C323.257 55.7528 324.132 57.2642 324.132 59.9091C324.132 62.5589 323.267 64.0455 321.785 64.0455Z" fill="black"/>
<path d="M254.233 204H255.466V200.023H257.693C257.783 200.023 257.867 200.023 257.952 200.018L260.099 204H261.531L259.229 199.794C260.527 199.352 261.134 198.293 261.134 196.94C261.134 195.141 260.06 193.818 257.673 193.818H254.233V204ZM255.466 198.909V194.912H257.634C259.284 194.912 259.92 195.717 259.92 196.94C259.92 198.163 259.284 198.909 257.653 198.909H255.466ZM263.029 206.864H264.202V202.827H264.302C264.56 203.244 265.057 204.159 266.529 204.159C268.438 204.159 269.77 202.628 269.77 200.202C269.77 197.795 268.438 196.264 266.509 196.264C265.018 196.264 264.56 197.179 264.302 197.577H264.162V196.364H263.029V206.864ZM264.182 200.182C264.182 198.472 264.938 197.318 266.37 197.318C267.861 197.318 268.597 198.571 268.597 200.182C268.597 201.812 267.841 203.105 266.37 203.105C264.958 203.105 264.182 201.912 264.182 200.182ZM271.858 204H273.151L277.685 194.972V193.818H271.162V194.912H276.412V194.991L271.858 204ZM282.641 204.139C284.888 204.139 286.18 202.235 286.18 198.909C286.18 195.608 284.868 193.679 282.641 193.679C280.413 193.679 279.101 195.608 279.101 198.909C279.101 202.235 280.393 204.139 282.641 204.139ZM282.641 203.045C281.159 203.045 280.294 201.559 280.294 198.909C280.294 196.264 281.169 194.753 282.641 194.753C284.112 194.753 284.987 196.264 284.987 198.909C284.987 201.559 284.122 203.045 282.641 203.045ZM291.391 204.139C293.638 204.139 294.93 202.235 294.93 198.909C294.93 195.608 293.618 193.679 291.391 193.679C289.163 193.679 287.851 195.608 287.851 198.909C287.851 202.235 289.143 204.139 291.391 204.139ZM291.391 203.045C289.909 203.045 289.044 201.559 289.044 198.909C289.044 196.264 289.919 194.753 291.391 194.753C292.862 194.753 293.737 196.264 293.737 198.909C293.737 201.559 292.872 203.045 291.391 203.045ZM297.339 204.08C297.831 204.08 298.234 203.677 298.234 203.185C298.234 202.692 297.831 202.29 297.339 202.29C296.847 202.29 296.444 202.692 296.444 203.185C296.444 203.677 296.847 204.08 297.339 204.08ZM303.285 204.139C305.532 204.139 306.825 202.235 306.825 198.909C306.825 195.608 305.512 193.679 303.285 193.679C301.058 193.679 299.745 195.608 299.745 198.909C299.745 202.235 301.038 204.139 303.285 204.139ZM303.285 203.045C301.804 203.045 300.939 201.559 300.939 198.909C300.939 196.264 301.814 194.753 303.285 194.753C304.757 194.753 305.632 196.264 305.632 198.909C305.632 201.559 304.767 203.045 303.285 203.045ZM312.035 204.139C314.282 204.139 315.575 202.235 315.575 198.909C315.575 195.608 314.262 193.679 312.035 193.679C309.808 193.679 308.495 195.608 308.495 198.909C308.495 202.235 309.788 204.139 312.035 204.139ZM312.035 203.045C310.554 203.045 309.689 201.559 309.689 198.909C309.689 196.264 310.564 194.753 312.035 194.753C313.507 194.753 314.382 196.264 314.382 198.909C314.382 201.559 313.517 203.045 312.035 203.045ZM320.785 204.139C323.032 204.139 324.325 202.235 324.325 198.909C324.325 195.608 323.012 193.679 320.785 193.679C318.558 193.679 317.245 195.608 317.245 198.909C317.245 202.235 318.538 204.139 320.785 204.139ZM320.785 203.045C319.304 203.045 318.439 201.559 318.439 198.909C318.439 196.264 319.314 194.753 320.785 194.753C322.257 194.753 323.132 196.264 323.132 198.909C323.132 201.559 322.267 203.045 320.785 203.045Z" fill="black"/>
<rect x="230" y="234" width="120" height="29" rx="14.5" fill="#6FCF97"/>
<path d="M255.233 254H256.466V250.023H258.693C258.783 250.023 258.867 250.023 258.952 250.018L261.099 254H262.531L260.229 249.794C261.527 249.352 262.134 248.293 262.134 246.94C262.134 245.141 261.06 243.818 258.673 243.818H255.233V254ZM256.466 248.909V244.912H258.634C260.284 244.912 260.92 245.717 260.92 246.94C260.92 248.163 260.284 248.909 258.653 248.909H256.466ZM264.029 256.864H265.202V252.827H265.302C265.56 253.244 266.057 254.159 267.529 254.159C269.438 254.159 270.77 252.628 270.77 250.202C270.77 247.795 269.438 246.264 267.509 246.264C266.018 246.264 265.56 247.179 265.302 247.577H265.162V246.364H264.029V256.864ZM265.182 250.182C265.182 248.472 265.938 247.318 267.37 247.318C268.861 247.318 269.597 248.571 269.597 250.182C269.597 251.812 268.841 253.105 267.37 253.105C265.958 253.105 265.182 251.912 265.182 250.182ZM272.858 254H274.151L278.685 244.972V243.818H272.162V244.912H277.412V244.991L272.858 254ZM283.641 254.139C285.888 254.139 287.18 252.235 287.18 248.909C287.18 245.608 285.868 243.679 283.641 243.679C281.413 243.679 280.101 245.608 280.101 248.909C280.101 252.235 281.393 254.139 283.641 254.139ZM283.641 253.045C282.159 253.045 281.294 251.559 281.294 248.909C281.294 246.264 282.169 244.753 283.641 244.753C285.112 244.753 285.987 246.264 285.987 248.909C285.987 251.559 285.122 253.045 283.641 253.045ZM292.391 254.139C294.638 254.139 295.93 252.235 295.93 248.909C295.93 245.608 294.618 243.679 292.391 243.679C290.163 243.679 288.851 245.608 288.851 248.909C288.851 252.235 290.143 254.139 292.391 254.139ZM292.391 253.045C290.909 253.045 290.044 251.559 290.044 248.909C290.044 246.264 290.919 244.753 292.391 244.753C293.862 244.753 294.737 246.264 294.737 248.909C294.737 251.559 293.872 253.045 292.391 253.045ZM298.339 254.08C298.831 254.08 299.234 253.677 299.234 253.185C299.234 252.692 298.831 252.29 298.339 252.29C297.847 252.29 297.444 252.692 297.444 253.185C297.444 253.677 297.847 254.08 298.339 254.08ZM304.285 254.139C306.532 254.139 307.825 252.235 307.825 248.909C307.825 245.608 306.512 243.679 304.285 243.679C302.058 243.679 300.745 245.608 300.745 248.909C300.745 252.235 302.038 254.139 304.285 254.139ZM304.285 253.045C302.804 253.045 301.939 251.559 301.939 248.909C301.939 246.264 302.814 244.753 304.285 244.753C305.757 244.753 306.632 246.264 306.632 248.909C306.632 251.559 305.767 253.045 304.285 253.045ZM313.035 254.139C315.282 254.139 316.575 252.235 316.575 248.909C316.575 245.608 315.262 243.679 313.035 243.679C310.808 243.679 309.495 245.608 309.495 248.909C309.495 252.235 310.788 254.139 313.035 254.139ZM313.035 253.045C311.554 253.045 310.689 251.559 310.689 248.909C310.689 246.264 311.564 244.753 313.035 244.753C314.507 244.753 315.382 246.264 315.382 248.909C315.382 251.559 314.517 253.045 313.035 253.045ZM321.785 254.139C324.032 254.139 325.325 252.235 325.325 248.909C325.325 245.608 324.012 243.679 321.785 243.679C319.558 243.679 318.245 245.608 318.245 248.909C318.245 252.235 319.538 254.139 321.785 254.139ZM321.785 253.045C320.304 253.045 319.439 251.559 319.439 248.909C319.439 246.264 320.314 244.753 321.785 244.753C323.257 244.753 324.132 246.264 324.132 248.909C324.132 251.559 323.267 253.045 321.785 253.045Z" fill="black"/>
<rect x="230" y="279" width="120" height="29" rx="14.5" fill="#FAE09A"/>
<path d="M255.233 299H256.466V295.023H258.693C258.783 295.023 258.867 295.023 258.952 295.018L261.099 299H262.531L260.229 294.794C261.527 294.352 262.134 293.293 262.134 291.94C262.134 290.141 261.06 288.818 258.673 288.818H255.233V299ZM256.466 293.909V289.912H258.634C260.284 289.912 260.92 290.717 260.92 291.94C260.92 293.163 260.284 293.909 258.653 293.909H256.466ZM264.029 301.864H265.202V297.827H265.302C265.56 298.244 266.057 299.159 267.529 299.159C269.438 299.159 270.77 297.628 270.77 295.202C270.77 292.795 269.438 291.264 267.509 291.264C266.018 291.264 265.56 292.179 265.302 292.577H265.162V291.364H264.029V301.864ZM265.182 295.182C265.182 293.472 265.938 292.318 267.37 292.318C268.861 292.318 269.597 293.571 269.597 295.182C269.597 296.812 268.841 298.105 267.37 298.105C265.958 298.105 265.182 296.912 265.182 295.182ZM272.858 299H274.151L278.685 289.972V288.818H272.162V289.912H277.412V289.991L272.858 299ZM283.641 299.139C285.888 299.139 287.18 297.235 287.18 293.909C287.18 290.608 285.868 288.679 283.641 288.679C281.413 288.679 280.101 290.608 280.101 293.909C280.101 297.235 281.393 299.139 283.641 299.139ZM283.641 298.045C282.159 298.045 281.294 296.559 281.294 293.909C281.294 291.264 282.169 289.753 283.641 289.753C285.112 289.753 285.987 291.264 285.987 293.909C285.987 296.559 285.122 298.045 283.641 298.045ZM292.391 299.139C294.638 299.139 295.93 297.235 295.93 293.909C295.93 290.608 294.618 288.679 292.391 288.679C290.163 288.679 288.851 290.608 288.851 293.909C288.851 297.235 290.143 299.139 292.391 299.139ZM292.391 298.045C290.909 298.045 290.044 296.559 290.044 293.909C290.044 291.264 290.919 289.753 292.391 289.753C293.862 289.753 294.737 291.264 294.737 293.909C294.737 296.559 293.872 298.045 292.391 298.045ZM298.339 299.08C298.831 299.08 299.234 298.677 299.234 298.185C299.234 297.692 298.831 297.29 298.339 297.29C297.847 297.29 297.444 297.692 297.444 298.185C297.444 298.677 297.847 299.08 298.339 299.08ZM304.285 299.139C306.532 299.139 307.825 297.235 307.825 293.909C307.825 290.608 306.512 288.679 304.285 288.679C302.058 288.679 300.745 290.608 300.745 293.909C300.745 297.235 302.038 299.139 304.285 299.139ZM304.285 298.045C302.804 298.045 301.939 296.559 301.939 293.909C301.939 291.264 302.814 289.753 304.285 289.753C305.757 289.753 306.632 291.264 306.632 293.909C306.632 296.559 305.767 298.045 304.285 298.045ZM313.035 299.139C315.282 299.139 316.575 297.235 316.575 293.909C316.575 290.608 315.262 288.679 313.035 288.679C310.808 288.679 309.495 290.608 309.495 293.909C309.495 297.235 310.788 299.139 313.035 299.139ZM313.035 298.045C311.554 298.045 310.689 296.559 310.689 293.909C310.689 291.264 311.564 289.753 313.035 289.753C314.507 289.753 315.382 291.264 315.382 293.909C315.382 296.559 314.517 298.045 313.035 298.045ZM321.785 299.139C324.032 299.139 325.325 297.235 325.325 293.909C325.325 290.608 324.012 288.679 321.785 288.679C319.558 288.679 318.245 290.608 318.245 293.909C318.245 297.235 319.538 299.139 321.785 299.139ZM321.785 298.045C320.304 298.045 319.439 296.559 319.439 293.909C319.439 291.264 320.314 289.753 321.785 289.753C323.257 289.753 324.132 291.264 324.132 293.909C324.132 296.559 323.267 298.045 321.785 298.045Z" fill="black"/>
<path d="M38.233 20H39.4659V16.0227H41.6932C41.7827 16.0227 41.8672 16.0227 41.9517 16.0178L44.0994 20H45.5312L43.2294 15.794C44.527 15.3516 45.1335 14.2926 45.1335 12.9403C45.1335 11.1406 44.0597 9.81818 41.6733 9.81818H38.233V20ZM39.4659 14.9091V10.9119H41.6335C43.2841 10.9119 43.9205 11.7173 43.9205 12.9403C43.9205 14.1634 43.2841 14.9091 41.6534 14.9091H39.4659ZM47.0289 22.8636H48.2022V18.8267H48.3017C48.5602 19.2443 49.0574 20.1591 50.5289 20.1591C52.438 20.1591 53.7704 18.6278 53.7704 16.2017C53.7704 13.7955 52.438 12.2642 50.5091 12.2642C49.0176 12.2642 48.5602 13.179 48.3017 13.5767H48.1625V12.3636H47.0289V22.8636ZM48.1824 16.1818C48.1824 14.4716 48.938 13.3182 50.3699 13.3182C51.8613 13.3182 52.5971 14.571 52.5971 16.1818C52.5971 17.8125 51.8414 19.1051 50.3699 19.1051C48.9579 19.1051 48.1824 17.9119 48.1824 16.1818ZM58.9806 20.1392C60.9544 20.1392 62.421 18.9013 62.421 17.2358C62.421 15.9432 61.6554 15.0036 60.3727 14.7898V14.7102C61.4018 14.397 62.0431 13.5518 62.0431 12.4034C62.0431 10.9616 60.9047 9.67898 59.0204 9.67898C57.2605 9.67898 55.7988 10.7628 55.7392 12.3636H56.9324C56.9771 11.3494 57.9416 10.7528 59.0005 10.7528C60.1241 10.7528 60.85 11.4339 60.85 12.4631C60.85 13.5369 60.0098 14.233 58.8017 14.233H57.9863V15.3267H58.8017C60.3478 15.3267 61.2079 16.1122 61.2079 17.2358C61.2079 18.3146 60.2683 19.0455 58.9608 19.0455C57.7825 19.0455 56.8478 18.4389 56.7733 17.4545H55.5204C55.595 19.0554 57.0069 20.1392 58.9806 20.1392ZM67.7754 20.1392C70.0225 20.1392 71.3152 18.2351 71.3152 14.9091C71.3152 11.608 70.0027 9.67898 67.7754 9.67898C65.5481 9.67898 64.2356 11.608 64.2356 14.9091C64.2356 18.2351 65.5282 20.1392 67.7754 20.1392ZM67.7754 19.0455C66.2939 19.0455 65.4288 17.5589 65.4288 14.9091C65.4288 12.2642 66.3038 10.7528 67.7754 10.7528C69.247 10.7528 70.122 12.2642 70.122 14.9091C70.122 17.5589 69.2569 19.0455 67.7754 19.0455ZM76.5254 20.1392C78.7725 20.1392 80.0652 18.2351 80.0652 14.9091C80.0652 11.608 78.7527 9.67898 76.5254 9.67898C74.2981 9.67898 72.9856 11.608 72.9856 14.9091C72.9856 18.2351 74.2782 20.1392 76.5254 20.1392ZM76.5254 19.0455C75.0439 19.0455 74.1788 17.5589 74.1788 14.9091C74.1788 12.2642 75.0538 10.7528 76.5254 10.7528C77.997 10.7528 78.872 12.2642 78.872 14.9091C78.872 17.5589 78.0069 19.0455 76.5254 19.0455ZM82.4739 20.0795C82.9661 20.0795 83.3688 19.6768 83.3688 19.1847C83.3688 18.6925 82.9661 18.2898 82.4739 18.2898C81.9817 18.2898 81.579 18.6925 81.579 19.1847C81.579 19.6768 81.9817 20.0795 82.4739 20.0795ZM88.4199 20.1392C90.6671 20.1392 91.9597 18.2351 91.9597 14.9091C91.9597 11.608 90.6472 9.67898 88.4199 9.67898C86.1926 9.67898 84.8801 11.608 84.8801 14.9091C84.8801 18.2351 86.1728 20.1392 88.4199 20.1392ZM88.4199 19.0455C86.9384 19.0455 86.0733 17.5589 86.0733 14.9091C86.0733 12.2642 86.9483 10.7528 88.4199 10.7528C89.8915 10.7528 90.7665 12.2642 90.7665 14.9091C90.7665 17.5589 89.9015 19.0455 88.4199 19.0455ZM97.1699 20.1392C99.4171 20.1392 100.71 18.2351 100.71 14.9091C100.71 11.608 99.3972 9.67898 97.1699 9.67898C94.9426 9.67898 93.6301 11.608 93.6301 14.9091C93.6301 18.2351 94.9228 20.1392 97.1699 20.1392ZM97.1699 19.0455C95.6884 19.0455 94.8233 17.5589 94.8233 14.9091C94.8233 12.2642 95.6983 10.7528 97.1699 10.7528C98.6415 10.7528 99.5165 12.2642 99.5165 14.9091C99.5165 17.5589 98.6515 19.0455 97.1699 19.0455ZM105.92 20.1392C108.167 20.1392 109.46 18.2351 109.46 14.9091C109.46 11.608 108.147 9.67898 105.92 9.67898C103.693 9.67898 102.38 11.608 102.38 14.9091C102.38 18.2351 103.673 20.1392 105.92 20.1392ZM105.92 19.0455C104.438 19.0455 103.573 17.5589 103.573 14.9091C103.573 12.2642 104.448 10.7528 105.92 10.7528C107.392 10.7528 108.267 12.2642 108.267 14.9091C108.267 17.5589 107.401 19.0455 105.92 19.0455Z" fill="black"/>
<path d="M38.233 204H39.4659V200.023H41.6932C41.7827 200.023 41.8672 200.023 41.9517 200.018L44.0994 204H45.5312L43.2294 199.794C44.527 199.352 45.1335 198.293 45.1335 196.94C45.1335 195.141 44.0597 193.818 41.6733 193.818H38.233V204ZM39.4659 198.909V194.912H41.6335C43.2841 194.912 43.9205 195.717 43.9205 196.94C43.9205 198.163 43.2841 198.909 41.6534 198.909H39.4659ZM47.0289 206.864H48.2022V202.827H48.3017C48.5602 203.244 49.0574 204.159 50.5289 204.159C52.438 204.159 53.7704 202.628 53.7704 200.202C53.7704 197.795 52.438 196.264 50.5091 196.264C49.0176 196.264 48.5602 197.179 48.3017 197.577H48.1625V196.364H47.0289V206.864ZM48.1824 200.182C48.1824 198.472 48.938 197.318 50.3699 197.318C51.8613 197.318 52.5971 198.571 52.5971 200.182C52.5971 201.812 51.8414 203.105 50.3699 203.105C48.9579 203.105 48.1824 201.912 48.1824 200.182ZM58.9806 204.139C60.9544 204.139 62.421 202.901 62.421 201.236C62.421 199.943 61.6554 199.004 60.3727 198.79V198.71C61.4018 198.397 62.0431 197.552 62.0431 196.403C62.0431 194.962 60.9047 193.679 59.0204 193.679C57.2605 193.679 55.7988 194.763 55.7392 196.364H56.9324C56.9771 195.349 57.9416 194.753 59.0005 194.753C60.1241 194.753 60.85 195.434 60.85 196.463C60.85 197.537 60.0098 198.233 58.8017 198.233H57.9863V199.327H58.8017C60.3478 199.327 61.2079 200.112 61.2079 201.236C61.2079 202.315 60.2683 203.045 58.9608 203.045C57.7825 203.045 56.8478 202.439 56.7733 201.455H55.5204C55.595 203.055 57.0069 204.139 58.9806 204.139ZM67.7754 204.139C70.0225 204.139 71.3152 202.235 71.3152 198.909C71.3152 195.608 70.0027 193.679 67.7754 193.679C65.5481 193.679 64.2356 195.608 64.2356 198.909C64.2356 202.235 65.5282 204.139 67.7754 204.139ZM67.7754 203.045C66.2939 203.045 65.4288 201.559 65.4288 198.909C65.4288 196.264 66.3038 194.753 67.7754 194.753C69.247 194.753 70.122 196.264 70.122 198.909C70.122 201.559 69.2569 203.045 67.7754 203.045ZM76.5254 204.139C78.7725 204.139 80.0652 202.235 80.0652 198.909C80.0652 195.608 78.7527 193.679 76.5254 193.679C74.2981 193.679 72.9856 195.608 72.9856 198.909C72.9856 202.235 74.2782 204.139 76.5254 204.139ZM76.5254 203.045C75.0439 203.045 74.1788 201.559 74.1788 198.909C74.1788 196.264 75.0538 194.753 76.5254 194.753C77.997 194.753 78.872 196.264 78.872 198.909C78.872 201.559 78.0069 203.045 76.5254 203.045ZM82.4739 204.08C82.9661 204.08 83.3688 203.677 83.3688 203.185C83.3688 202.692 82.9661 202.29 82.4739 202.29C81.9817 202.29 81.579 202.692 81.579 203.185C81.579 203.677 81.9817 204.08 82.4739 204.08ZM88.4199 204.139C90.6671 204.139 91.9597 202.235 91.9597 198.909C91.9597 195.608 90.6472 193.679 88.4199 193.679C86.1926 193.679 84.8801 195.608 84.8801 198.909C84.8801 202.235 86.1728 204.139 88.4199 204.139ZM88.4199 203.045C86.9384 203.045 86.0733 201.559 86.0733 198.909C86.0733 196.264 86.9483 194.753 88.4199 194.753C89.8915 194.753 90.7665 196.264 90.7665 198.909C90.7665 201.559 89.9015 203.045 88.4199 203.045ZM97.1699 204.139C99.4171 204.139 100.71 202.235 100.71 198.909C100.71 195.608 99.3972 193.679 97.1699 193.679C94.9426 193.679 93.6301 195.608 93.6301 198.909C93.6301 202.235 94.9228 204.139 97.1699 204.139ZM97.1699 203.045C95.6884 203.045 94.8233 201.559 94.8233 198.909C94.8233 196.264 95.6983 194.753 97.1699 194.753C98.6415 194.753 99.5165 196.264 99.5165 198.909C99.5165 201.559 98.6515 203.045 97.1699 203.045ZM105.92 204.139C108.167 204.139 109.46 202.235 109.46 198.909C109.46 195.608 108.147 193.679 105.92 193.679C103.693 193.679 102.38 195.608 102.38 198.909C102.38 202.235 103.673 204.139 105.92 204.139ZM105.92 203.045C104.438 203.045 103.573 201.559 103.573 198.909C103.573 196.264 104.448 194.753 105.92 194.753C107.392 194.753 108.267 196.264 108.267 198.909C108.267 201.559 107.401 203.045 105.92 203.045Z" fill="black"/>
<path d="M38.233 254H39.4659V250.023H41.6932C41.7827 250.023 41.8672 250.023 41.9517 250.018L44.0994 254H45.5312L43.2294 249.794C44.527 249.352 45.1335 248.293 45.1335 246.94C45.1335 245.141 44.0597 243.818 41.6733 243.818H38.233V254ZM39.4659 248.909V244.912H41.6335C43.2841 244.912 43.9205 245.717 43.9205 246.94C43.9205 248.163 43.2841 248.909 41.6534 248.909H39.4659ZM47.0289 256.864H48.2022V252.827H48.3017C48.5602 253.244 49.0574 254.159 50.5289 254.159C52.438 254.159 53.7704 252.628 53.7704 250.202C53.7704 247.795 52.438 246.264 50.5091 246.264C49.0176 246.264 48.5602 247.179 48.3017 247.577H48.1625V246.364H47.0289V256.864ZM48.1824 250.182C48.1824 248.472 48.938 247.318 50.3699 247.318C51.8613 247.318 52.5971 248.571 52.5971 250.182C52.5971 251.812 51.8414 253.105 50.3699 253.105C48.9579 253.105 48.1824 251.912 48.1824 250.182ZM58.9806 254.139C60.9544 254.139 62.421 252.901 62.421 251.236C62.421 249.943 61.6554 249.004 60.3727 248.79V248.71C61.4018 248.397 62.0431 247.552 62.0431 246.403C62.0431 244.962 60.9047 243.679 59.0204 243.679C57.2605 243.679 55.7988 244.763 55.7392 246.364H56.9324C56.9771 245.349 57.9416 244.753 59.0005 244.753C60.1241 244.753 60.85 245.434 60.85 246.463C60.85 247.537 60.0098 248.233 58.8017 248.233H57.9863V249.327H58.8017C60.3478 249.327 61.2079 250.112 61.2079 251.236C61.2079 252.315 60.2683 253.045 58.9608 253.045C57.7825 253.045 56.8478 252.439 56.7733 251.455H55.5204C55.595 253.055 57.0069 254.139 58.9806 254.139ZM67.7754 254.139C70.0225 254.139 71.3152 252.235 71.3152 248.909C71.3152 245.608 70.0027 243.679 67.7754 243.679C65.5481 243.679 64.2356 245.608 64.2356 248.909C64.2356 252.235 65.5282 254.139 67.7754 254.139ZM67.7754 253.045C66.2939 253.045 65.4288 251.559 65.4288 248.909C65.4288 246.264 66.3038 244.753 67.7754 244.753C69.247 244.753 70.122 246.264 70.122 248.909C70.122 251.559 69.2569 253.045 67.7754 253.045ZM76.5254 254.139C78.7725 254.139 80.0652 252.235 80.0652 248.909C80.0652 245.608 78.7527 243.679 76.5254 243.679C74.2981 243.679 72.9856 245.608 72.9856 248.909C72.9856 252.235 74.2782 254.139 76.5254 254.139ZM76.5254 253.045C75.0439 253.045 74.1788 251.559 74.1788 248.909C74.1788 246.264 75.0538 244.753 76.5254 244.753C77.997 244.753 78.872 246.264 78.872 248.909C78.872 251.559 78.0069 253.045 76.5254 253.045ZM82.4739 254.08C82.9661 254.08 83.3688 253.677 83.3688 253.185C83.3688 252.692 82.9661 252.29 82.4739 252.29C81.9817 252.29 81.579 252.692 81.579 253.185C81.579 253.677 81.9817 254.08 82.4739 254.08ZM88.4199 254.139C90.6671 254.139 91.9597 252.235 91.9597 248.909C91.9597 245.608 90.6472 243.679 88.4199 243.679C86.1926 243.679 84.8801 245.608 84.8801 248.909C84.8801 252.235 86.1728 254.139 88.4199 254.139ZM88.4199 253.045C86.9384 253.045 86.0733 251.559 86.0733 248.909C86.0733 246.264 86.9483 244.753 88.4199 244.753C89.8915 244.753 90.7665 246.264 90.7665 248.909C90.7665 251.559 89.9015 253.045 88.4199 253.045ZM97.1699 254.139C99.4171 254.139 100.71 252.235 100.71 248.909C100.71 245.608 99.3972 243.679 97.1699 243.679C94.9426 243.679 93.6301 245.608 93.6301 248.909C93.6301 252.235 94.9228 254.139 97.1699 254.139ZM97.1699 253.045C95.6884 253.045 94.8233 251.559 94.8233 248.909C94.8233 246.264 95.6983 244.753 97.1699 244.753C98.6415 244.753 99.5165 246.264 99.5165 248.909C99.5165 251.559 98.6515 253.045 97.1699 253.045ZM105.92 254.139C108.167 254.139 109.46 252.235 109.46 248.909C109.46 245.608 108.147 243.679 105.92 243.679C103.693 243.679 102.38 245.608 102.38 248.909C102.38 252.235 103.673 254.139 105.92 254.139ZM105.92 253.045C104.438 253.045 103.573 251.559 103.573 248.909C103.573 246.264 104.448 244.753 105.92 244.753C107.392 244.753 108.267 246.264 108.267 248.909C108.267 251.559 107.401 253.045 105.92 253.045Z" fill="black"/>
<path d="M38.233 299H39.4659V295.023H41.6932C41.7827 295.023 41.8672 295.023 41.9517 295.018L44.0994 299H45.5312L43.2294 294.794C44.527 294.352 45.1335 293.293 45.1335 291.94C45.1335 290.141 44.0597 288.818 41.6733 288.818H38.233V299ZM39.4659 293.909V289.912H41.6335C43.2841 289.912 43.9205 290.717 43.9205 291.94C43.9205 293.163 43.2841 293.909 41.6534 293.909H39.4659ZM47.0289 301.864H48.2022V297.827H48.3017C48.5602 298.244 49.0574 299.159 50.5289 299.159C52.438 299.159 53.7704 297.628 53.7704 295.202C53.7704 292.795 52.438 291.264 50.5091 291.264C49.0176 291.264 48.5602 292.179 48.3017 292.577H48.1625V291.364H47.0289V301.864ZM48.1824 295.182C48.1824 293.472 48.938 292.318 50.3699 292.318C51.8613 292.318 52.5971 293.571 52.5971 295.182C52.5971 296.812 51.8414 298.105 50.3699 298.105C48.9579 298.105 48.1824 296.912 48.1824 295.182ZM58.9806 299.139C60.9544 299.139 62.421 297.901 62.421 296.236C62.421 294.943 61.6554 294.004 60.3727 293.79V293.71C61.4018 293.397 62.0431 292.552 62.0431 291.403C62.0431 289.962 60.9047 288.679 59.0204 288.679C57.2605 288.679 55.7988 289.763 55.7392 291.364H56.9324C56.9771 290.349 57.9416 289.753 59.0005 289.753C60.1241 289.753 60.85 290.434 60.85 291.463C60.85 292.537 60.0098 293.233 58.8017 293.233H57.9863V294.327H58.8017C60.3478 294.327 61.2079 295.112 61.2079 296.236C61.2079 297.315 60.2683 298.045 58.9608 298.045C57.7825 298.045 56.8478 297.439 56.7733 296.455H55.5204C55.595 298.055 57.0069 299.139 58.9806 299.139ZM67.7754 299.139C70.0225 299.139 71.3152 297.235 71.3152 293.909C71.3152 290.608 70.0027 288.679 67.7754 288.679C65.5481 288.679 64.2356 290.608 64.2356 293.909C64.2356 297.235 65.5282 299.139 67.7754 299.139ZM67.7754 298.045C66.2939 298.045 65.4288 296.559 65.4288 293.909C65.4288 291.264 66.3038 289.753 67.7754 289.753C69.247 289.753 70.122 291.264 70.122 293.909C70.122 296.559 69.2569 298.045 67.7754 298.045ZM76.5254 299.139C78.7725 299.139 80.0652 297.235 80.0652 293.909C80.0652 290.608 78.7527 288.679 76.5254 288.679C74.2981 288.679 72.9856 290.608 72.9856 293.909C72.9856 297.235 74.2782 299.139 76.5254 299.139ZM76.5254 298.045C75.0439 298.045 74.1788 296.559 74.1788 293.909C74.1788 291.264 75.0538 289.753 76.5254 289.753C77.997 289.753 78.872 291.264 78.872 293.909C78.872 296.559 78.0069 298.045 76.5254 298.045ZM82.4739 299.08C82.9661 299.08 83.3688 298.677 83.3688 298.185C83.3688 297.692 82.9661 297.29 82.4739 297.29C81.9817 297.29 81.579 297.692 81.579 298.185C81.579 298.677 81.9817 299.08 82.4739 299.08ZM88.4199 299.139C90.6671 299.139 91.9597 297.235 91.9597 293.909C91.9597 290.608 90.6472 288.679 88.4199 288.679C86.1926 288.679 84.8801 290.608 84.8801 293.909C84.8801 297.235 86.1728 299.139 88.4199 299.139ZM88.4199 298.045C86.9384 298.045 86.0733 296.559 86.0733 293.909C86.0733 291.264 86.9483 289.753 88.4199 289.753C89.8915 289.753 90.7665 291.264 90.7665 293.909C90.7665 296.559 89.9015 298.045 88.4199 298.045ZM97.1699 299.139C99.4171 299.139 100.71 297.235 100.71 293.909C100.71 290.608 99.3972 288.679 97.1699 288.679C94.9426 288.679 93.6301 290.608 93.6301 293.909C93.6301 297.235 94.9228 299.139 97.1699 299.139ZM97.1699 298.045C95.6884 298.045 94.8233 296.559 94.8233 293.909C94.8233 291.264 95.6983 289.753 97.1699 289.753C98.6415 289.753 99.5165 291.264 99.5165 293.909C99.5165 296.559 98.6515 298.045 97.1699 298.045ZM105.92 299.139C108.167 299.139 109.46 297.235 109.46 293.909C109.46 290.608 108.147 288.679 105.92 288.679C103.693 288.679 102.38 290.608 102.38 293.909C102.38 297.235 103.673 299.139 105.92 299.139ZM105.92 298.045C104.438 298.045 103.573 296.559 103.573 293.909C103.573 291.264 104.448 289.753 105.92 289.753C107.392 289.753 108.267 291.264 108.267 293.909C108.267 296.559 107.401 298.045 105.92 298.045Z" fill="black"/>
<rect x="230" y="90" width="120" height="29" rx="14.5" fill="#F2F2F2"/>
<path d="M255.233 110H256.466V106.023H258.693C258.783 106.023 258.867 106.023 258.952 106.018L261.099 110H262.531L260.229 105.794C261.527 105.352 262.134 104.293 262.134 102.94C262.134 101.141 261.06 99.8182 258.673 99.8182H255.233V110ZM256.466 104.909V100.912H258.634C260.284 100.912 260.92 101.717 260.92 102.94C260.92 104.163 260.284 104.909 258.653 104.909H256.466ZM264.029 112.864H265.202V108.827H265.302C265.56 109.244 266.057 110.159 267.529 110.159C269.438 110.159 270.77 108.628 270.77 106.202C270.77 103.795 269.438 102.264 267.509 102.264C266.018 102.264 265.56 103.179 265.302 103.577H265.162V102.364H264.029V112.864ZM265.182 106.182C265.182 104.472 265.938 103.318 267.37 103.318C268.861 103.318 269.597 104.571 269.597 106.182C269.597 107.812 268.841 109.105 267.37 109.105C265.958 109.105 265.182 107.912 265.182 106.182ZM272.858 110H274.151L278.685 100.972V99.8182H272.162V100.912H277.412V100.991L272.858 110ZM283.641 110.139C285.888 110.139 287.18 108.235 287.18 104.909C287.18 101.608 285.868 99.679 283.641 99.679C281.413 99.679 280.101 101.608 280.101 104.909C280.101 108.235 281.393 110.139 283.641 110.139ZM283.641 109.045C282.159 109.045 281.294 107.559 281.294 104.909C281.294 102.264 282.169 100.753 283.641 100.753C285.112 100.753 285.987 102.264 285.987 104.909C285.987 107.559 285.122 109.045 283.641 109.045ZM292.391 110.139C294.638 110.139 295.93 108.235 295.93 104.909C295.93 101.608 294.618 99.679 292.391 99.679C290.163 99.679 288.851 101.608 288.851 104.909C288.851 108.235 290.143 110.139 292.391 110.139ZM292.391 109.045C290.909 109.045 290.044 107.559 290.044 104.909C290.044 102.264 290.919 100.753 292.391 100.753C293.862 100.753 294.737 102.264 294.737 104.909C294.737 107.559 293.872 109.045 292.391 109.045ZM298.339 110.08C298.831 110.08 299.234 109.677 299.234 109.185C299.234 108.692 298.831 108.29 298.339 108.29C297.847 108.29 297.444 108.692 297.444 109.185C297.444 109.677 297.847 110.08 298.339 110.08ZM304.285 110.139C306.532 110.139 307.825 108.235 307.825 104.909C307.825 101.608 306.512 99.679 304.285 99.679C302.058 99.679 300.745 101.608 300.745 104.909C300.745 108.235 302.038 110.139 304.285 110.139ZM304.285 109.045C302.804 109.045 301.939 107.559 301.939 104.909C301.939 102.264 302.814 100.753 304.285 100.753C305.757 100.753 306.632 102.264 306.632 104.909C306.632 107.559 305.767 109.045 304.285 109.045ZM313.035 110.139C315.282 110.139 316.575 108.235 316.575 104.909C316.575 101.608 315.262 99.679 313.035 99.679C310.808 99.679 309.495 101.608 309.495 104.909C309.495 108.235 310.788 110.139 313.035 110.139ZM313.035 109.045C311.554 109.045 310.689 107.559 310.689 104.909C310.689 102.264 311.564 100.753 313.035 100.753C314.507 100.753 315.382 102.264 315.382 104.909C315.382 107.559 314.517 109.045 313.035 109.045ZM321.785 110.139C324.032 110.139 325.325 108.235 325.325 104.909C325.325 101.608 324.012 99.679 321.785 99.679C319.558 99.679 318.245 101.608 318.245 104.909C318.245 108.235 319.538 110.139 321.785 110.139ZM321.785 109.045C320.304 109.045 319.439 107.559 319.439 104.909C319.439 102.264 320.314 100.753 321.785 100.753C323.257 100.753 324.132 102.264 324.132 104.909C324.132 107.559 323.267 109.045 321.785 109.045Z" fill="black"/>
<path d="M255.233 155H256.466V151.023H258.693C258.783 151.023 258.867 151.023 258.952 151.018L261.099 155H262.531L260.229 150.794C261.527 150.352 262.134 149.293 262.134 147.94C262.134 146.141 261.06 144.818 258.673 144.818H255.233V155ZM256.466 149.909V145.912H258.634C260.284 145.912 260.92 146.717 260.92 147.94C260.92 149.163 260.284 149.909 258.653 149.909H256.466ZM264.029 157.864H265.202V153.827H265.302C265.56 154.244 266.057 155.159 267.529 155.159C269.438 155.159 270.77 153.628 270.77 151.202C270.77 148.795 269.438 147.264 267.509 147.264C266.018 147.264 265.56 148.179 265.302 148.577H265.162V147.364H264.029V157.864ZM265.182 151.182C265.182 149.472 265.938 148.318 267.37 148.318C268.861 148.318 269.597 149.571 269.597 151.182C269.597 152.812 268.841 154.105 267.37 154.105C265.958 154.105 265.182 152.912 265.182 151.182ZM272.858 155H274.151L278.685 145.972V144.818H272.162V145.912H277.412V145.991L272.858 155ZM283.641 155.139C285.888 155.139 287.18 153.235 287.18 149.909C287.18 146.608 285.868 144.679 283.641 144.679C281.413 144.679 280.101 146.608 280.101 149.909C280.101 153.235 281.393 155.139 283.641 155.139ZM283.641 154.045C282.159 154.045 281.294 152.559 281.294 149.909C281.294 147.264 282.169 145.753 283.641 145.753C285.112 145.753 285.987 147.264 285.987 149.909C285.987 152.559 285.122 154.045 283.641 154.045ZM292.391 155.139C294.638 155.139 295.93 153.235 295.93 149.909C295.93 146.608 294.618 144.679 292.391 144.679C290.163 144.679 288.851 146.608 288.851 149.909C288.851 153.235 290.143 155.139 292.391 155.139ZM292.391 154.045C290.909 154.045 290.044 152.559 290.044 149.909C290.044 147.264 290.919 145.753 292.391 145.753C293.862 145.753 294.737 147.264 294.737 149.909C294.737 152.559 293.872 154.045 292.391 154.045ZM298.339 155.08C298.831 155.08 299.234 154.677 299.234 154.185C299.234 153.692 298.831 153.29 298.339 153.29C297.847 153.29 297.444 153.692 297.444 154.185C297.444 154.677 297.847 155.08 298.339 155.08ZM304.285 155.139C306.532 155.139 307.825 153.235 307.825 149.909C307.825 146.608 306.512 144.679 304.285 144.679C302.058 144.679 300.745 146.608 300.745 149.909C300.745 153.235 302.038 155.139 304.285 155.139ZM304.285 154.045C302.804 154.045 301.939 152.559 301.939 149.909C301.939 147.264 302.814 145.753 304.285 145.753C305.757 145.753 306.632 147.264 306.632 149.909C306.632 152.559 305.767 154.045 304.285 154.045ZM313.035 155.139C315.282 155.139 316.575 153.235 316.575 149.909C316.575 146.608 315.262 144.679 313.035 144.679C310.808 144.679 309.495 146.608 309.495 149.909C309.495 153.235 310.788 155.139 313.035 155.139ZM313.035 154.045C311.554 154.045 310.689 152.559 310.689 149.909C310.689 147.264 311.564 145.753 313.035 145.753C314.507 145.753 315.382 147.264 315.382 149.909C315.382 152.559 314.517 154.045 313.035 154.045ZM321.785 155.139C324.032 155.139 325.325 153.235 325.325 149.909C325.325 146.608 324.012 144.679 321.785 144.679C319.558 144.679 318.245 146.608 318.245 149.909C318.245 153.235 319.538 155.139 321.785 155.139ZM321.785 154.045C320.304 154.045 319.439 152.559 319.439 149.909C319.439 147.264 320.314 145.753 321.785 145.753C323.257 145.753 324.132 147.264 324.132 149.909C324.132 152.559 323.267 154.045 321.785 154.045Z" fill="black"/>
<path d="M38.233 110H39.4659V106.023H41.6932C41.7827 106.023 41.8672 106.023 41.9517 106.018L44.0994 110H45.5312L43.2294 105.794C44.527 105.352 45.1335 104.293 45.1335 102.94C45.1335 101.141 44.0597 99.8182 41.6733 99.8182H38.233V110ZM39.4659 104.909V100.912H41.6335C43.2841 100.912 43.9205 101.717 43.9205 102.94C43.9205 104.163 43.2841 104.909 41.6534 104.909H39.4659ZM47.0289 112.864H48.2022V108.827H48.3017C48.5602 109.244 49.0574 110.159 50.5289 110.159C52.438 110.159 53.7704 108.628 53.7704 106.202C53.7704 103.795 52.438 102.264 50.5091 102.264C49.0176 102.264 48.5602 103.179 48.3017 103.577H48.1625V102.364H47.0289V112.864ZM48.1824 106.182C48.1824 104.472 48.938 103.318 50.3699 103.318C51.8613 103.318 52.5971 104.571 52.5971 106.182C52.5971 107.812 51.8414 109.105 50.3699 109.105C48.9579 109.105 48.1824 107.912 48.1824 106.182ZM58.9806 110.139C60.9544 110.139 62.421 108.901 62.421 107.236C62.421 105.943 61.6554 105.004 60.3727 104.79V104.71C61.4018 104.397 62.0431 103.552 62.0431 102.403C62.0431 100.962 60.9047 99.679 59.0204 99.679C57.2605 99.679 55.7988 100.763 55.7392 102.364H56.9324C56.9771 101.349 57.9416 100.753 59.0005 100.753C60.1241 100.753 60.85 101.434 60.85 102.463C60.85 103.537 60.0098 104.233 58.8017 104.233H57.9863V105.327H58.8017C60.3478 105.327 61.2079 106.112 61.2079 107.236C61.2079 108.315 60.2683 109.045 58.9608 109.045C57.7825 109.045 56.8478 108.439 56.7733 107.455H55.5204C55.595 109.055 57.0069 110.139 58.9806 110.139ZM67.7754 110.139C70.0225 110.139 71.3152 108.235 71.3152 104.909C71.3152 101.608 70.0027 99.679 67.7754 99.679C65.5481 99.679 64.2356 101.608 64.2356 104.909C64.2356 108.235 65.5282 110.139 67.7754 110.139ZM67.7754 109.045C66.2939 109.045 65.4288 107.559 65.4288 104.909C65.4288 102.264 66.3038 100.753 67.7754 100.753C69.247 100.753 70.122 102.264 70.122 104.909C70.122 107.559 69.2569 109.045 67.7754 109.045ZM76.5254 110.139C78.7725 110.139 80.0652 108.235 80.0652 104.909C80.0652 101.608 78.7527 99.679 76.5254 99.679C74.2981 99.679 72.9856 101.608 72.9856 104.909C72.9856 108.235 74.2782 110.139 76.5254 110.139ZM76.5254 109.045C75.0439 109.045 74.1788 107.559 74.1788 104.909C74.1788 102.264 75.0538 100.753 76.5254 100.753C77.997 100.753 78.872 102.264 78.872 104.909C78.872 107.559 78.0069 109.045 76.5254 109.045ZM82.4739 110.08C82.9661 110.08 83.3688 109.677 83.3688 109.185C83.3688 108.692 82.9661 108.29 82.4739 108.29C81.9817 108.29 81.579 108.692 81.579 109.185C81.579 109.677 81.9817 110.08 82.4739 110.08ZM88.4199 110.139C90.6671 110.139 91.9597 108.235 91.9597 104.909C91.9597 101.608 90.6472 99.679 88.4199 99.679C86.1926 99.679 84.8801 101.608 84.8801 104.909C84.8801 108.235 86.1728 110.139 88.4199 110.139ZM88.4199 109.045C86.9384 109.045 86.0733 107.559 86.0733 104.909C86.0733 102.264 86.9483 100.753 88.4199 100.753C89.8915 100.753 90.7665 102.264 90.7665 104.909C90.7665 107.559 89.9015 109.045 88.4199 109.045ZM97.1699 110.139C99.4171 110.139 100.71 108.235 100.71 104.909C100.71 101.608 99.3972 99.679 97.1699 99.679C94.9426 99.679 93.6301 101.608 93.6301 104.909C93.6301 108.235 94.9228 110.139 97.1699 110.139ZM97.1699 109.045C95.6884 109.045 94.8233 107.559 94.8233 104.909C94.8233 102.264 95.6983 100.753 97.1699 100.753C98.6415 100.753 99.5165 102.264 99.5165 104.909C99.5165 107.559 98.6515 109.045 97.1699 109.045ZM105.92 110.139C108.167 110.139 109.46 108.235 109.46 104.909C109.46 101.608 108.147 99.679 105.92 99.679C103.693 99.679 102.38 101.608 102.38 104.909C102.38 108.235 103.673 110.139 105.92 110.139ZM105.92 109.045C104.438 109.045 103.573 107.559 103.573 104.909C103.573 102.264 104.448 100.753 105.92 100.753C107.392 100.753 108.267 102.264 108.267 104.909C108.267 107.559 107.401 109.045 105.92 109.045Z" fill="black"/>
<path d="M38.233 155H39.4659V151.023H41.6932C41.7827 151.023 41.8672 151.023 41.9517 151.018L44.0994 155H45.5312L43.2294 150.794C44.527 150.352 45.1335 149.293 45.1335 147.94C45.1335 146.141 44.0597 144.818 41.6733 144.818H38.233V155ZM39.4659 149.909V145.912H41.6335C43.2841 145.912 43.9205 146.717 43.9205 147.94C43.9205 149.163 43.2841 149.909 41.6534 149.909H39.4659ZM47.0289 157.864H48.2022V153.827H48.3017C48.5602 154.244 49.0574 155.159 50.5289 155.159C52.438 155.159 53.7704 153.628 53.7704 151.202C53.7704 148.795 52.438 147.264 50.5091 147.264C49.0176 147.264 48.5602 148.179 48.3017 148.577H48.1625V147.364H47.0289V157.864ZM48.1824 151.182C48.1824 149.472 48.938 148.318 50.3699 148.318C51.8613 148.318 52.5971 149.571 52.5971 151.182C52.5971 152.812 51.8414 154.105 50.3699 154.105C48.9579 154.105 48.1824 152.912 48.1824 151.182ZM58.9806 155.139C60.9544 155.139 62.421 153.901 62.421 152.236C62.421 150.943 61.6554 150.004 60.3727 149.79V149.71C61.4018 149.397 62.0431 148.552 62.0431 147.403C62.0431 145.962 60.9047 144.679 59.0204 144.679C57.2605 144.679 55.7988 145.763 55.7392 147.364H56.9324C56.9771 146.349 57.9416 145.753 59.0005 145.753C60.1241 145.753 60.85 146.434 60.85 147.463C60.85 148.537 60.0098 149.233 58.8017 149.233H57.9863V150.327H58.8017C60.3478 150.327 61.2079 151.112 61.2079 152.236C61.2079 153.315 60.2683 154.045 58.9608 154.045C57.7825 154.045 56.8478 153.439 56.7733 152.455H55.5204C55.595 154.055 57.0069 155.139 58.9806 155.139ZM67.7754 155.139C70.0225 155.139 71.3152 153.235 71.3152 149.909C71.3152 146.608 70.0027 144.679 67.7754 144.679C65.5481 144.679 64.2356 146.608 64.2356 149.909C64.2356 153.235 65.5282 155.139 67.7754 155.139ZM67.7754 154.045C66.2939 154.045 65.4288 152.559 65.4288 149.909C65.4288 147.264 66.3038 145.753 67.7754 145.753C69.247 145.753 70.122 147.264 70.122 149.909C70.122 152.559 69.2569 154.045 67.7754 154.045ZM76.5254 155.139C78.7725 155.139 80.0652 153.235 80.0652 149.909C80.0652 146.608 78.7527 144.679 76.5254 144.679C74.2981 144.679 72.9856 146.608 72.9856 149.909C72.9856 153.235 74.2782 155.139 76.5254 155.139ZM76.5254 154.045C75.0439 154.045 74.1788 152.559 74.1788 149.909C74.1788 147.264 75.0538 145.753 76.5254 145.753C77.997 145.753 78.872 147.264 78.872 149.909C78.872 152.559 78.0069 154.045 76.5254 154.045ZM82.4739 155.08C82.9661 155.08 83.3688 154.677 83.3688 154.185C83.3688 153.692 82.9661 153.29 82.4739 153.29C81.9817 153.29 81.579 153.692 81.579 154.185C81.579 154.677 81.9817 155.08 82.4739 155.08ZM88.4199 155.139C90.6671 155.139 91.9597 153.235 91.9597 149.909C91.9597 146.608 90.6472 144.679 88.4199 144.679C86.1926 144.679 84.8801 146.608 84.8801 149.909C84.8801 153.235 86.1728 155.139 88.4199 155.139ZM88.4199 154.045C86.9384 154.045 86.0733 152.559 86.0733 149.909C86.0733 147.264 86.9483 145.753 88.4199 145.753C89.8915 145.753 90.7665 147.264 90.7665 149.909C90.7665 152.559 89.9015 154.045 88.4199 154.045ZM97.1699 155.139C99.4171 155.139 100.71 153.235 100.71 149.909C100.71 146.608 99.3972 144.679 97.1699 144.679C94.9426 144.679 93.6301 146.608 93.6301 149.909C93.6301 153.235 94.9228 155.139 97.1699 155.139ZM97.1699 154.045C95.6884 154.045 94.8233 152.559 94.8233 149.909C94.8233 147.264 95.6983 145.753 97.1699 145.753C98.6415 145.753 99.5165 147.264 99.5165 149.909C99.5165 152.559 98.6515 154.045 97.1699 154.045ZM105.92 155.139C108.167 155.139 109.46 153.235 109.46 149.909C109.46 146.608 108.147 144.679 105.92 144.679C103.693 144.679 102.38 146.608 102.38 149.909C102.38 153.235 103.673 155.139 105.92 155.139ZM105.92 154.045C104.438 154.045 103.573 152.559 103.573 149.909C103.573 147.264 104.448 145.753 105.92 145.753C107.392 145.753 108.267 147.264 108.267 149.909C108.267 152.559 107.401 154.045 105.92 154.045Z" fill="black"/>
<rect x="230" y="90" width="120" height="29" rx="14.5" fill="#F2F2F2"/>
<path d="M255.233 110H256.466V106.023H258.693C258.783 106.023 258.867 106.023 258.952 106.018L261.099 110H262.531L260.229 105.794C261.527 105.352 262.134 104.293 262.134 102.94C262.134 101.141 261.06 99.8182 258.673 99.8182H255.233V110ZM256.466 104.909V100.912H258.634C260.284 100.912 260.92 101.717 260.92 102.94C260.92 104.163 260.284 104.909 258.653 104.909H256.466ZM264.029 112.864H265.202V108.827H265.302C265.56 109.244 266.057 110.159 267.529 110.159C269.438 110.159 270.77 108.628 270.77 106.202C270.77 103.795 269.438 102.264 267.509 102.264C266.018 102.264 265.56 103.179 265.302 103.577H265.162V102.364H264.029V112.864ZM265.182 106.182C265.182 104.472 265.938 103.318 267.37 103.318C268.861 103.318 269.597 104.571 269.597 106.182C269.597 107.812 268.841 109.105 267.37 109.105C265.958 109.105 265.182 107.912 265.182 106.182ZM272.858 110H274.151L278.685 100.972V99.8182H272.162V100.912H277.412V100.991L272.858 110ZM283.641 110.139C285.888 110.139 287.18 108.235 287.18 104.909C287.18 101.608 285.868 99.679 283.641 99.679C281.413 99.679 280.101 101.608 280.101 104.909C280.101 108.235 281.393 110.139 283.641 110.139ZM283.641 109.045C282.159 109.045 281.294 107.559 281.294 104.909C281.294 102.264 282.169 100.753 283.641 100.753C285.112 100.753 285.987 102.264 285.987 104.909C285.987 107.559 285.122 109.045 283.641 109.045ZM292.391 110.139C294.638 110.139 295.93 108.235 295.93 104.909C295.93 101.608 294.618 99.679 292.391 99.679C290.163 99.679 288.851 101.608 288.851 104.909C288.851 108.235 290.143 110.139 292.391 110.139ZM292.391 109.045C290.909 109.045 290.044 107.559 290.044 104.909C290.044 102.264 290.919 100.753 292.391 100.753C293.862 100.753 294.737 102.264 294.737 104.909C294.737 107.559 293.872 109.045 292.391 109.045ZM298.339 110.08C298.831 110.08 299.234 109.677 299.234 109.185C299.234 108.692 298.831 108.29 298.339 108.29C297.847 108.29 297.444 108.692 297.444 109.185C297.444 109.677 297.847 110.08 298.339 110.08ZM304.285 110.139C306.532 110.139 307.825 108.235 307.825 104.909C307.825 101.608 306.512 99.679 304.285 99.679C302.058 99.679 300.745 101.608 300.745 104.909C300.745 108.235 302.038 110.139 304.285 110.139ZM304.285 109.045C302.804 109.045 301.939 107.559 301.939 104.909C301.939 102.264 302.814 100.753 304.285 100.753C305.757 100.753 306.632 102.264 306.632 104.909C306.632 107.559 305.767 109.045 304.285 109.045ZM313.035 110.139C315.282 110.139 316.575 108.235 316.575 104.909C316.575 101.608 315.262 99.679 313.035 99.679C310.808 99.679 309.495 101.608 309.495 104.909C309.495 108.235 310.788 110.139 313.035 110.139ZM313.035 109.045C311.554 109.045 310.689 107.559 310.689 104.909C310.689 102.264 311.564 100.753 313.035 100.753C314.507 100.753 315.382 102.264 315.382 104.909C315.382 107.559 314.517 109.045 313.035 109.045ZM321.785 110.139C324.032 110.139 325.325 108.235 325.325 104.909C325.325 101.608 324.012 99.679 321.785 99.679C319.558 99.679 318.245 101.608 318.245 104.909C318.245 108.235 319.538 110.139 321.785 110.139ZM321.785 109.045C320.304 109.045 319.439 107.559 319.439 104.909C319.439 102.264 320.314 100.753 321.785 100.753C323.257 100.753 324.132 102.264 324.132 104.909C324.132 107.559 323.267 109.045 321.785 109.045Z" fill="black"/>
<path d="M255.233 155H256.466V151.023H258.693C258.783 151.023 258.867 151.023 258.952 151.018L261.099 155H262.531L260.229 150.794C261.527 150.352 262.134 149.293 262.134 147.94C262.134 146.141 261.06 144.818 258.673 144.818H255.233V155ZM256.466 149.909V145.912H258.634C260.284 145.912 260.92 146.717 260.92 147.94C260.92 149.163 260.284 149.909 258.653 149.909H256.466ZM264.029 157.864H265.202V153.827H265.302C265.56 154.244 266.057 155.159 267.529 155.159C269.438 155.159 270.77 153.628 270.77 151.202C270.77 148.795 269.438 147.264 267.509 147.264C266.018 147.264 265.56 148.179 265.302 148.577H265.162V147.364H264.029V157.864ZM265.182 151.182C265.182 149.472 265.938 148.318 267.37 148.318C268.861 148.318 269.597 149.571 269.597 151.182C269.597 152.812 268.841 154.105 267.37 154.105C265.958 154.105 265.182 152.912 265.182 151.182ZM272.858 155H274.151L278.685 145.972V144.818H272.162V145.912H277.412V145.991L272.858 155ZM283.641 155.139C285.888 155.139 287.18 153.235 287.18 149.909C287.18 146.608 285.868 144.679 283.641 144.679C281.413 144.679 280.101 146.608 280.101 149.909C280.101 153.235 281.393 155.139 283.641 155.139ZM283.641 154.045C282.159 154.045 281.294 152.559 281.294 149.909C281.294 147.264 282.169 145.753 283.641 145.753C285.112 145.753 285.987 147.264 285.987 149.909C285.987 152.559 285.122 154.045 283.641 154.045ZM292.391 155.139C294.638 155.139 295.93 153.235 295.93 149.909C295.93 146.608 294.618 144.679 292.391 144.679C290.163 144.679 288.851 146.608 288.851 149.909C288.851 153.235 290.143 155.139 292.391 155.139ZM292.391 154.045C290.909 154.045 290.044 152.559 290.044 149.909C290.044 147.264 290.919 145.753 292.391 145.753C293.862 145.753 294.737 147.264 294.737 149.909C294.737 152.559 293.872 154.045 292.391 154.045ZM298.339 155.08C298.831 155.08 299.234 154.677 299.234 154.185C299.234 153.692 298.831 153.29 298.339 153.29C297.847 153.29 297.444 153.692 297.444 154.185C297.444 154.677 297.847 155.08 298.339 155.08ZM304.285 155.139C306.532 155.139 307.825 153.235 307.825 149.909C307.825 146.608 306.512 144.679 304.285 144.679C302.058 144.679 300.745 146.608 300.745 149.909C300.745 153.235 302.038 155.139 304.285 155.139ZM304.285 154.045C302.804 154.045 301.939 152.559 301.939 149.909C301.939 147.264 302.814 145.753 304.285 145.753C305.757 145.753 306.632 147.264 306.632 149.909C306.632 152.559 305.767 154.045 304.285 154.045ZM313.035 155.139C315.282 155.139 316.575 153.235 316.575 149.909C316.575 146.608 315.262 144.679 313.035 144.679C310.808 144.679 309.495 146.608 309.495 149.909C309.495 153.235 310.788 155.139 313.035 155.139ZM313.035 154.045C311.554 154.045 310.689 152.559 310.689 149.909C310.689 147.264 311.564 145.753 313.035 145.753C314.507 145.753 315.382 147.264 315.382 149.909C315.382 152.559 314.517 154.045 313.035 154.045ZM321.785 155.139C324.032 155.139 325.325 153.235 325.325 149.909C325.325 146.608 324.012 144.679 321.785 144.679C319.558 144.679 318.245 146.608 318.245 149.909C318.245 153.235 319.538 155.139 321.785 155.139ZM321.785 154.045C320.304 154.045 319.439 152.559 319.439 149.909C319.439 147.264 320.314 145.753 321.785 145.753C323.257 145.753 324.132 147.264 324.132 149.909C324.132 152.559 323.267 154.045 321.785 154.045Z" fill="black"/>
<path d="M38.233 110H39.4659V106.023H41.6932C41.7827 106.023 41.8672 106.023 41.9517 106.018L44.0994 110H45.5312L43.2294 105.794C44.527 105.352 45.1335 104.293 45.1335 102.94C45.1335 101.141 44.0597 99.8182 41.6733 99.8182H38.233V110ZM39.4659 104.909V100.912H41.6335C43.2841 100.912 43.9205 101.717 43.9205 102.94C43.9205 104.163 43.2841 104.909 41.6534 104.909H39.4659ZM47.0289 112.864H48.2022V108.827H48.3017C48.5602 109.244 49.0574 110.159 50.5289 110.159C52.438 110.159 53.7704 108.628 53.7704 106.202C53.7704 103.795 52.438 102.264 50.5091 102.264C49.0176 102.264 48.5602 103.179 48.3017 103.577H48.1625V102.364H47.0289V112.864ZM48.1824 106.182C48.1824 104.472 48.938 103.318 50.3699 103.318C51.8613 103.318 52.5971 104.571 52.5971 106.182C52.5971 107.812 51.8414 109.105 50.3699 109.105C48.9579 109.105 48.1824 107.912 48.1824 106.182ZM58.9806 110.139C60.9544 110.139 62.421 108.901 62.421 107.236C62.421 105.943 61.6554 105.004 60.3727 104.79V104.71C61.4018 104.397 62.0431 103.552 62.0431 102.403C62.0431 100.962 60.9047 99.679 59.0204 99.679C57.2605 99.679 55.7988 100.763 55.7392 102.364H56.9324C56.9771 101.349 57.9416 100.753 59.0005 100.753C60.1241 100.753 60.85 101.434 60.85 102.463C60.85 103.537 60.0098 104.233 58.8017 104.233H57.9863V105.327H58.8017C60.3478 105.327 61.2079 106.112 61.2079 107.236C61.2079 108.315 60.2683 109.045 58.9608 109.045C57.7825 109.045 56.8478 108.439 56.7733 107.455H55.5204C55.595 109.055 57.0069 110.139 58.9806 110.139ZM67.7754 110.139C70.0225 110.139 71.3152 108.235 71.3152 104.909C71.3152 101.608 70.0027 99.679 67.7754 99.679C65.5481 99.679 64.2356 101.608 64.2356 104.909C64.2356 108.235 65.5282 110.139 67.7754 110.139ZM67.7754 109.045C66.2939 109.045 65.4288 107.559 65.4288 104.909C65.4288 102.264 66.3038 100.753 67.7754 100.753C69.247 100.753 70.122 102.264 70.122 104.909C70.122 107.559 69.2569 109.045 67.7754 109.045ZM76.5254 110.139C78.7725 110.139 80.0652 108.235 80.0652 104.909C80.0652 101.608 78.7527 99.679 76.5254 99.679C74.2981 99.679 72.9856 101.608 72.9856 104.909C72.9856 108.235 74.2782 110.139 76.5254 110.139ZM76.5254 109.045C75.0439 109.045 74.1788 107.559 74.1788 104.909C74.1788 102.264 75.0538 100.753 76.5254 100.753C77.997 100.753 78.872 102.264 78.872 104.909C78.872 107.559 78.0069 109.045 76.5254 109.045ZM82.4739 110.08C82.9661 110.08 83.3688 109.677 83.3688 109.185C83.3688 108.692 82.9661 108.29 82.4739 108.29C81.9817 108.29 81.579 108.692 81.579 109.185C81.579 109.677 81.9817 110.08 82.4739 110.08ZM88.4199 110.139C90.6671 110.139 91.9597 108.235 91.9597 104.909C91.9597 101.608 90.6472 99.679 88.4199 99.679C86.1926 99.679 84.8801 101.608 84.8801 104.909C84.8801 108.235 86.1728 110.139 88.4199 110.139ZM88.4199 109.045C86.9384 109.045 86.0733 107.559 86.0733 104.909C86.0733 102.264 86.9483 100.753 88.4199 100.753C89.8915 100.753 90.7665 102.264 90.7665 104.909C90.7665 107.559 89.9015 109.045 88.4199 109.045ZM97.1699 110.139C99.4171 110.139 100.71 108.235 100.71 104.909C100.71 101.608 99.3972 99.679 97.1699 99.679C94.9426 99.679 93.6301 101.608 93.6301 104.909C93.6301 108.235 94.9228 110.139 97.1699 110.139ZM97.1699 109.045C95.6884 109.045 94.8233 107.559 94.8233 104.909C94.8233 102.264 95.6983 100.753 97.1699 100.753C98.6415 100.753 99.5165 102.264 99.5165 104.909C99.5165 107.559 98.6515 109.045 97.1699 109.045ZM105.92 110.139C108.167 110.139 109.46 108.235 109.46 104.909C109.46 101.608 108.147 99.679 105.92 99.679C103.693 99.679 102.38 101.608 102.38 104.909C102.38 108.235 103.673 110.139 105.92 110.139ZM105.92 109.045C104.438 109.045 103.573 107.559 103.573 104.909C103.573 102.264 104.448 100.753 105.92 100.753C107.392 100.753 108.267 102.264 108.267 104.909C108.267 107.559 107.401 109.045 105.92 109.045Z" fill="black"/>
<path d="M38.233 155H39.4659V151.023H41.6932C41.7827 151.023 41.8672 151.023 41.9517 151.018L44.0994 155H45.5312L43.2294 150.794C44.527 150.352 45.1335 149.293 45.1335 147.94C45.1335 146.141 44.0597 144.818 41.6733 144.818H38.233V155ZM39.4659 149.909V145.912H41.6335C43.2841 145.912 43.9205 146.717 43.9205 147.94C43.9205 149.163 43.2841 149.909 41.6534 149.909H39.4659ZM47.0289 157.864H48.2022V153.827H48.3017C48.5602 154.244 49.0574 155.159 50.5289 155.159C52.438 155.159 53.7704 153.628 53.7704 151.202C53.7704 148.795 52.438 147.264 50.5091 147.264C49.0176 147.264 48.5602 148.179 48.3017 148.577H48.1625V147.364H47.0289V157.864ZM48.1824 151.182C48.1824 149.472 48.938 148.318 50.3699 148.318C51.8613 148.318 52.5971 149.571 52.5971 151.182C52.5971 152.812 51.8414 154.105 50.3699 154.105C48.9579 154.105 48.1824 152.912 48.1824 151.182ZM58.9806 155.139C60.9544 155.139 62.421 153.901 62.421 152.236C62.421 150.943 61.6554 150.004 60.3727 149.79V149.71C61.4018 149.397 62.0431 148.552 62.0431 147.403C62.0431 145.962 60.9047 144.679 59.0204 144.679C57.2605 144.679 55.7988 145.763 55.7392 147.364H56.9324C56.9771 146.349 57.9416 145.753 59.0005 145.753C60.1241 145.753 60.85 146.434 60.85 147.463C60.85 148.537 60.0098 149.233 58.8017 149.233H57.9863V150.327H58.8017C60.3478 150.327 61.2079 151.112 61.2079 152.236C61.2079 153.315 60.2683 154.045 58.9608 154.045C57.7825 154.045 56.8478 153.439 56.7733 152.455H55.5204C55.595 154.055 57.0069 155.139 58.9806 155.139ZM67.7754 155.139C70.0225 155.139 71.3152 153.235 71.3152 149.909C71.3152 146.608 70.0027 144.679 67.7754 144.679C65.5481 144.679 64.2356 146.608 64.2356 149.909C64.2356 153.235 65.5282 155.139 67.7754 155.139ZM67.7754 154.045C66.2939 154.045 65.4288 152.559 65.4288 149.909C65.4288 147.264 66.3038 145.753 67.7754 145.753C69.247 145.753 70.122 147.264 70.122 149.909C70.122 152.559 69.2569 154.045 67.7754 154.045ZM76.5254 155.139C78.7725 155.139 80.0652 153.235 80.0652 149.909C80.0652 146.608 78.7527 144.679 76.5254 144.679C74.2981 144.679 72.9856 146.608 72.9856 149.909C72.9856 153.235 74.2782 155.139 76.5254 155.139ZM76.5254 154.045C75.0439 154.045 74.1788 152.559 74.1788 149.909C74.1788 147.264 75.0538 145.753 76.5254 145.753C77.997 145.753 78.872 147.264 78.872 149.909C78.872 152.559 78.0069 154.045 76.5254 154.045ZM82.4739 155.08C82.9661 155.08 83.3688 154.677 83.3688 154.185C83.3688 153.692 82.9661 153.29 82.4739 153.29C81.9817 153.29 81.579 153.692 81.579 154.185C81.579 154.677 81.9817 155.08 82.4739 155.08ZM88.4199 155.139C90.6671 155.139 91.9597 153.235 91.9597 149.909C91.9597 146.608 90.6472 144.679 88.4199 144.679C86.1926 144.679 84.8801 146.608 84.8801 149.909C84.8801 153.235 86.1728 155.139 88.4199 155.139ZM88.4199 154.045C86.9384 154.045 86.0733 152.559 86.0733 149.909C86.0733 147.264 86.9483 145.753 88.4199 145.753C89.8915 145.753 90.7665 147.264 90.7665 149.909C90.7665 152.559 89.9015 154.045 88.4199 154.045ZM97.1699 155.139C99.4171 155.139 100.71 153.235 100.71 149.909C100.71 146.608 99.3972 144.679 97.1699 144.679C94.9426 144.679 93.6301 146.608 93.6301 149.909C93.6301 153.235 94.9228 155.139 97.1699 155.139ZM97.1699 154.045C95.6884 154.045 94.8233 152.559 94.8233 149.909C94.8233 147.264 95.6983 145.753 97.1699 145.753C98.6415 145.753 99.5165 147.264 99.5165 149.909C99.5165 152.559 98.6515 154.045 97.1699 154.045ZM105.92 155.139C108.167 155.139 109.46 153.235 109.46 149.909C109.46 146.608 108.147 144.679 105.92 144.679C103.693 144.679 102.38 146.608 102.38 149.909C102.38 153.235 103.673 155.139 105.92 155.139ZM105.92 154.045C104.438 154.045 103.573 152.559 103.573 149.909C103.573 147.264 104.448 145.753 105.92 145.753C107.392 145.753 108.267 147.264 108.267 149.909C108.267 152.559 107.401 154.045 105.92 154.045Z" fill="black"/>
<g filter="url(#filter0_d)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M76.7905 82L66.5 72L56.2095 82H25C16.7157 82 10 88.7157 10 97V179C10 187.284 16.7157 194 25 194H283C291.284 194 298 187.284 298 179V97C298 88.7157 291.284 82 283 82H76.7905Z" fill="white"/>
</g>
<path d="M35.625 104.42H37.3182C37.267 102.557 35.6193 101.205 33.2557 101.205C30.9205 101.205 29.1307 102.54 29.1307 104.545C29.1307 106.165 30.2898 107.114 32.1591 107.619L33.5341 107.994C34.7784 108.324 35.7386 108.733 35.7386 109.767C35.7386 110.903 34.6534 111.653 33.1591 111.653C31.8068 111.653 30.6818 111.051 30.5795 109.784H28.8182C28.9318 111.892 30.5625 113.193 33.1705 113.193C35.9034 113.193 37.4773 111.756 37.4773 109.784C37.4773 107.688 35.608 106.875 34.1307 106.511L32.9943 106.216C32.0852 105.983 30.875 105.557 30.8807 104.443C30.8807 103.455 31.7841 102.722 33.2159 102.722C34.5511 102.722 35.5 103.347 35.625 104.42ZM44.9673 109.381C44.973 110.864 43.8707 111.568 42.9162 111.568C41.8651 111.568 41.1378 110.807 41.1378 109.619V104.273H39.4389V109.824C39.4389 111.989 40.6264 113.114 42.3026 113.114C43.6151 113.114 44.5071 112.42 44.9105 111.489H45.0014V113H46.6719V104.273H44.9673V109.381ZM49.0909 113H50.75V111.642H50.892C51.1989 112.199 51.8239 113.17 53.4148 113.17C55.5284 113.17 57.0625 111.477 57.0625 108.653C57.0625 105.824 55.5057 104.159 53.3977 104.159C51.7784 104.159 51.1932 105.148 50.892 105.688H50.7898V101.364H49.0909V113ZM50.7557 108.636C50.7557 106.812 51.5511 105.602 53.0341 105.602C54.5739 105.602 55.3466 106.903 55.3466 108.636C55.3466 110.386 54.5511 111.722 53.0341 111.722C51.5739 111.722 50.7557 110.472 50.7557 108.636ZM64.1122 107.347H58.9531V108.818H64.1122V107.347ZM70.0526 113.176C72.1151 113.176 73.4503 111.938 73.6378 110.239H71.9844C71.7685 111.182 71.0355 111.739 70.0639 111.739C68.6264 111.739 67.7003 110.54 67.7003 108.636C67.7003 106.767 68.6435 105.591 70.0639 105.591C71.1435 105.591 71.8026 106.273 71.9844 107.091H73.6378C73.456 105.33 72.0185 104.159 70.0355 104.159C67.5753 104.159 65.9844 106.011 65.9844 108.676C65.9844 111.307 67.5185 113.176 70.0526 113.176ZM77.9943 113.193C79.4375 113.193 80.25 112.46 80.5739 111.807H80.642V113H82.3011V107.205C82.3011 104.665 80.3011 104.159 78.9148 104.159C77.3352 104.159 75.8807 104.795 75.3125 106.386L76.9091 106.75C77.1591 106.131 77.7955 105.534 78.9375 105.534C80.0341 105.534 80.5966 106.108 80.5966 107.097V107.136C80.5966 107.756 79.9602 107.744 78.392 107.926C76.7386 108.119 75.0455 108.551 75.0455 110.534C75.0455 112.25 76.3352 113.193 77.9943 113.193ZM78.3636 111.83C77.4034 111.83 76.7102 111.398 76.7102 110.557C76.7102 109.648 77.517 109.324 78.5 109.193C79.0511 109.119 80.358 108.972 80.6023 108.727V109.852C80.6023 110.886 79.7784 111.83 78.3636 111.83ZM88.6378 104.273H86.848V102.182H85.1491V104.273H83.8707V105.636H85.1491V110.79C85.1435 112.375 86.3537 113.142 87.6946 113.114C88.2344 113.108 88.598 113.006 88.7969 112.932L88.4901 111.528C88.3764 111.551 88.1662 111.602 87.8935 111.602C87.3423 111.602 86.848 111.42 86.848 110.438V105.636H88.6378V104.273ZM94.1847 113.176C96.0881 113.176 97.4347 112.239 97.821 110.818L96.2131 110.528C95.9062 111.352 95.1676 111.773 94.2017 111.773C92.7472 111.773 91.7699 110.83 91.7244 109.148H97.929V108.545C97.929 105.392 96.0426 104.159 94.0653 104.159C91.6335 104.159 90.0312 106.011 90.0312 108.693C90.0312 111.403 91.6108 113.176 94.1847 113.176ZM91.7301 107.875C91.7983 106.636 92.696 105.562 94.0767 105.562C95.3949 105.562 96.2585 106.54 96.2642 107.875H91.7301ZM103.473 116.455C105.695 116.455 107.411 115.438 107.411 113.193V104.273H105.746V105.688H105.621C105.32 105.148 104.717 104.159 103.092 104.159C100.984 104.159 99.4332 105.824 99.4332 108.602C99.4332 111.386 101.018 112.869 103.081 112.869C104.683 112.869 105.303 111.966 105.609 111.409H105.717V113.125C105.717 114.494 104.78 115.085 103.49 115.085C102.075 115.085 101.524 114.375 101.223 113.875L99.7628 114.477C100.223 115.545 101.388 116.455 103.473 116.455ZM103.456 111.46C101.939 111.46 101.149 110.295 101.149 108.58C101.149 106.903 101.922 105.602 103.456 105.602C104.939 105.602 105.734 106.812 105.734 108.58C105.734 110.381 104.922 111.46 103.456 111.46ZM113.365 113.176C115.825 113.176 117.433 111.375 117.433 108.676C117.433 105.96 115.825 104.159 113.365 104.159C110.905 104.159 109.297 105.96 109.297 108.676C109.297 111.375 110.905 113.176 113.365 113.176ZM113.371 111.75C111.763 111.75 111.013 110.347 111.013 108.67C111.013 107 111.763 105.58 113.371 105.58C114.967 105.58 115.717 107 115.717 108.67C115.717 110.347 114.967 111.75 113.371 111.75ZM119.33 113H121.028V107.67C121.028 106.528 121.909 105.705 123.114 105.705C123.466 105.705 123.864 105.767 124 105.807V104.182C123.83 104.159 123.494 104.142 123.278 104.142C122.256 104.142 121.381 104.722 121.062 105.659H120.972V104.273H119.33V113ZM126.81 116.273C128.213 116.273 129.099 115.54 129.605 114.165L133.213 104.29L131.378 104.273L129.168 111.045H129.077L126.866 104.273H125.048L128.241 113.114L128.031 113.693C127.599 114.852 126.991 114.949 126.06 114.693L125.651 116.085C125.855 116.176 126.298 116.273 126.81 116.273ZM139.026 113H146.685V111.494H141.446V111.409L143.759 108.989C145.889 106.835 146.497 105.807 146.497 104.506C146.497 102.636 144.974 101.205 142.781 101.205C140.605 101.205 139.014 102.614 139.014 104.739H140.69C140.685 103.489 141.491 102.67 142.747 102.67C143.929 102.67 144.827 103.398 144.827 104.557C144.827 105.585 144.213 106.324 142.963 107.648L139.026 111.727V113Z" fill="black"/>
<path d="M30.375 147.139C32.6222 147.139 33.9148 145.235 33.9148 141.909C33.9148 138.608 32.6023 136.679 30.375 136.679C28.1477 136.679 26.8352 138.608 26.8352 141.909C26.8352 145.235 28.1278 147.139 30.375 147.139ZM30.375 146.045C28.8935 146.045 28.0284 144.559 28.0284 141.909C28.0284 139.264 28.9034 137.753 30.375 137.753C31.8466 137.753 32.7216 139.264 32.7216 141.909C32.7216 144.559 31.8565 146.045 30.375 146.045ZM35.804 147H42.2273V145.906H37.4943V145.827L39.7812 143.381C41.5312 141.506 42.0483 140.631 42.0483 139.503C42.0483 137.932 40.7756 136.679 38.9858 136.679C37.201 136.679 35.8438 137.892 35.8438 139.682H37.017C37.017 138.523 37.7678 137.753 38.946 137.753C40.0497 137.753 40.8949 138.429 40.8949 139.503C40.8949 140.442 40.343 141.138 39.1648 142.426L35.804 146.105V147ZM47.8999 136.341H46.826L43.5447 148.531H44.6186L47.8999 136.341ZM52.8503 136.818H51.6174L49.0719 138.509V139.761L51.5577 138.111H51.6174V147H52.8503V136.818ZM55.7786 147H62.2019V145.906H57.4689V145.827L59.7559 143.381C61.5059 141.506 62.0229 140.631 62.0229 139.503C62.0229 137.932 60.7502 136.679 58.9604 136.679C57.1756 136.679 55.8184 137.892 55.8184 139.682H56.9917C56.9917 138.523 57.7424 137.753 58.9206 137.753C60.0243 137.753 60.8695 138.429 60.8695 139.503C60.8695 140.442 60.3176 141.138 59.1394 142.426L55.7786 146.105V147ZM67.8745 136.341H66.8006L63.5194 148.531H64.5932L67.8745 136.341ZM69.2454 147H75.6687V145.906H70.9357V145.827L73.2227 143.381C74.9727 141.506 75.4897 140.631 75.4897 139.503C75.4897 137.932 74.217 136.679 72.4272 136.679C70.6424 136.679 69.2852 137.892 69.2852 139.682H70.4585C70.4585 138.523 71.2092 137.753 72.3874 137.753C73.4911 137.753 74.3363 138.429 74.3363 139.503C74.3363 140.442 73.7844 141.138 72.6062 142.426L69.2454 146.105V147ZM81.043 147.139C83.2901 147.139 84.5827 145.235 84.5827 141.909C84.5827 138.608 83.2702 136.679 81.043 136.679C78.8157 136.679 77.5032 138.608 77.5032 141.909C77.5032 145.235 78.7958 147.139 81.043 147.139ZM81.043 146.045C79.5614 146.045 78.6964 144.559 78.6964 141.909C78.6964 139.264 79.5714 137.753 81.043 137.753C82.5146 137.753 83.3896 139.264 83.3896 141.909C83.3896 144.559 82.5245 146.045 81.043 146.045ZM86.4719 147H92.8952V145.906H88.1623V145.827L90.4492 143.381C92.1992 141.506 92.7163 140.631 92.7163 139.503C92.7163 137.932 91.4435 136.679 89.6538 136.679C87.869 136.679 86.5117 137.892 86.5117 139.682H87.685C87.685 138.523 88.4357 137.753 89.614 137.753C90.7177 137.753 91.5629 138.429 91.5629 139.503C91.5629 140.442 91.011 141.138 89.8327 142.426L86.4719 146.105V147ZM98.5281 136.818H97.2951L94.7496 138.509V139.761L97.2354 138.111H97.2951V147H98.5281V136.818Z" fill="black"/>
<path d="M30.6335 164.818H29.4006L26.8551 166.509V167.761L29.3409 166.111H29.4006V175H30.6335V164.818ZM33.5618 175H39.9851V173.906H35.2521V173.827L37.5391 171.381C39.2891 169.506 39.8061 168.631 39.8061 167.503C39.8061 165.932 38.5334 164.679 36.7436 164.679C34.9588 164.679 33.6016 165.892 33.6016 167.682H34.7749C34.7749 166.523 35.5256 165.753 36.7038 165.753C37.8075 165.753 38.6527 166.429 38.6527 167.503C38.6527 168.442 38.1009 169.138 36.9226 170.426L33.5618 174.105V175ZM45.6577 164.341H44.5838L41.3026 176.531H42.3764L45.6577 164.341ZM50.6081 164.818H49.3752L46.8297 166.509V167.761L49.3155 166.111H49.3752V175H50.6081V164.818ZM53.5364 175H59.9597V173.906H55.2267V173.827L57.5137 171.381C59.2637 169.506 59.7807 168.631 59.7807 167.503C59.7807 165.932 58.508 164.679 56.7182 164.679C54.9334 164.679 53.5762 165.892 53.5762 167.682H54.7495C54.7495 166.523 55.5002 165.753 56.6784 165.753C57.7821 165.753 58.6273 166.429 58.6273 167.503C58.6273 168.442 58.0755 169.138 56.8972 170.426L53.5364 174.105V175ZM65.6323 164.341H64.5584L61.2772 176.531H62.351L65.6323 164.341ZM67.0032 175H73.4265V173.906H68.6935V173.827L70.9805 171.381C72.7305 169.506 73.2475 168.631 73.2475 167.503C73.2475 165.932 71.9748 164.679 70.185 164.679C68.4002 164.679 67.043 165.892 67.043 167.682H68.2163C68.2163 166.523 68.967 165.753 70.1452 165.753C71.2489 165.753 72.0941 166.429 72.0941 167.503C72.0941 168.442 71.5423 169.138 70.364 170.426L67.0032 174.105V175ZM78.8008 175.139C81.0479 175.139 82.3406 173.235 82.3406 169.909C82.3406 166.608 81.0281 164.679 78.8008 164.679C76.5735 164.679 75.261 166.608 75.261 169.909C75.261 173.235 76.5536 175.139 78.8008 175.139ZM78.8008 174.045C77.3192 174.045 76.4542 172.559 76.4542 169.909C76.4542 167.264 77.3292 165.753 78.8008 165.753C80.2724 165.753 81.1474 167.264 81.1474 169.909C81.1474 172.559 80.2823 174.045 78.8008 174.045ZM84.2298 175H90.6531V173.906H85.9201V173.827L88.207 171.381C89.957 169.506 90.4741 168.631 90.4741 167.503C90.4741 165.932 89.2013 164.679 87.4116 164.679C85.6268 164.679 84.2695 165.892 84.2695 167.682H85.4428C85.4428 166.523 86.1935 165.753 87.3718 165.753C88.4755 165.753 89.3207 166.429 89.3207 167.503C89.3207 168.442 88.7688 169.138 87.5906 170.426L84.2298 174.105V175ZM96.2859 164.818H95.0529L92.5075 166.509V167.761L94.9933 166.111H95.0529V175H96.2859V164.818Z" fill="black"/>
<path d="M205.057 173.21H206.17V170.486H208.895V169.372H206.17V166.648H205.057V169.372H202.332V170.486H205.057V173.21ZM211.461 175H212.694V171.023H214.922C215.011 171.023 215.096 171.023 215.18 171.018L217.328 175H218.76L216.458 170.794C217.756 170.352 218.362 169.293 218.362 167.94C218.362 166.141 217.288 164.818 214.902 164.818H211.461V175ZM212.694 169.909V165.912H214.862C216.513 165.912 217.149 166.717 217.149 167.94C217.149 169.163 216.513 169.909 214.882 169.909H212.694ZM220.257 177.864H221.431V173.827H221.53C221.789 174.244 222.286 175.159 223.757 175.159C225.667 175.159 226.999 173.628 226.999 171.202C226.999 168.795 225.667 167.264 223.738 167.264C222.246 167.264 221.789 168.179 221.53 168.577H221.391V167.364H220.257V177.864ZM221.411 171.182C221.411 169.472 222.167 168.318 223.598 168.318C225.09 168.318 225.826 169.571 225.826 171.182C225.826 172.812 225.07 174.105 223.598 174.105C222.186 174.105 221.411 172.912 221.411 171.182ZM232.348 164.818H231.115L228.57 166.509V167.761L231.056 166.111H231.115V175H232.348V164.818ZM238.598 175.139C240.845 175.139 242.137 173.235 242.137 169.909C242.137 166.608 240.825 164.679 238.598 164.679C236.37 164.679 235.058 166.608 235.058 169.909C235.058 173.235 236.35 175.139 238.598 175.139ZM238.598 174.045C237.116 174.045 236.251 172.559 236.251 169.909C236.251 167.264 237.126 165.753 238.598 165.753C240.069 165.753 240.944 167.264 240.944 169.909C240.944 172.559 240.079 174.045 238.598 174.045ZM247.348 175.139C249.595 175.139 250.887 173.235 250.887 169.909C250.887 166.608 249.575 164.679 247.348 164.679C245.12 164.679 243.808 166.608 243.808 169.909C243.808 173.235 245.1 175.139 247.348 175.139ZM247.348 174.045C245.866 174.045 245.001 172.559 245.001 169.909C245.001 167.264 245.876 165.753 247.348 165.753C248.819 165.753 249.694 167.264 249.694 169.909C249.694 172.559 248.829 174.045 247.348 174.045ZM253.296 175.08C253.788 175.08 254.191 174.677 254.191 174.185C254.191 173.692 253.788 173.29 253.296 173.29C252.804 173.29 252.401 173.692 252.401 174.185C252.401 174.677 252.804 175.08 253.296 175.08ZM259.242 175.139C261.489 175.139 262.782 173.235 262.782 169.909C262.782 166.608 261.469 164.679 259.242 164.679C257.015 164.679 255.702 166.608 255.702 169.909C255.702 173.235 256.995 175.139 259.242 175.139ZM259.242 174.045C257.761 174.045 256.896 172.559 256.896 169.909C256.896 167.264 257.771 165.753 259.242 165.753C260.714 165.753 261.589 167.264 261.589 169.909C261.589 172.559 260.724 174.045 259.242 174.045ZM267.992 175.139C270.239 175.139 271.532 173.235 271.532 169.909C271.532 166.608 270.219 164.679 267.992 164.679C265.765 164.679 264.452 166.608 264.452 169.909C264.452 173.235 265.745 175.139 267.992 175.139ZM267.992 174.045C266.511 174.045 265.646 172.559 265.646 169.909C265.646 167.264 266.521 165.753 267.992 165.753C269.464 165.753 270.339 167.264 270.339 169.909C270.339 172.559 269.474 174.045 267.992 174.045ZM276.742 175.139C278.989 175.139 280.282 173.235 280.282 169.909C280.282 166.608 278.969 164.679 276.742 164.679C274.515 164.679 273.202 166.608 273.202 169.909C273.202 173.235 274.495 175.139 276.742 175.139ZM276.742 174.045C275.261 174.045 274.396 172.559 274.396 169.909C274.396 167.264 275.271 165.753 276.742 165.753C278.214 165.753 279.089 167.264 279.089 169.909C279.089 172.559 278.224 174.045 276.742 174.045Z" fill="black"/>
<path d="M217.449 141.362H212.994V142.456H217.449V141.362ZM219.672 147H220.905V143.023H223.133C223.222 143.023 223.307 143.023 223.391 143.018L225.539 147H226.971L224.669 142.794C225.966 142.352 226.573 141.293 226.573 139.94C226.573 138.141 225.499 136.818 223.113 136.818H219.672V147ZM220.905 141.909V137.912H223.073C224.724 137.912 225.36 138.717 225.36 139.94C225.36 141.163 224.724 141.909 223.093 141.909H220.905ZM228.468 149.864H229.642V145.827H229.741C230 146.244 230.497 147.159 231.968 147.159C233.877 147.159 235.21 145.628 235.21 143.202C235.21 140.795 233.877 139.264 231.949 139.264C230.457 139.264 230 140.179 229.741 140.577H229.602V139.364H228.468V149.864ZM229.622 143.182C229.622 141.472 230.377 140.318 231.809 140.318C233.301 140.318 234.037 141.571 234.037 143.182C234.037 144.812 233.281 146.105 231.809 146.105C230.397 146.105 229.622 144.912 229.622 143.182ZM237.298 147H238.591L243.125 137.972V136.818H236.602V137.912H241.852V137.991L237.298 147ZM248.023 147.139C249.962 147.139 251.384 145.707 251.384 143.759C251.384 141.785 250.012 140.338 248.142 140.338C247.456 140.338 246.79 140.582 246.372 140.915H246.313L246.671 137.912H250.926V136.818H245.637L245.02 141.83L246.173 141.969C246.596 141.665 247.317 141.447 247.943 141.452C249.241 141.462 250.191 142.446 250.191 143.778C250.191 145.086 249.276 146.045 248.023 146.045C246.979 146.045 246.149 145.374 246.054 144.455H244.861C244.936 146.006 246.273 147.139 248.023 147.139ZM253.851 147.08C254.343 147.08 254.746 146.677 254.746 146.185C254.746 145.692 254.343 145.29 253.851 145.29C253.359 145.29 252.956 145.692 252.956 146.185C252.956 146.677 253.359 147.08 253.851 147.08ZM259.797 147.139C262.044 147.139 263.337 145.235 263.337 141.909C263.337 138.608 262.024 136.679 259.797 136.679C257.57 136.679 256.257 138.608 256.257 141.909C256.257 145.235 257.55 147.139 259.797 147.139ZM259.797 146.045C258.315 146.045 257.45 144.559 257.45 141.909C257.45 139.264 258.325 137.753 259.797 137.753C261.268 137.753 262.143 139.264 262.143 141.909C262.143 144.559 261.278 146.045 259.797 146.045ZM268.547 147.139C270.794 147.139 272.087 145.235 272.087 141.909C272.087 138.608 270.774 136.679 268.547 136.679C266.32 136.679 265.007 138.608 265.007 141.909C265.007 145.235 266.3 147.139 268.547 147.139ZM268.547 146.045C267.065 146.045 266.2 144.559 266.2 141.909C266.2 139.264 267.075 137.753 268.547 137.753C270.018 137.753 270.893 139.264 270.893 141.909C270.893 144.559 270.028 146.045 268.547 146.045ZM277.297 147.139C279.544 147.139 280.837 145.235 280.837 141.909C280.837 138.608 279.524 136.679 277.297 136.679C275.07 136.679 273.757 138.608 273.757 141.909C273.757 145.235 275.05 147.139 277.297 147.139ZM277.297 146.045C275.815 146.045 274.95 144.559 274.95 141.909C274.95 139.264 275.825 137.753 277.297 137.753C278.768 137.753 279.643 139.264 279.643 141.909C279.643 144.559 278.778 146.045 277.297 146.045Z" fill="black"/>
<path d="M276.877 103.416L274.134 106.158L271.392 103.416L270.685 104.123L273.427 106.865L270.685 109.608L271.392 110.315L274.134 107.573L276.877 110.315L277.584 109.608L274.841 106.865L277.584 104.123L276.877 103.416Z" fill="black"/>
<path d="M279.303 101.697C277.897 100.29 275.989 99.5 274 99.5C272.011 99.5 270.103 100.29 268.697 101.697C267.29 103.103 266.5 105.011 266.5 107C266.5 108.989 267.29 110.897 268.697 112.303C270.103 113.71 272.011 114.5 274 114.5C275.989 114.5 277.897 113.71 279.303 112.303C280.71 110.897 281.5 108.989 281.5 107C281.5 105.011 280.71 103.103 279.303 101.697ZM274 113.5C270.416 113.5 267.5 110.584 267.5 107C267.5 103.416 270.416 100.5 274 100.5C277.584 100.5 280.5 103.416 280.5 107C280.5 110.584 277.584 113.5 274 113.5Z" fill="black"/>
<path d="M38.1186 65H39.6548V61.147H41.7429C41.7777 61.147 41.8075 61.147 41.8423 61.147L43.9105 65H45.6605L43.4034 60.8786C44.6513 60.4162 45.2727 59.3771 45.2727 58.0099C45.2727 56.1357 44.1094 54.8182 41.7479 54.8182H38.1186V65ZM39.6548 59.8246V56.1357H41.5838C43.1001 56.1357 43.7266 56.8565 43.7266 58.0099C43.7266 59.1584 43.1001 59.8246 41.6037 59.8246H39.6548ZM47.0227 67.8636H48.5092V63.8118H48.5987C48.8672 64.299 49.4141 65.1491 50.8061 65.1491C52.6555 65.1491 53.9979 63.6676 53.9979 61.1967C53.9979 58.7209 52.6357 57.2642 50.7912 57.2642C49.3743 57.2642 48.8622 58.1293 48.5987 58.6016H48.4744V57.3636H47.0227V67.8636ZM48.4794 61.1818C48.4794 59.5859 49.1754 58.527 50.473 58.527C51.8203 58.527 52.4964 59.6655 52.4964 61.1818C52.4964 62.7131 51.8004 63.8814 50.473 63.8814C49.1953 63.8814 48.4794 62.7876 48.4794 61.1818ZM59.1882 65.1392C61.2663 65.1392 62.7926 63.8963 62.7876 62.206C62.7926 60.9183 62.0121 59.9936 60.6598 59.7848V59.7053C61.7237 59.4318 62.4148 58.5966 62.4098 57.4531C62.4148 55.9567 61.1868 54.679 59.228 54.679C57.3587 54.679 55.8572 55.8075 55.8075 57.4631H57.294C57.3288 56.5284 58.2088 55.9616 59.2081 55.9616C60.2472 55.9616 60.9283 56.593 60.9233 57.5327C60.9283 58.517 60.1378 59.1634 59.0092 59.1634H58.1491V60.4162H59.0092C60.4212 60.4162 61.2365 61.1321 61.2365 62.1562C61.2365 63.1456 60.3764 63.8168 59.1783 63.8168C58.0746 63.8168 57.2145 63.25 57.1548 62.3452H55.5938C55.6584 64.0057 57.13 65.1392 59.1882 65.1392ZM68.2116 65.169C70.5632 65.169 71.9403 63.25 71.9403 59.9141C71.9403 56.603 70.5433 54.679 68.2116 54.679C65.875 54.679 64.483 56.598 64.478 59.9141C64.478 63.245 65.8551 65.1641 68.2116 65.169ZM68.2116 63.8416C66.8345 63.8416 66.0043 62.4595 66.0043 59.9141C66.0092 57.3786 66.8395 55.9815 68.2116 55.9815C69.5788 55.9815 70.4141 57.3786 70.4141 59.9141C70.4141 62.4595 69.5838 63.8416 68.2116 63.8416ZM77.2488 65.169C79.6003 65.169 80.9775 63.25 80.9775 59.9141C80.9775 56.603 79.5804 54.679 77.2488 54.679C74.9121 54.679 73.5201 56.598 73.5151 59.9141C73.5151 63.245 74.8922 65.1641 77.2488 65.169ZM77.2488 63.8416C75.8716 63.8416 75.0414 62.4595 75.0414 59.9141C75.0463 57.3786 75.8766 55.9815 77.2488 55.9815C78.6159 55.9815 79.4512 57.3786 79.4512 59.9141C79.4512 62.4595 78.6209 63.8416 77.2488 63.8416ZM83.3576 65.0945C83.8995 65.0945 84.3519 64.652 84.3519 64.1001C84.3519 63.5582 83.8995 63.1108 83.3576 63.1108C82.8107 63.1108 82.3633 63.5582 82.3633 64.1001C82.3633 64.652 82.8107 65.0945 83.3576 65.0945ZM89.4851 65.169C91.8366 65.169 93.2138 63.25 93.2138 59.9141C93.2138 56.603 91.8168 54.679 89.4851 54.679C87.1484 54.679 85.7564 56.598 85.7514 59.9141C85.7514 63.245 87.1286 65.1641 89.4851 65.169ZM89.4851 63.8416C88.108 63.8416 87.2777 62.4595 87.2777 59.9141C87.2827 57.3786 88.1129 55.9815 89.4851 55.9815C90.8523 55.9815 91.6875 57.3786 91.6875 59.9141C91.6875 62.4595 90.8572 63.8416 89.4851 63.8416ZM98.5222 65.169C100.874 65.169 102.251 63.25 102.251 59.9141C102.251 56.603 100.854 54.679 98.5222 54.679C96.1855 54.679 94.7935 56.598 94.7885 59.9141C94.7885 63.245 96.1657 65.1641 98.5222 65.169ZM98.5222 63.8416C97.1451 63.8416 96.3148 62.4595 96.3148 59.9141C96.3198 57.3786 97.15 55.9815 98.5222 55.9815C99.8894 55.9815 100.725 57.3786 100.725 59.9141C100.725 62.4595 99.8944 63.8416 98.5222 63.8416ZM107.559 65.169C109.911 65.169 111.288 63.25 111.288 59.9141C111.288 56.603 109.891 54.679 107.559 54.679C105.223 54.679 103.831 56.598 103.826 59.9141C103.826 63.245 105.203 65.1641 107.559 65.169ZM107.559 63.8416C106.182 63.8416 105.352 62.4595 105.352 59.9141C105.357 57.3786 106.187 55.9815 107.559 55.9815C108.926 55.9815 109.762 57.3786 109.762 59.9141C109.762 62.4595 108.931 63.8416 107.559 63.8416Z" fill="#5E81F4"/>
<path d="M37 67.799H112.078V68.8828H37V67.799Z" fill="#5E81F4"/>
<defs>
<filter id="filter0_d" x="0" y="62" width="308" height="142" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feMorphology radius="2" operator="dilate" in="SourceAlpha" result="effect1_dropShadow"/>
<feOffset/>
<feGaussianBlur stdDeviation="4"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
</filter>
</defs>
</svg>

                </div>
            `
            this.faqPosition = {}
            this.showFaq = true
            this.showMenuHelper = false
             this.modalFaq['style']['bottom'] = '-225px'
            this.faqPosition['top'] = '200px';
            this.faqPosition['width'] = '450px';
            this.faqPosition['left'] = '600px';
            this.modalFaq['style']['max-width'] = '300px'
            this.modalFaq['style']['left'] = '-350px'
            this.modalFaq['header'] = 'Lihat riwayat transaksi'
            this.modalFaq['body'] = `Pada bagian activity kamu bisa mengetahui riwayat 
transaksi baik pengeluaran ataupun pemasukan
pada tiap sub-category loh.`

        },
        faqMonthlySavingGoals(){
            this.currentFaq = 'saving'
            this.faq=`<div class="bg-white shadow-md p-4 rounded-2xl">
                <svg width="305" height="246" viewBox="0 0 305 246" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect x="232" y="212" width="64" height="34" rx="8" fill="#5E81F4"/>
<path d="M251.979 234L252.913 231.305H256.891L257.82 234H259.451L255.787 223.818H254.012L250.348 234H251.979ZM253.361 230.013L254.862 225.668H254.942L256.443 230.013H253.361ZM263.538 234.149C264.93 234.149 265.477 233.299 265.745 232.812H265.869V234H267.321V223.818H265.835V227.602H265.745C265.477 227.129 264.969 226.264 263.548 226.264C261.703 226.264 260.346 227.721 260.346 230.197C260.346 232.668 261.683 234.149 263.538 234.149ZM263.866 232.881C262.538 232.881 261.847 231.713 261.847 230.182C261.847 228.665 262.523 227.527 263.866 227.527C265.163 227.527 265.859 228.586 265.859 230.182C265.859 231.788 265.148 232.881 263.866 232.881ZM272.301 234.149C273.693 234.149 274.24 233.299 274.509 232.812H274.633V234H276.085V223.818H274.598V227.602H274.509C274.24 227.129 273.733 226.264 272.311 226.264C270.467 226.264 269.11 227.721 269.11 230.197C269.11 232.668 270.447 234.149 272.301 234.149ZM272.629 232.881C271.302 232.881 270.611 231.713 270.611 230.182C270.611 228.665 271.287 227.527 272.629 227.527C273.927 227.527 274.623 228.586 274.623 230.182C274.623 231.788 273.912 232.881 272.629 232.881Z" fill="white"/>
<path d="M4.864 18.112C4.11733 18.112 3.44533 17.984 2.848 17.728C2.25067 17.4613 1.78133 17.088 1.44 16.608C1.09867 16.128 0.928 15.568 0.928 14.928H2.88C2.92267 15.408 3.10933 15.8027 3.44 16.112C3.78133 16.4213 4.256 16.576 4.864 16.576C5.49333 16.576 5.984 16.4267 6.336 16.128C6.688 15.8187 6.864 15.424 6.864 14.944C6.864 14.5707 6.752 14.2667 6.528 14.032C6.31467 13.7973 6.04267 13.616 5.712 13.488C5.392 13.36 4.944 13.2213 4.368 13.072C3.64267 12.88 3.05067 12.688 2.592 12.496C2.144 12.2933 1.76 11.984 1.44 11.568C1.12 11.152 0.96 10.5973 0.96 9.904C0.96 9.264 1.12 8.704 1.44 8.224C1.76 7.744 2.208 7.376 2.784 7.12C3.36 6.864 4.02667 6.736 4.784 6.736C5.86133 6.736 6.74133 7.008 7.424 7.552C8.11733 8.08533 8.50133 8.82133 8.576 9.76H6.56C6.528 9.35467 6.336 9.008 5.984 8.72C5.632 8.432 5.168 8.288 4.592 8.288C4.06933 8.288 3.64267 8.42133 3.312 8.688C2.98133 8.95467 2.816 9.33867 2.816 9.84C2.816 10.1813 2.91733 10.464 3.12 10.688C3.33333 10.9013 3.6 11.072 3.92 11.2C4.24 11.328 4.67733 11.4667 5.232 11.616C5.968 11.8187 6.56533 12.0213 7.024 12.224C7.49333 12.4267 7.888 12.7413 8.208 13.168C8.53867 13.584 8.704 14.144 8.704 14.848C8.704 15.4133 8.54933 15.9467 8.24 16.448C7.94133 16.9493 7.49867 17.3547 6.912 17.664C6.336 17.9627 5.65333 18.112 4.864 18.112ZM10.2483 13.552C10.2483 12.6667 10.4296 11.8827 10.7923 11.2C11.1656 10.5173 11.6669 9.98933 12.2963 9.616C12.9363 9.232 13.6403 9.04 14.4083 9.04C15.1016 9.04 15.7043 9.17867 16.2163 9.456C16.7389 9.72267 17.1549 10.0587 17.4643 10.464V9.184H19.3043V18H17.4643V16.688C17.1549 17.104 16.7336 17.4507 16.2003 17.728C15.6669 18.0053 15.0589 18.144 14.3763 18.144C13.6189 18.144 12.9256 17.952 12.2963 17.568C11.6669 17.1733 11.1656 16.6293 10.7923 15.936C10.4296 15.232 10.2483 14.4373 10.2483 13.552ZM17.4643 13.584C17.4643 12.976 17.3363 12.448 17.0803 12C16.8349 11.552 16.5096 11.2107 16.1043 10.976C15.6989 10.7413 15.2616 10.624 14.7923 10.624C14.3229 10.624 13.8856 10.7413 13.4803 10.976C13.0749 11.2 12.7443 11.536 12.4883 11.984C12.2429 12.4213 12.1203 12.944 12.1203 13.552C12.1203 14.16 12.2429 14.6933 12.4883 15.152C12.7443 15.6107 13.0749 15.9627 13.4803 16.208C13.8963 16.4427 14.3336 16.56 14.7923 16.56C15.2616 16.56 15.6989 16.4427 16.1043 16.208C16.5096 15.9733 16.8349 15.632 17.0803 15.184C17.3363 14.7253 17.4643 14.192 17.4643 13.584ZM25.108 16.368L27.604 9.184H29.54L26.18 18H24.004L20.66 9.184H22.612L25.108 16.368ZM31.8468 8.016C31.5161 8.016 31.2388 7.904 31.0148 7.68C30.7908 7.456 30.6788 7.17867 30.6788 6.848C30.6788 6.51733 30.7908 6.24 31.0148 6.016C31.2388 5.792 31.5161 5.68 31.8468 5.68C32.1668 5.68 32.4388 5.792 32.6628 6.016C32.8868 6.24 32.9988 6.51733 32.9988 6.848C32.9988 7.17867 32.8868 7.456 32.6628 7.68C32.4388 7.904 32.1668 8.016 31.8468 8.016ZM32.7428 9.184V18H30.9188V9.184H32.7428ZM39.5855 9.04C40.2788 9.04 40.8975 9.184 41.4415 9.472C41.9962 9.76 42.4282 10.1867 42.7375 10.752C43.0468 11.3173 43.2015 12 43.2015 12.8V18H41.3935V13.072C41.3935 12.2827 41.1962 11.68 40.8015 11.264C40.4068 10.8373 39.8682 10.624 39.1855 10.624C38.5028 10.624 37.9588 10.8373 37.5535 11.264C37.1588 11.68 36.9615 12.2827 36.9615 13.072V18H35.1375V9.184H36.9615V10.192C37.2602 9.82933 37.6388 9.54667 38.0975 9.344C38.5668 9.14133 39.0628 9.04 39.5855 9.04ZM49.0801 9.04C49.7628 9.04 50.3655 9.17867 50.8881 9.456C51.4215 9.72267 51.8375 10.0587 52.1361 10.464V9.184H53.9761V18.144C53.9761 18.9547 53.8055 19.6747 53.4641 20.304C53.1228 20.944 52.6268 21.4453 51.9761 21.808C51.3361 22.1707 50.5681 22.352 49.6721 22.352C48.4775 22.352 47.4855 22.0693 46.6961 21.504C45.9068 20.9493 45.4588 20.192 45.3521 19.232H47.1601C47.2988 19.6907 47.5921 20.0587 48.0401 20.336C48.4988 20.624 49.0428 20.768 49.6721 20.768C50.4081 20.768 51.0001 20.544 51.4481 20.096C51.9068 19.648 52.1361 18.9973 52.1361 18.144V16.672C51.8268 17.088 51.4055 17.44 50.8721 17.728C50.3495 18.0053 49.7521 18.144 49.0801 18.144C48.3121 18.144 47.6081 17.952 46.9681 17.568C46.3388 17.1733 45.8375 16.6293 45.4641 15.936C45.1015 15.232 44.9201 14.4373 44.9201 13.552C44.9201 12.6667 45.1015 11.8827 45.4641 11.2C45.8375 10.5173 46.3388 9.98933 46.9681 9.616C47.6081 9.232 48.3121 9.04 49.0801 9.04ZM52.1361 13.584C52.1361 12.976 52.0081 12.448 51.7521 12C51.5068 11.552 51.1815 11.2107 50.7761 10.976C50.3708 10.7413 49.9335 10.624 49.4641 10.624C48.9948 10.624 48.5575 10.7413 48.1521 10.976C47.7468 11.2 47.4161 11.536 47.1601 11.984C46.9148 12.4213 46.7921 12.944 46.7921 13.552C46.7921 14.16 46.9148 14.6933 47.1601 15.152C47.4161 15.6107 47.7468 15.9627 48.1521 16.208C48.5681 16.4427 49.0055 16.56 49.4641 16.56C49.9335 16.56 50.3708 16.4427 50.7761 16.208C51.1815 15.9733 51.5068 15.632 51.7521 15.184C52.0081 14.7253 52.1361 14.192 52.1361 13.584ZM68.5761 10.08C68.2881 9.52533 67.8881 9.10933 67.3761 8.832C66.8641 8.544 66.2721 8.4 65.6001 8.4C64.8641 8.4 64.2081 8.56533 63.6321 8.896C63.0561 9.22667 62.6028 9.696 62.2721 10.304C61.9521 10.912 61.7921 11.616 61.7921 12.416C61.7921 13.216 61.9521 13.9253 62.2721 14.544C62.6028 15.152 63.0561 15.6213 63.6321 15.952C64.2081 16.2827 64.8641 16.448 65.6001 16.448C66.5921 16.448 67.3975 16.1707 68.0161 15.616C68.6348 15.0613 69.0135 14.3093 69.1521 13.36H64.9761V11.904H71.1041V13.328C70.9868 14.192 70.6775 14.9867 70.1761 15.712C69.6855 16.4373 69.0401 17.0187 68.2401 17.456C67.4508 17.8827 66.5708 18.096 65.6001 18.096C64.5548 18.096 63.6001 17.856 62.7361 17.376C61.8721 16.8853 61.1841 16.208 60.6721 15.344C60.1708 14.48 59.9201 13.504 59.9201 12.416C59.9201 11.328 60.1708 10.352 60.6721 9.488C61.1841 8.624 61.8721 7.952 62.7361 7.472C63.6108 6.98133 64.5655 6.736 65.6001 6.736C66.7841 6.736 67.8348 7.02933 68.7521 7.616C69.6801 8.192 70.3521 9.01333 70.7681 10.08H68.5761ZM76.7271 18.144C75.8951 18.144 75.1431 17.9573 74.4711 17.584C73.7991 17.2 73.2711 16.6667 72.8871 15.984C72.5031 15.2907 72.3111 14.4907 72.3111 13.584C72.3111 12.688 72.5085 11.8933 72.9031 11.2C73.2978 10.5067 73.8365 9.97333 74.5191 9.6C75.2018 9.22667 75.9645 9.04 76.8071 9.04C77.6498 9.04 78.4125 9.22667 79.0951 9.6C79.7778 9.97333 80.3165 10.5067 80.7111 11.2C81.1058 11.8933 81.3031 12.688 81.3031 13.584C81.3031 14.48 81.1005 15.2747 80.6951 15.968C80.2898 16.6613 79.7351 17.2 79.0311 17.584C78.3378 17.9573 77.5698 18.144 76.7271 18.144ZM76.7271 16.56C77.1965 16.56 77.6338 16.448 78.0391 16.224C78.4551 16 78.7911 15.664 79.0471 15.216C79.3031 14.768 79.4311 14.224 79.4311 13.584C79.4311 12.944 79.3085 12.4053 79.0631 11.968C78.8178 11.52 78.4925 11.184 78.0871 10.96C77.6818 10.736 77.2445 10.624 76.7751 10.624C76.3058 10.624 75.8685 10.736 75.4631 10.96C75.0685 11.184 74.7538 11.52 74.5191 11.968C74.2845 12.4053 74.1671 12.944 74.1671 13.584C74.1671 14.5333 74.4071 15.2693 74.8871 15.792C75.3778 16.304 75.9911 16.56 76.7271 16.56ZM82.4983 13.552C82.4983 12.6667 82.6796 11.8827 83.0423 11.2C83.4156 10.5173 83.9169 9.98933 84.5463 9.616C85.1863 9.232 85.8903 9.04 86.6583 9.04C87.3516 9.04 87.9543 9.17867 88.4663 9.456C88.9889 9.72267 89.4049 10.0587 89.7143 10.464V9.184H91.5543V18H89.7143V16.688C89.4049 17.104 88.9836 17.4507 88.4503 17.728C87.9169 18.0053 87.3089 18.144 86.6263 18.144C85.8689 18.144 85.1756 17.952 84.5463 17.568C83.9169 17.1733 83.4156 16.6293 83.0423 15.936C82.6796 15.232 82.4983 14.4373 82.4983 13.552ZM89.7143 13.584C89.7143 12.976 89.5863 12.448 89.3303 12C89.0849 11.552 88.7596 11.2107 88.3543 10.976C87.9489 10.7413 87.5116 10.624 87.0423 10.624C86.5729 10.624 86.1356 10.7413 85.7303 10.976C85.3249 11.2 84.9943 11.536 84.7383 11.984C84.4929 12.4213 84.3703 12.944 84.3703 13.552C84.3703 14.16 84.4929 14.6933 84.7383 15.152C84.9943 15.6107 85.3249 15.9627 85.7303 16.208C86.1463 16.4427 86.5836 16.56 87.0423 16.56C87.5116 16.56 87.9489 16.4427 88.3543 16.208C88.7596 15.9733 89.0849 15.632 89.3303 15.184C89.5863 14.7253 89.7143 14.192 89.7143 13.584ZM95.774 6.16V18H93.95V6.16H95.774ZM101.369 18.144C100.675 18.144 100.051 18.0213 99.4968 17.776C98.9528 17.52 98.5208 17.1787 98.2008 16.752C97.8808 16.3147 97.7101 15.8293 97.6888 15.296H99.5768C99.6088 15.6693 99.7848 15.984 100.105 16.24C100.435 16.4853 100.846 16.608 101.337 16.608C101.849 16.608 102.243 16.512 102.521 16.32C102.809 16.1173 102.953 15.8613 102.953 15.552C102.953 15.2213 102.793 14.976 102.473 14.816C102.163 14.656 101.667 14.48 100.985 14.288C100.323 14.1067 99.7848 13.9307 99.3688 13.76C98.9528 13.5893 98.5901 13.328 98.2808 12.976C97.9821 12.624 97.8328 12.16 97.8328 11.584C97.8328 11.1147 97.9714 10.688 98.2488 10.304C98.5261 9.90933 98.9208 9.6 99.4328 9.376C99.9554 9.152 100.553 9.04 101.225 9.04C102.227 9.04 103.033 9.296 103.641 9.808C104.259 10.3093 104.59 10.9973 104.633 11.872H102.809C102.777 11.4773 102.617 11.1627 102.329 10.928C102.041 10.6933 101.651 10.576 101.161 10.576C100.681 10.576 100.313 10.6667 100.057 10.848C99.8008 11.0293 99.6728 11.2693 99.6728 11.568C99.6728 11.8027 99.7581 12 99.9288 12.16C100.099 12.32 100.307 12.448 100.553 12.544C100.798 12.6293 101.161 12.7413 101.641 12.88C102.281 13.0507 102.803 13.2267 103.209 13.408C103.625 13.5787 103.982 13.8347 104.281 14.176C104.579 14.5173 104.734 14.9707 104.745 15.536C104.745 16.0373 104.606 16.4853 104.329 16.88C104.051 17.2747 103.657 17.584 103.145 17.808C102.643 18.032 102.051 18.144 101.369 18.144Z" fill="black"/>
<path d="M1.97869 53L2.91335 50.3054H6.89062L7.82031 53H9.45099L5.78693 42.8182H4.01207L0.348011 53H1.97869ZM3.3608 49.0128L4.86222 44.6676H4.94176L6.44318 49.0128H3.3608ZM10.802 53H12.2885V48.2919C12.2885 47.2628 13.0094 46.5469 13.8546 46.5469C14.6799 46.5469 15.2516 47.0938 15.2516 47.924V53H16.7331V48.1328C16.7331 47.2131 17.2949 46.5469 18.2644 46.5469C19.0499 46.5469 19.6962 46.9844 19.6962 48.0185V53H21.1827V47.8793C21.1827 46.1342 20.2083 45.2642 18.8262 45.2642C17.7275 45.2642 16.9022 45.7912 16.5343 46.6065H16.4547C16.1216 45.7713 15.4206 45.2642 14.4015 45.2642C13.3922 45.2642 12.6415 45.7663 12.3233 46.6065H12.2289V45.3636H10.802V53ZM26.3917 53.1541C28.5444 53.1541 29.9513 51.5781 29.9513 49.2166C29.9513 46.8402 28.5444 45.2642 26.3917 45.2642C24.239 45.2642 22.832 46.8402 22.832 49.2166C22.832 51.5781 24.239 53.1541 26.3917 53.1541ZM26.3967 51.9062C24.9897 51.9062 24.3335 50.6783 24.3335 49.2116C24.3335 47.75 24.9897 46.5071 26.3967 46.5071C27.7937 46.5071 28.4499 47.75 28.4499 49.2116C28.4499 50.6783 27.7937 51.9062 26.3967 51.9062ZM36.448 49.8331C36.4529 51.1307 35.4885 51.7472 34.6532 51.7472C33.7335 51.7472 33.0971 51.081 33.0971 50.0419V45.3636H31.6106V50.2209C31.6106 52.1151 32.6497 53.0994 34.1163 53.0994C35.2647 53.0994 36.0453 52.4929 36.3983 51.6776H36.4778V53H37.9395V45.3636H36.448V49.8331ZM41.4233 48.4659C41.4233 47.2479 42.169 46.5518 43.2031 46.5518C44.2124 46.5518 44.8239 47.2131 44.8239 48.3217V53H46.3104V48.1428C46.3104 46.2536 45.2713 45.2642 43.7102 45.2642C42.5618 45.2642 41.8111 45.7962 41.4581 46.6065H41.3636V45.3636H39.9368V53H41.4233V48.4659ZM51.8686 45.3636H50.3026V43.5341H48.8161V45.3636H47.6974V46.5568H48.8161V51.0661C48.8111 52.4531 49.87 53.1243 51.0433 53.0994C51.5156 53.0945 51.8338 53.005 52.0078 52.9403L51.7393 51.7124C51.6399 51.7322 51.456 51.777 51.2173 51.777C50.7351 51.777 50.3026 51.6179 50.3026 50.7578V46.5568H51.8686V45.3636Z" fill="black"/>
<rect x="0.5" y="64.5" width="295" height="33" rx="7.5" fill="white" stroke="#BDBDBD"/>
<path d="M1.11861 127H2.65483V122.56H6.98011V121.243H2.65483V118.141H7.43253V116.818H1.11861V127ZM9.20241 127H10.6889V119.364H9.20241V127ZM9.95312 118.185C10.4652 118.185 10.8928 117.788 10.8928 117.3C10.8928 116.813 10.4652 116.411 9.95312 116.411C9.43608 116.411 9.01349 116.813 9.01349 117.3C9.01349 117.788 9.43608 118.185 9.95312 118.185ZM14.1752 122.466C14.1752 121.248 14.921 120.552 15.9551 120.552C16.9643 120.552 17.5758 121.213 17.5758 122.322V127H19.0623V122.143C19.0623 120.254 18.0233 119.264 16.4622 119.264C15.3137 119.264 14.563 119.796 14.21 120.607H14.1156V119.364H12.6887V127H14.1752V122.466ZM21.0559 127H22.5424V119.364H21.0559V127ZM21.8066 118.185C22.3187 118.185 22.7463 117.788 22.7463 117.3C22.7463 116.813 22.3187 116.411 21.8066 116.411C21.2896 116.411 20.867 116.813 20.867 117.3C20.867 117.788 21.2896 118.185 21.8066 118.185ZM30.2646 121.228C29.9563 120.04 29.0266 119.264 27.3761 119.264C25.6509 119.264 24.4279 120.174 24.4279 121.526C24.4279 122.61 25.0842 123.331 26.516 123.649L27.8086 123.933C28.5444 124.097 28.8874 124.425 28.8874 124.902C28.8874 125.494 28.256 125.956 27.2816 125.956C26.3917 125.956 25.82 125.573 25.641 124.822L24.2042 125.041C24.4528 126.393 25.5763 127.154 27.2915 127.154C29.136 127.154 30.4137 126.175 30.4137 124.793C30.4137 123.714 29.7276 123.048 28.3256 122.724L27.1126 122.446C26.2724 122.247 25.9094 121.964 25.9144 121.447C25.9094 120.86 26.5458 120.442 27.391 120.442C28.3157 120.442 28.7433 120.955 28.9173 121.467L30.2646 121.228ZM33.5346 122.466C33.5346 121.248 34.3052 120.552 35.3642 120.552C36.3883 120.552 36.9998 121.203 36.9998 122.322V127H38.4863V122.143C38.4863 120.239 37.4423 119.264 35.8713 119.264C34.6831 119.264 33.9672 119.781 33.6092 120.607H33.5147V116.818H32.0481V127H33.5346V122.466ZM44.2944 127H45.7461V125.812H45.8704C46.1388 126.299 46.6857 127.149 48.0778 127.149C49.9272 127.149 51.2695 125.668 51.2695 123.197C51.2695 120.721 49.9073 119.264 48.0629 119.264C46.646 119.264 46.1339 120.129 45.8704 120.602H45.7809V116.818H44.2944V127ZM45.7511 123.182C45.7511 121.586 46.4471 120.527 47.7447 120.527C49.092 120.527 49.7681 121.665 49.7681 123.182C49.7681 124.713 49.0721 125.881 47.7447 125.881C46.467 125.881 45.7511 124.788 45.7511 123.182ZM53.6049 129.864C54.8329 129.864 55.6085 129.222 56.051 128.019L59.2079 119.379L57.6021 119.364L55.6681 125.29H55.5886L53.6547 119.364H52.0637L54.8578 127.099L54.6738 127.607C54.296 128.621 53.764 128.705 52.9487 128.482L52.5907 129.7C52.7697 129.779 53.1575 129.864 53.6049 129.864Z" fill="black"/>
<path d="M20.375 161C23.4773 161 25.2273 159.071 25.2273 155.889C25.2273 152.727 23.4773 150.818 20.5142 150.818H17.233V161H20.375ZM18.4659 159.906V151.912H20.4347C22.821 151.912 24.0341 153.423 24.0341 155.889C24.0341 158.375 22.821 159.906 20.2955 159.906H18.4659ZM30.3381 161.159C31.8892 161.159 33.0227 160.384 33.3807 159.23L32.2472 158.912C31.9489 159.707 31.2578 160.105 30.3381 160.105C28.9609 160.105 28.0114 159.215 27.9567 157.58H33.5V157.082C33.5 154.239 31.8097 153.264 30.2188 153.264C28.1506 153.264 26.7784 154.895 26.7784 157.241C26.7784 159.588 28.1307 161.159 30.3381 161.159ZM27.9567 156.565C28.0362 155.377 28.8764 154.318 30.2188 154.318C31.4915 154.318 32.3068 155.273 32.3068 156.565H27.9567ZM38.3871 161.159C40.0774 161.159 41.1911 160.125 41.3899 158.773H40.2166C39.9979 159.608 39.3018 160.105 38.3871 160.105C36.995 160.105 36.1001 158.952 36.1001 157.182C36.1001 155.452 37.0149 154.318 38.3871 154.318C39.4212 154.318 40.0376 154.955 40.2166 155.651H41.3899C41.1911 154.219 39.978 153.264 38.3672 153.264C36.299 153.264 34.9268 154.895 34.9268 157.222C34.9268 159.509 36.2393 161.159 38.3871 161.159ZM46.3068 161.159C47.858 161.159 48.9915 160.384 49.3494 159.23L48.2159 158.912C47.9176 159.707 47.2266 160.105 46.3068 160.105C44.9297 160.105 43.9801 159.215 43.9254 157.58H49.4688V157.082C49.4688 154.239 47.7784 153.264 46.1875 153.264C44.1193 153.264 42.7472 154.895 42.7472 157.241C42.7472 159.588 44.0994 161.159 46.3068 161.159ZM43.9254 156.565C44.005 155.377 44.8452 154.318 46.1875 154.318C47.4602 154.318 48.2756 155.273 48.2756 156.565H43.9254ZM51.2536 161H52.4268V156.227C52.4268 155.109 53.2422 154.318 54.157 154.318C55.0469 154.318 55.6683 154.9 55.6683 155.77V161H56.8615V156.028C56.8615 155.044 57.478 154.318 58.5518 154.318C59.3871 154.318 60.103 154.761 60.103 155.889V161H61.2763V155.889C61.2763 154.094 60.3118 153.264 58.9496 153.264C57.8558 153.264 57.0554 153.766 56.6626 154.557H56.5831C56.2053 153.741 55.5391 153.264 54.5348 153.264C53.5405 153.264 52.8047 153.741 52.4865 154.557H52.3871V153.364H51.2536V161ZM63.5806 161H64.7141V159.827H64.8533C65.1119 160.244 65.609 161.159 67.0806 161.159C68.9897 161.159 70.3221 159.628 70.3221 157.202C70.3221 154.795 68.9897 153.264 67.0607 153.264C65.5692 153.264 65.1119 154.179 64.8533 154.577H64.7539V150.818H63.5806V161ZM64.734 157.182C64.734 155.472 65.4897 154.318 66.9215 154.318C68.413 154.318 69.1488 155.571 69.1488 157.182C69.1488 158.812 68.3931 160.105 66.9215 160.105C65.5096 160.105 64.734 158.912 64.734 157.182ZM75.3185 161.159C76.8697 161.159 78.0032 160.384 78.3612 159.23L77.2276 158.912C76.9293 159.707 76.2383 160.105 75.3185 160.105C73.9414 160.105 72.9918 159.215 72.9371 157.58H78.4805V157.082C78.4805 154.239 76.7901 153.264 75.1992 153.264C73.131 153.264 71.7589 154.895 71.7589 157.241C71.7589 159.588 73.1112 161.159 75.3185 161.159ZM72.9371 156.565C73.0167 155.377 73.8569 154.318 75.1992 154.318C76.4719 154.318 77.2873 155.273 77.2873 156.565H72.9371ZM80.2653 161H81.4386V156.168C81.4386 155.134 82.2539 154.378 83.3675 154.378C83.6808 154.378 84.0039 154.438 84.0835 154.457V153.264C83.9492 153.254 83.641 153.244 83.467 153.244C82.5522 153.244 81.7567 153.761 81.4783 154.517H81.3988V153.364H80.2653V161ZM89.3919 161H95.8152V159.906H91.0822V159.827L93.3691 157.381C95.1191 155.506 95.6362 154.631 95.6362 153.503C95.6362 151.932 94.3635 150.679 92.5737 150.679C90.7889 150.679 89.4316 151.892 89.4316 153.682H90.6049C90.6049 152.523 91.3556 151.753 92.5339 151.753C93.6376 151.753 94.4828 152.429 94.4828 153.503C94.4828 154.442 93.9309 155.138 92.7527 156.426L89.3919 160.105V161ZM101.189 161.139C103.437 161.139 104.729 159.235 104.729 155.909C104.729 152.608 103.417 150.679 101.189 150.679C98.9622 150.679 97.6497 152.608 97.6497 155.909C97.6497 159.235 98.9423 161.139 101.189 161.139ZM101.189 160.045C99.7079 160.045 98.8429 158.559 98.8429 155.909C98.8429 153.264 99.7179 151.753 101.189 151.753C102.661 151.753 103.536 153.264 103.536 155.909C103.536 158.559 102.671 160.045 101.189 160.045ZM106.618 161H113.042V159.906H108.309V159.827L110.596 157.381C112.346 155.506 112.863 154.631 112.863 153.503C112.863 151.932 111.59 150.679 109.8 150.679C108.015 150.679 106.658 151.892 106.658 153.682H107.831C107.831 152.523 108.582 151.753 109.76 151.753C110.864 151.753 111.709 152.429 111.709 153.503C111.709 154.442 111.157 155.138 109.979 156.426L106.618 160.105V161ZM118.675 150.818H117.442L114.896 152.509V153.761L117.382 152.111H117.442V161H118.675V150.818Z" fill="black"/>
<path d="M258 138H288C292.418 138 296 141.582 296 146V164C296 168.418 292.418 172 288 172H258V138Z" fill="#F2F2F2"/>
<path d="M272 153L277 157L282 153" stroke="#BDBDBD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="0.5" y="138.5" width="295" height="33" rx="7.5" stroke="#BDBDBD"/>
<path d="M110 212H140C144.418 212 148 215.582 148 220V238C148 242.418 144.418 246 140 246H110V212Z" fill="#F2F2F2"/>
<path d="M124 227L129 231L134 227" stroke="#BDBDBD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="0.5" y="212.5" width="148" height="33" rx="7.5" stroke="#BDBDBD"/>
<path d="M19.0824 235H20.3551L22.6023 226.886H22.6818L24.929 235H26.2017L28.9858 224.818H27.733L25.6051 233.111H25.5057L23.3381 224.818H21.946L19.7784 233.111H19.679L17.5511 224.818H16.2983L19.0824 235ZM32.8537 235.159C34.4048 235.159 35.5384 234.384 35.8963 233.23L34.7628 232.912C34.4645 233.707 33.7734 234.105 32.8537 234.105C31.4766 234.105 30.527 233.215 30.4723 231.58H36.0156V231.082C36.0156 228.239 34.3253 227.264 32.7344 227.264C30.6662 227.264 29.294 228.895 29.294 231.241C29.294 233.588 30.6463 235.159 32.8537 235.159ZM30.4723 230.565C30.5518 229.377 31.392 228.318 32.7344 228.318C34.0071 228.318 34.8224 229.273 34.8224 230.565H30.4723ZM41.0021 235.159C42.5533 235.159 43.6868 234.384 44.0447 233.23L42.9112 232.912C42.6129 233.707 41.9219 234.105 41.0021 234.105C39.625 234.105 38.6754 233.215 38.6207 231.58H44.1641V231.082C44.1641 228.239 42.4737 227.264 40.8828 227.264C38.8146 227.264 37.4425 228.895 37.4425 231.241C37.4425 233.588 38.7947 235.159 41.0021 235.159ZM38.6207 230.565C38.7003 229.377 39.5405 228.318 40.8828 228.318C42.1555 228.318 42.9709 229.273 42.9709 230.565H38.6207ZM45.9489 235H47.1222V232.141L47.9425 231.381L50.8011 235H52.2926L48.8274 230.625L52.054 227.364H50.6023L47.2614 230.764H47.1222V224.818H45.9489V235ZM54.7374 224.818H53.5641V235H54.7374V224.818ZM57.642 237.864C58.701 237.864 59.4467 237.302 59.8892 236.114L63.1406 227.384L61.858 227.364L59.75 233.449H59.6705L57.5625 227.364H56.2898L59.1136 235.04L58.8949 235.636C58.4673 236.8 57.9403 236.909 57.0852 236.69L56.7869 237.724C56.9062 237.784 57.2443 237.864 57.642 237.864Z" fill="black"/>
<path d="M1.11861 201H2.65483V197.42H4.7429C7.1044 197.42 8.27273 195.994 8.27273 194.114C8.27273 192.24 7.11435 190.818 4.74787 190.818H1.11861V201ZM2.65483 196.118V192.136H4.58381C6.10511 192.136 6.72656 192.961 6.72656 194.114C6.72656 195.268 6.10511 196.118 4.60369 196.118H2.65483ZM13.1499 201.154C14.8153 201.154 15.9936 200.334 16.3317 199.091L14.9247 198.837C14.6562 199.558 14.0099 199.926 13.1648 199.926C11.892 199.926 11.0369 199.101 10.9972 197.629H16.4261V197.102C16.4261 194.343 14.7756 193.264 13.0455 193.264C10.9176 193.264 9.51562 194.885 9.51562 197.232C9.51562 199.603 10.8977 201.154 13.1499 201.154ZM11.0021 196.516C11.0618 195.432 11.8473 194.492 13.0554 194.492C14.2088 194.492 14.9645 195.347 14.9695 196.516H11.0021ZM18.0755 201H19.562V196.337C19.562 195.337 20.3326 194.616 21.3865 194.616C21.6948 194.616 22.0428 194.671 22.1621 194.706V193.284C22.013 193.264 21.7196 193.249 21.5307 193.249C20.6358 193.249 19.8702 193.756 19.5918 194.577H19.5123V193.364H18.0755V201ZM23.4485 201H24.935V193.364H23.4485V201ZM24.1992 192.185C24.7113 192.185 25.1388 191.788 25.1388 191.3C25.1388 190.813 24.7113 190.411 24.1992 190.411C23.6822 190.411 23.2596 190.813 23.2596 191.3C23.2596 191.788 23.6822 192.185 24.1992 192.185ZM30.1515 201.154C32.3042 201.154 33.7111 199.578 33.7111 197.217C33.7111 194.84 32.3042 193.264 30.1515 193.264C27.9988 193.264 26.5918 194.84 26.5918 197.217C26.5918 199.578 27.9988 201.154 30.1515 201.154ZM30.1564 199.906C28.7495 199.906 28.0932 198.678 28.0932 197.212C28.0932 195.75 28.7495 194.507 30.1564 194.507C31.5534 194.507 32.2097 195.75 32.2097 197.212C32.2097 198.678 31.5534 199.906 30.1564 199.906ZM38.229 201.149C39.6211 201.149 40.168 200.299 40.4364 199.812H40.5607V201H42.0124V190.818H40.5259V194.602H40.4364C40.168 194.129 39.6609 193.264 38.239 193.264C36.3945 193.264 35.0373 194.721 35.0373 197.197C35.0373 199.668 36.3746 201.149 38.229 201.149ZM38.5572 199.881C37.2298 199.881 36.5387 198.713 36.5387 197.182C36.5387 195.665 37.2148 194.527 38.5572 194.527C39.8548 194.527 40.5508 195.586 40.5508 197.182C40.5508 198.788 39.8398 199.881 38.5572 199.881Z" fill="black"/>
<path d="M17.233 87H18.4659V83.0227H20.6932C20.7827 83.0227 20.8672 83.0227 20.9517 83.0178L23.0994 87H24.5312L22.2294 82.794C23.527 82.3516 24.1335 81.2926 24.1335 79.9403C24.1335 78.1406 23.0597 76.8182 20.6733 76.8182H17.233V87ZM18.4659 81.9091V77.9119H20.6335C22.2841 77.9119 22.9205 78.7173 22.9205 79.9403C22.9205 81.1634 22.2841 81.9091 20.6534 81.9091H18.4659ZM26.0289 89.8636H27.2022V85.8267H27.3017C27.5602 86.2443 28.0574 87.1591 29.5289 87.1591C31.438 87.1591 32.7704 85.6278 32.7704 83.2017C32.7704 80.7955 31.438 79.2642 29.5091 79.2642C28.0176 79.2642 27.5602 80.179 27.3017 80.5767H27.1625V79.3636H26.0289V89.8636ZM27.1824 83.1818C27.1824 81.4716 27.938 80.3182 29.3699 80.3182C30.8613 80.3182 31.5971 81.571 31.5971 83.1818C31.5971 84.8125 30.8414 86.1051 29.3699 86.1051C27.9579 86.1051 27.1824 84.9119 27.1824 83.1818ZM38.1199 76.8182H36.8869L34.3414 78.5085V79.7614L36.8272 78.1108H36.8869V87H38.1199V76.8182ZM44.3691 87.1392C46.6163 87.1392 47.9089 85.2351 47.9089 81.9091C47.9089 78.608 46.5964 76.679 44.3691 76.679C42.1419 76.679 40.8294 78.608 40.8294 81.9091C40.8294 85.2351 42.122 87.1392 44.3691 87.1392ZM44.3691 86.0455C42.8876 86.0455 42.0225 84.5589 42.0225 81.9091C42.0225 79.2642 42.8975 77.7528 44.3691 77.7528C45.8407 77.7528 46.7157 79.2642 46.7157 81.9091C46.7157 84.5589 45.8507 86.0455 44.3691 86.0455ZM50.3176 87.0795C50.8098 87.0795 51.2125 86.6768 51.2125 86.1847C51.2125 85.6925 50.8098 85.2898 50.3176 85.2898C49.8255 85.2898 49.4228 85.6925 49.4228 86.1847C49.4228 86.6768 49.8255 87.0795 50.3176 87.0795ZM56.2637 87.1392C58.5108 87.1392 59.8034 85.2351 59.8034 81.9091C59.8034 78.608 58.4909 76.679 56.2637 76.679C54.0364 76.679 52.7239 78.608 52.7239 81.9091C52.7239 85.2351 54.0165 87.1392 56.2637 87.1392ZM56.2637 86.0455C54.7821 86.0455 53.9171 84.5589 53.9171 81.9091C53.9171 79.2642 54.7921 77.7528 56.2637 77.7528C57.7353 77.7528 58.6103 79.2642 58.6103 81.9091C58.6103 84.5589 57.7452 86.0455 56.2637 86.0455ZM65.0137 87.1392C67.2608 87.1392 68.5534 85.2351 68.5534 81.9091C68.5534 78.608 67.2409 76.679 65.0137 76.679C62.7864 76.679 61.4739 78.608 61.4739 81.9091C61.4739 85.2351 62.7665 87.1392 65.0137 87.1392ZM65.0137 86.0455C63.5321 86.0455 62.6671 84.5589 62.6671 81.9091C62.6671 79.2642 63.5421 77.7528 65.0137 77.7528C66.4853 77.7528 67.3603 79.2642 67.3603 81.9091C67.3603 84.5589 66.4952 86.0455 65.0137 86.0455ZM73.7637 87.1392C76.0108 87.1392 77.3034 85.2351 77.3034 81.9091C77.3034 78.608 75.9909 76.679 73.7637 76.679C71.5364 76.679 70.2239 78.608 70.2239 81.9091C70.2239 85.2351 71.5165 87.1392 73.7637 87.1392ZM73.7637 86.0455C72.2821 86.0455 71.4171 84.5589 71.4171 81.9091C71.4171 79.2642 72.2921 77.7528 73.7637 77.7528C75.2353 77.7528 76.1103 79.2642 76.1103 81.9091C76.1103 84.5589 75.2452 86.0455 73.7637 86.0455ZM79.7122 87.0795C80.2044 87.0795 80.6071 86.6768 80.6071 86.1847C80.6071 85.6925 80.2044 85.2898 79.7122 85.2898C79.22 85.2898 78.8173 85.6925 78.8173 86.1847C78.8173 86.6768 79.22 87.0795 79.7122 87.0795ZM85.6582 87.1392C87.9054 87.1392 89.198 85.2351 89.198 81.9091C89.198 78.608 87.8855 76.679 85.6582 76.679C83.4309 76.679 82.1184 78.608 82.1184 81.9091C82.1184 85.2351 83.411 87.1392 85.6582 87.1392ZM85.6582 86.0455C84.1767 86.0455 83.3116 84.5589 83.3116 81.9091C83.3116 79.2642 84.1866 77.7528 85.6582 77.7528C87.1298 77.7528 88.0048 79.2642 88.0048 81.9091C88.0048 84.5589 87.1397 86.0455 85.6582 86.0455ZM94.4082 87.1392C96.6554 87.1392 97.948 85.2351 97.948 81.9091C97.948 78.608 96.6355 76.679 94.4082 76.679C92.1809 76.679 90.8684 78.608 90.8684 81.9091C90.8684 85.2351 92.161 87.1392 94.4082 87.1392ZM94.4082 86.0455C92.9267 86.0455 92.0616 84.5589 92.0616 81.9091C92.0616 79.2642 92.9366 77.7528 94.4082 77.7528C95.8798 77.7528 96.7548 79.2642 96.7548 81.9091C96.7548 84.5589 95.8897 86.0455 94.4082 86.0455ZM103.158 87.1392C105.405 87.1392 106.698 85.2351 106.698 81.9091C106.698 78.608 105.385 76.679 103.158 76.679C100.931 76.679 99.6184 78.608 99.6184 81.9091C99.6184 85.2351 100.911 87.1392 103.158 87.1392ZM103.158 86.0455C101.677 86.0455 100.812 84.5589 100.812 81.9091C100.812 79.2642 101.687 77.7528 103.158 77.7528C104.63 77.7528 105.505 79.2642 105.505 81.9091C105.505 84.5589 104.64 86.0455 103.158 86.0455Z" fill="black"/>
<path d="M273.455 17C276.557 17 278.396 15.081 278.396 11.8991C278.396 8.72727 276.557 6.81818 273.524 6.81818H270.004V17H273.455ZM271.849 15.4041V8.41406H273.42C275.488 8.41406 276.567 9.56747 276.567 11.8991C276.567 14.2408 275.488 15.4041 273.365 15.4041H271.849ZM283.4 17.1491C285.637 17.1491 287.059 15.5732 287.059 13.2116C287.059 10.8452 285.637 9.2642 283.4 9.2642C281.163 9.2642 279.741 10.8452 279.741 13.2116C279.741 15.5732 281.163 17.1491 283.4 17.1491ZM283.41 15.7074C282.172 15.7074 281.566 14.6037 281.566 13.2067C281.566 11.8097 282.172 10.6911 283.41 10.6911C284.628 10.6911 285.235 11.8097 285.235 13.2067C285.235 14.6037 284.628 15.7074 283.41 15.7074ZM290.387 12.5256C290.387 11.4219 291.053 10.7855 292.002 10.7855C292.932 10.7855 293.489 11.397 293.489 12.4162V17H295.289V12.1378C295.294 10.3082 294.249 9.2642 292.673 9.2642C291.53 9.2642 290.744 9.81108 290.396 10.6612H290.307V9.36364H288.587V17H290.387V12.5256ZM300.499 17.1491C302.279 17.1491 303.502 16.2791 303.82 14.9517L302.139 14.7628C301.896 15.4091 301.299 15.7472 300.524 15.7472C299.36 15.7472 298.59 14.9815 298.575 13.674H303.894V13.1222C303.894 10.4425 302.284 9.2642 300.404 9.2642C298.217 9.2642 296.79 10.87 296.79 13.2266C296.79 15.6229 298.197 17.1491 300.499 17.1491ZM298.58 12.4609C298.634 11.4865 299.355 10.6662 300.429 10.6662C301.463 10.6662 302.159 11.4219 302.169 12.4609H298.58Z" fill="#828282"/>
</svg>


            </div>`

            window.scrollTo(0, 300);
           this.faqPosition = {}
            this.showFaq = true
            this.showMenuHelper = false
             this.modalFaq['style']['bottom'] = '-225px'
            this.faqPosition['top'] = '300px';
            this.faqPosition['width'] = '350px';
            this.faqPosition['left'] = '1000px';
            this.modalFaq['style']['max-width'] = '300px'
            this.modalFaq['style']['left'] = '-350px'
            this.modalFaq['header'] = 'Buat budget menabung'
            this.modalFaq['body'] = `Di setiap bulannya kamu bisa membuat 
budget khusus untuk hal yang kamu inginkan.`
        },
         closeModal(event) {

             let profile_menu = this.$refs.profileMenu;
             let subCategoryDetail = this.$refs.subCategoryDetail;
            
            let target = event.target;
            

            if(profile_menu != undefined) {
                 if (profile_menu !== target && !profile_menu.contains(target)) {
                    this.showProfileMenu = false
                }
            }

            
         }

    },
    computed: {

       
        ...mapGetters({
            budgets: "budget/budget",
            categorys: "category/categories",
             // categories: "category/categories",
            sub_categories: "sub_category/sub_categories",
            subCategoryById: 'sub_category/subCategoryById',
            activities: 'activity/activities',
            user: 'user/user',
            budgetsById: 'budget/fetchBudgetById',
        }),
        categories() {

                const filteredCat = this.categorys.filter( cat => {
                    const date = this.$moment(cat['created_at']).format('YYYY-MM')

                    // console.log(date);
                    // console.log(this.filterCategoryByDate);
                    return (date.includes(this.filterCategoryByMonth));
                })
               

                return filteredCat;
        },
        savingGoalsBar() {
            const percentage = (this.totalSubAvailable / this.sub_category_detail.amount) * 100;

            return parseInt(percentage)
        },

        periodSaving() {
            const sub_detail = this.sub_category_detail;
            const available = this.totalSubAvailable;
            const currentDate = new Date();
            const periodDate = new Date(this.sub_category_detail.finishBy);
            const days = Math.abs(periodDate-currentDate)/(1000*3600*24);

            if(sub_detail.period == "day") {
                

                const total = (sub_detail.amount - available) / Math.round(days);
                
                return total
            }

            else if(sub_detail.period == "weekly") {
                  const total = (sub_detail.amount - available) / Math.round((days/7))

                  return total
            }
            else if(sub_detail.period == "month") {
                 const total = (sub_detail.amount - available) / (Math.round((days/30)))

                 return total;
            }

            return ""


        },
        total_income() {

            const categories = this.categories.map(obj => ({

                income: obj['sub_categorys'].length != 0 ? obj['sub_categorys'].reduce((acc, sub) => {
                     var total = 0;
                    if(sub.activities.length != 0) {
                        total = sub.activities.reduce((a, act) => {

                            return a + parseInt(act.income)
                        }, 0)
                    }
                    // console.log(total);
                    return acc+parseInt(total)
                },0): 0
                
                
                })
            )


            console.log(categories);
            const total = categories.reduce((acc, obj) => {
                return acc + obj.income
            }, 0)
            



            return  total;

        },
        totalSpent() {
            
            const total = this.sub_category_detail['activities'].reduce((total, obj) => {
                return total + parseInt(obj['expense']);
            }, 0);

            return total
        },
        totalAmount() {
            const total = this.categories.reduce((total, cat) => {
                const amount = cat['sub_categorys'].reduce((amounts, sub)=> {
                    return amounts+parseInt(sub['amount']);
                }, 0);

                return total + parseInt(amount);
            }, 0);

            // console.log('total amount', total);
            return total;
        },
        totalSaving() {

            const total = this.totalAmount - (this.total_activity);
            
            if(isNaN(total)) {
                return 0
            }

            if (total < 0) {
                return 0
            }

            return total
        },

        total_expense() {

            const total = this.categories.reduce((total, cat) => {
                const expense = cat['sub_categorys'].reduce((expense, sub) => {
                    let total = 0;
                    sub['activities'].forEach( function(element, index) {
                        total += parseInt(element['expense']);
                    });

                    return expense + parseInt(total);
                }, 0)

                return total + parseInt(expense);
            }, 0)

            return total;
        },

        totalSubAvailable(){
            const total = this.lastMonthBudget + this.currentMonthBudget - this.totalSpent

            return total 
        },
        lastMonthBudget() {
            const category = this.categorys.filter(cat => {
                const categoriesDate = new Date(cat['created_at']);
                const currentDate = new Date();
                // console.log(categoriesDate.getMonth()+1)
                // console.log((currentDate.getMonth()+1)-1)

                return (categoriesDate.getMonth()+1 == currentDate.getMonth()) && (categoriesDate.getFullYear() == currentDate.getFullYear());

            });
            const total = category.length > 0 ?category.reduce((total, cat ) => {
                let totalSub = cat['sub_categorys'].reduce((totalLeftMonth, sub) => {
                    let activity = 0 

                    sub['activities'].forEach( function(element, index) {
                        activity += parseInt(element['income'] - element['expense']);
                    });

                    return totalLeftMonth + parseInt(sub['budgeted'] + activity)
                }, 0)

                return total + parseInt(totalSub);
            }, 0) : 0;

            // console.log(category);

            return total;
        },

        currentMonthBudget(){
            const category = this.categories.filter(cat => {
                const categoriesDate = new Date(cat['created_at']);
                const currentDate = new Date();


                return (categoriesDate.getMonth()+1 == currentDate.getMonth()+1) && (categoriesDate.getFullYear() == currentDate.getFullYear());

            })
            console.table(category);

            const budgeted = category.reduce((total, obj) => {
                let totalSub = 0
                obj['sub_categorys'].forEach( function(element, index) {
                    total += parseInt(element['budgeted'])
                }, 0);

                return total + parseInt(totalSub);
            }, 0)

            return budgeted
        },
     
        sub_category_detail() {
            
            return this.sub_categories.find(item => item.id == this.$store.state.modal.showSubCategoryId);
           
        },
        total_budget() {
            let total = this.categories.length > 0 ? this.categories.reduce((totalBudget , cat) => {
                
                let total = 0;
                cat.sub_categorys.forEach( function(element, index) {
                    total += parseInt(element['budgeted']);
                });

                return totalBudget + parseInt(total);

            }, 0): 0;
            // let total = this.sub_categories != null ? this.sub_categories.reduce((acc, obj) => {
            //     return acc + obj.budgeted;
            // }, 0) : 0;

            return total;
        }, 

        total_activity() {
            let total = this.categories.length > 0 ? this.categories.reduce((totalAct, cat ) => {
                let sum = cat.sub_categorys.reduce((total, sub) => {
                    let total_activity = 0
                    sub.activities.forEach( function(element, index) {
                        total_activity += parseInt(element['income'] - element['expense']);
                    });

                    return total + parseInt(total_activity);
                }, 0);

                return totalAct + parseInt(sum);
            }, 0): 0;

            return total 

            
        },

        total_available() {
            // console.log()
            return this.total_budget + this.total_activity;
        },
        daily_spend_limit() {

            const date = new Date()
            const day = new Date(date.getFullYear(), date.getMonth()+1, 0).getDate();

            const daily_spend = this.total_available / day;
            return daily_spend;
        },
        categoryChart() {

            const category = this.categories.map(
                cat => ({
                    ...cat,
                    chartData: cat.sub_categorys.reduce((totalAll, sub) => {
                        const activity = sub['activities'].reduce((total, act) => {
                            return total + parseInt(act['income'] - act['expense'])
                        }, 0);

                        const budgeted = sub['budgeted']

                        return totalAll + parseInt(budgeted + activity);
                    }, 0),
                    bar: ((cat.sub_categorys.reduce((totalAll, sub) => {
                        const activity = sub['activities'].reduce((total, act) => {
                            return total + parseInt(act['income'] - act['expense'])
                        }, 0);

                        const budgeted = sub['budgeted']

                        return totalAll + parseInt(budgeted + activity);
                    }, 0) / this.total_available) * 100)

                })
            )


            return category
        },

        chart() { 
            const chart = []
            this.categoryChart.forEach( function(element, index) {
                // statements

                chart.push(element['chartData']);
            });


            return chart
        },

        label() {
            const label = []
            this.categoryChart.forEach( function(element, index) {
                label.push(element.category_name);
            });

            return label
        },
       

        optionChart() {

            const option = {
                aspectRatio: 1,
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0
                    }
                },
                responsive: true,
                cutoutPercentage: 75,
                legend: {
                    display: false
                },
                title: {
                    display: false
                },
                tooltips: {
                    enabled:true,
                    callbacks: {
                        label: function(tooltipItem, data) {
                            var label = data.labels[tooltipItem.index];
                            var val = data.datasets[tooltipItem.dataset.index].data[tooltipItem.index];

                            return label + `: ${val}`
                        }
                    }
                }

            };
            return option
        },
       
        dataChart() {

        
            
            
            const chartData = {
                labels: this.label,
                datasets: [
                    {   
                        label: ['mantep'],
                        data: this.chart,
                        fill: false,
                    },
                ],

                // These labels appear in the legend and in the tooltips when hovering different arcs
              
            };
            return chartData
        }
    },
    mounted() {
        // this.dataChart
        // const pieChart = document.getElementById("pie-chart");
        // new Chart(pieChart, this.dataChart);
        

      

         document.addEventListener('click', this.closeModal);
  
        
        this.updateSavingGoals()
        
        
        
    },
       created() {
          if (this.budgets.length == 0) {
                this.fetchData();
            }
            
            if(this.$route.name == 'Dashboard') {
                
            }
            this.fetchCategoryData(localStorage.getItem("budget_id"));
         
            const dateNow = this.$moment().format('YYYY-MM');

            this.filterCategoryByMonth = dateNow;
            // this.categories = this.category
        this.form.user = this.user;
        // console.log(this.sub_category_detail);
        
        this.updateChart();

       
    },
    mixins: [BudgetDetail],

    filters: {
        parsingMonth(value) {
            if (value !== undefined || !value == null) {
                const date = new Date(value);


                return date.toLocaleString('default', {
                    day: 'numeric',
                    month: 'long',
                    year: 'numeric',
                    
                })
               
            }
            


        }
    },
    watch:{
        'form.user.password_confirmation': function(value) {
            if(this.form.user.password != value) {
                this.error = "Password not same"
                this.notCorrectPassword = true
            }
            else {
                this.error = null
                this.notCorrectPassword = false 
            }
        }
    }
};
</script>

<style lang="css">
.card {
    background-image: url("../../assets/images/icon_box.png");
}

td:not(:first-child) {
  padding-bottom:.5rem;
      
}

select option:hover {
    background-image: url("../../assets/images/icon_box.png");
    overflow-y: scroll;
    height: 50px;
}

#modal-faq {
    background-repeat: no-repeat;
    overflow: hidden;
    max-width: 250px;
    background-size: 100% 100%;
    z-index: 10px;
    position: absolute;
}
</style>
