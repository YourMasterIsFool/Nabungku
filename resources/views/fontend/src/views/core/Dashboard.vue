<template>
    <div id="dashboard" class="">


        <div
            class="bg-gray-100 h-screen w-screen fixed top-0 left-0"
            style="z-index:-100;"
        ></div>
        <div id="main-content" class="grid grid-cols-12  ">
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
                                    type="date"
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
                                            <a
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
                                            </a>
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
                        <div class="col-span-6">
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
                                                    <option :value="sub_category.id" class="py-3 hover:bg-green-100" v-for="sub_category in category.sub_categorys">
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
                                    <div class="col-span-4 flex justify-center">
                                        <img
                                            :src="icon_calendar"
                                            class="h-40 "
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
                                            @open_sub_detail="subCategoryDetail"
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
                                v-show="showProfileSetting"
                            >
                                <template v-slot:content>
                                    <div
                                        class="flex  items-center justify-center h-screen w-screen"
                                    >
                                        <div
                                            style=""
                                            class="py-8 px-6 w-2/6 rounded-xl bg-white"
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
                                                        showProfileSetting = false
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
                                                    <img
                                                        :src="icon_ayam"
                                                        class="w-24 h-24 rounded-full"
                                                        alt=""
                                                    />
                                                </div>
                                                <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >  
                                                        Name
                                                        
                                                    </label>

                                                    <input
                                                        style="border-width:1px;"
                                                        type="text"
                                                        v-model="form.user.name"
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
                                                        style="border-width:1px;"
                                                        v-model="form.user.email"
                                                        type="text"
                                                        class="px-4 py-2 w-full rounded-xl outline-none border-gray-300 focus:border-blue-300"
                                                    />
                                                </div>
                                                <div class="py-2">
                                                    <label
                                                        for=""
                                                        class="block mb-2 capitalize"
                                                    >
                                                        password
                                                    </label>

                                                    <input
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
                                                    <a
                                                        @click="updateUser()"
                                                        class="uppercase cursor-pointer rounded-2xl font-bold bg-blue-400 hover:bg-blue-500 text-white py-2 px-6"
                                                    >
                                                        save
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                            </modal>

                            <div class="flex items-center">
                                <div class="w-12 flex items-center h-12">
                                    <img
                                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWTnqL32A0v5-KSy4vhh8wbfOKWnjAfG1duA&usqp=CAU"
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
                            <a
                                class="cursor-pointer transition-all duration-500 "
                                :style="[
                                    showProfileMenu
                                        ? { transform: 'rotate(0deg)' }
                                        : { transform: 'rotate(180deg)' }
                                ]"
                                @click="showProfileMenu = !showProfileMenu"
                                ref="profileMenu"
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
                                            @click="fetchCategory(row.id)"
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
                        <div  v-if="showSubCategoryDetail" :class="" class=" mt-4 md:mt-8 relative  bg-gray w-full h-full">
             
                            <div id="sub-category-detail"class="w-full">
                                <div class="header mb-4 flex justify-between w-full">
                                    
                                    <span  style="line-height: 24px;"class="text-black font-medium capitalize text-base">
                                                    {{sub_category_detail.sub_category_name}}
                                                </span>

                                    <a style="font-size: 14px" @click="showSubCategoryDetail = false" class="text-gray-600 cursor-pointer px-4  ">
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
                        <div v-show="showSubCategoryDetail == false" class="mt-4 md:mt-8">
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
                                            total saving
                                        </span>
                                        <span class="font-semibold">
                                            Rp120.000
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
                                                href=""
                                                class="py-4 px-4 block hover:bg-gray-200"
                                                >Add New Transaction</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href=""
                                                class="py-4 px-4 block hover:bg-gray-200"
                                                >Change Category Names</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href=""
                                                class="py-4 px-4 block hover:bg-gray-200"
                                                >Transaction History</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href=""
                                                class="py-4 px-4 block hover:bg-gray-200"
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
                                    style="font-size:50px; right:0px; bottom:16px;"
                                    class="absolute"
                                >
                                    <svg
                                        width="64"
                                        height="64"
                                        viewBox="0 0 64 64"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <g filter="url(#filter0_d)">
                                            <path
                                                d="M28 4C14.7448 4 4 14.7443 4 27.9988C4 41.2533 14.7448 51.9976 28 51.9976C31.8304 52.0029 35.606 51.0876 39.0088 49.3289L48.1912 51.8896C48.7035 52.0326 49.2446 52.0368 49.759 51.9018C50.2735 51.7668 50.7428 51.4974 51.1189 51.1214C51.495 50.7453 51.7644 50.276 51.8994 49.7616C52.0344 49.2471 52.0302 48.7061 51.8872 48.1938L49.324 39.019C51.0871 35.6135 52.005 31.8337 52 27.9988C52 14.7443 41.2552 4 28 4ZM28 7.59982C33.4104 7.59982 38.5992 9.74899 42.425 13.5745C46.2507 17.4001 48.4 22.5886 48.4 27.9988C48.4 31.5266 47.5048 34.9176 45.8248 37.9271L45.4648 38.5751L48.1336 48.1362L38.5648 45.4675L37.9168 45.8275C35.1943 47.3411 32.1613 48.2111 29.0504 48.3709C25.9394 48.5307 22.8333 47.976 19.97 46.7493C17.1067 45.5226 14.5624 43.6565 12.5321 41.2941C10.5019 38.9318 9.0396 36.1359 8.25745 33.1208C7.4753 30.1057 7.39404 26.9516 8.01991 23.9003C8.64577 20.8489 9.96214 17.9814 11.8681 15.5177C13.774 13.0539 16.2188 11.0593 19.0152 9.68681C21.8115 8.31433 24.885 7.60042 28 7.59982Z"
                                                fill="#5E81F4"
                                            />
                                            <path
                                                d="M28 7.59982C33.4104 7.59982 38.5992 9.74899 42.425 13.5745C46.2507 17.4001 48.4 22.5886 48.4 27.9988C48.4 31.5266 47.5048 34.9176 45.8248 37.9271L45.4648 38.5751L48.1336 48.1362L38.5648 45.4675L37.9168 45.8275C35.1943 47.3411 32.1613 48.2111 29.0504 48.3709C25.9394 48.5307 22.8333 47.976 19.97 46.7493C17.1067 45.5226 14.5624 43.6565 12.5321 41.2941C10.5019 38.9318 9.0396 36.1359 8.25745 33.1208C7.4753 30.1057 7.39404 26.9516 8.01991 23.9003C8.64577 20.8489 9.96214 17.9814 11.8681 15.5177C13.774 13.0539 16.2188 11.0593 19.0152 9.68681C21.8115 8.31433 24.885 7.60042 28 7.59982Z"
                                                fill="#5E81F4"
                                            />
                                        </g>
                                        <path
                                            d="M29.697 37.1013C29.2469 36.6512 28.6364 36.3984 27.9999 36.3984C27.3634 36.3984 26.7529 36.6512 26.3028 37.1013C25.8528 37.5513 25.5999 38.1617 25.5999 38.7982C25.5999 39.4347 25.8528 40.0451 26.3028 40.4952C26.7529 40.9453 27.3634 41.1981 27.9999 41.1981C28.6364 41.1981 29.2469 40.9453 29.697 40.4952C30.147 40.0451 30.3999 39.4347 30.3999 38.7982C30.3999 38.1617 30.147 37.5513 29.697 37.1013Z"
                                            fill="white"
                                        />
                                        <path
                                            d="M32.6668 17.3324C31.4291 16.0947 29.7503 15.3994 27.9999 15.3994C26.2495 15.3994 24.5707 16.0947 23.333 17.3324C22.0953 18.5701 21.3999 20.2487 21.3999 21.9991C21.3999 22.4764 21.5895 22.9343 21.9271 23.2718C22.2647 23.6094 22.7225 23.799 23.1999 23.799C23.6773 23.799 24.1351 23.6094 24.4727 23.2718C24.8103 22.9343 24.9999 22.4764 24.9999 21.9991L25.0167 21.6919C25.0978 20.9289 25.4681 20.2259 26.0516 19.7276C26.6351 19.2293 27.3874 18.9735 28.1537 19.0129C28.9201 19.0522 29.6422 19.3837 30.1716 19.9392C30.701 20.4946 30.9974 21.2318 30.9999 21.9991C30.9999 23.4006 30.6207 24.0342 29.1279 25.5269L28.7223 25.9373C26.9127 27.8212 26.1999 29.1747 26.1999 31.5986C26.1999 32.076 26.3895 32.5338 26.7271 32.8713C27.0647 33.2089 27.5225 33.3985 27.9999 33.3985C28.4773 33.3985 28.9351 33.2089 29.2727 32.8713C29.6103 32.5338 29.7999 32.076 29.7999 31.5986C29.7999 30.1971 30.1791 29.5635 31.6719 28.0708L32.0775 27.6604C33.8871 25.7765 34.5999 24.423 34.5999 21.9991C34.5999 20.2487 33.9045 18.5701 32.6668 17.3324Z"
                                            fill="white"
                                        />
                                        <defs>
                                            <filter
                                                id="filter0_d"
                                                x="0"
                                                y="0"
                                                width="64"
                                                height="64"
                                                filterUnits="userSpaceOnUse"
                                                color-interpolation-filters="sRGB"
                                            >
                                                <feFlood
                                                    flood-opacity="0"
                                                    result="BackgroundImageFix"
                                                />
                                                <feColorMatrix
                                                    in="SourceAlpha"
                                                    type="matrix"
                                                    values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
                                                />
                                                <feOffset dx="4" dy="4" />
                                                <feGaussianBlur
                                                    stdDeviation="4"
                                                />
                                                <feColorMatrix
                                                    type="matrix"
                                                    values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.3 0"
                                                />
                                                <feBlend
                                                    mode="normal"
                                                    in2="BackgroundImageFix"
                                                    result="effect1_dropShadow"
                                                />
                                                <feBlend
                                                    mode="normal"
                                                    in="SourceGraphic"
                                                    in2="effect1_dropShadow"
                                                    result="shape"
                                                />
                                            </filter>
                                        </defs>
                                    </svg>
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
import brand from "../../assets/images/ruang.png";
// import Chart from "chart.js";
import Modal from "../../components/Modal";
import icon_calendar from "../../assets/images/icon_calendar.png";
import icon_box from "../../assets/images/icon_box.png";
import icon_ayam from "../../assets/images/ayam.png";
import Category from "../../components/Category.vue";
import SidebarVue from "../../components/Sidebar.vue";
import CardVue from "../../components/Card.vue";
import DatePicker from 'vue2-datepicker';
import BudgetDetail from '../../mixins/BudgetDetailMixins';
// import FormatLocaleDateMixins from '../../mixins/FormatLocaleDate  Mixins.js';
// import DoughnutChart from '../../components/chart/Dougnut.vue';
import DoughnutChart from '../../components/chart/donat.js';

import { mapActions, mapGetters, mapState } from "vuex";



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
            showSubCategoryDetail: false, 
            budgeted:[],
            showGoals : false,
            activity:[],
            coba: '2019-20-11',

            form: {
                budget: {
                    name_budget: null
                },
                category: {
                    name_category: null
                },
                transaction: {
                    date: null,
                    expense: null,
                    income: null,
                    sub_category:null,
                },
                user: {
                    name: null,
                    email: null,
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
        formatDate(value){
            const date = new Date(value);
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
            console.log(id);
            this.showSubCategoryDetail = true

            if(this.showSubCategoryDetail) {
                this.sub_category_id = id

                if(this.sub_category_detail != null) {
                    this.form.saving_goals = this.sub_category_detail
                    console.log(this.formatDate(this.sub_category_detail.finishBy))
                    console.log(this.sub_category_detail.finishBy)
                }   
            }
        },
        updateUser() {
            const data = this.form.user
            this.userUpdate(data)
            .then(() => {
                this.showProfileSetting = false
            })
        },
        userLogout() {
            this.logout().then(()=> {
                this.$router.replace('/')
            })
        },
        addTransaction() {
            console.log(this.form.transaction);
            const transaction = this.form.transaction
                  

            this.storeActivity(this.form.transaction).then((res)=> {
                     for (const key of Object.keys(transaction)) {
                        if(transaction[key] !== 'date') {
                          transaction[key] = null  
                        }
                        
                        console.log(transaction[key]);
                   }
            });
        },
        createNewBudget(e) {
            const data = {
                name_budget: this.form.budget.new_budget
            };
            this.createBudget(data)
                .then(res => {
                    console.log(res.data);
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

            console.log(key);
            if(this.form.user.password != this.form.user.password_confirmation) {
                console.log("password salah");
                this.error = "password confirmation incorrected"
            }
            else {
                console.log('password benar');
                console.log(this.error);

                this.error = null;
            }
        },
         updateChart() {

            this.categoryChart.forEach( function(element, index) {
                this.chart.push(element);
            });
        },
         closeModal(event) {

             let profile_menu = this.$refs.profileMenu;
            
            let target = event.target;

            if (profile_menu !== target && !profile_menu.contains(target)) {
                this.showProfileMenu = false
            }
            
         }

    },
    computed: {

       
        ...mapGetters({
            budgets: "budget/budget",
            // category: "category/categories",
            categories: 'category/categories',
            sub_categories: "sub_category/sub_categories",
            subCategoryById: 'sub_category/subCategoryById',
            activities: 'activity/activities',
            user: 'user/user',
            budgetsById: 'budget/fetchBudgetById',
        }),
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
                    console.log(total);
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
        totalSubAvailable(){
            const total = this.lastMonthBudget + this.currentMonthBudget - this.totalSpent

            return total 
        },
        lastMonthBudget() {
            const category = this.categories.filter(cat => {
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

            console.log(category);

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
            
            return this.sub_categories.find(item => item.id == this.sub_category_id);
           
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
            console.log()
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

        
        this.updateSavingGoals()
      
        if (this.categories.length == 0) {
            this.fetchCategoryData(localStorage.getItem("budget_id"));
        }
        if (this.budgets.length == 0) {
                this.fetchData();
            }
    },
       created() {
          if (this.budgets.length == 0) {
                this.fetchData();
            }
        this.form.user = this.user;
        console.log(this.sub_category_detail);
        
        this.updateChart();

        document.addEventListener('click', this.closeModal);
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
</style>
