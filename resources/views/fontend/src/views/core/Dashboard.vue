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
                                <a
                                    class="bg-white text-gray-600 hover:text-gray-800 duration-300 transition-all flex justify-center items-center py-2 w-full rounded-xl col-span-1"
                                >
                                    <i class="far fa-bell"></i>
                                </a>
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
                                            class="form-group grid  grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >date</label
                                            >
                                            <input
                                                type="date"
                                                value=""
                                                style="border-width:1px;"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-3 "
                                            />
                                        </div>
                                        <div
                                            class="form-group grid gap-1 grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >expense</label
                                            >
                                            <input
                                                type="text"
                                                value=""
                                                style="border-width:1px;"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-3 "
                                            />
                                        </div>
                                    </div>
                                    <div
                                        class="col-span-5 grid grid-cols-1 gap-4"
                                    >
                                        <div
                                            class="form-group grid gap-1 grid-cols-1"
                                        >
                                            <label
                                                for=""
                                                class="text-xs capitalize"
                                                >category</label
                                            >
                                            <select
                                                style="border-width:1px;"
                                                class="w-full text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-4 "
                                            ></select>
                                        </div>
                                        <div
                                            class="form-group grid gap-1 grid-cols-1"
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
                                                    type="text"
                                                    value=""
                                                    style="border-width:1px;"
                                                    class="w-full col-span-3 text-gray-600 bg-gray-50 rounded-lg border-gray-200 text-xs py-1 focus:outline-none px-3 "
                                                />
                                                <button
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
                    <div class="w-full py-8 text-sm">
                        <div class="bg-white rounded-xl ">
                            <div
                                style="border-bottom-width:1px;"
                                class="header p-6 relative flex items-center  border-gray-200"
                            >
                                <a href="" class="">
                                    <i class="pr-4 fas fa-plus"> </i>
                                    <span class="font-semibold capitalize">
                                        category group
                                    </span>
                                </a>
                                <card-vue
                                    id="card"
                                    style="bottom: -1px;"
                                    :style="{ backgroundImage: icon_box }"
                                    class=" absolute"
                                >
                                    <template v-slot:content>
                                        <div class="relative">
                                            <div class="absolute">
                                                <div
                                                    style="z-index:-100px;"
                                                    :style="{
                                                        'background-image': icon_box
                                                    }"
                                                    class="background relative"
                                                >
                                                    <div
                                                        style="top:16px;"
                                                        class=" w-full p-4"
                                                    >
                                                        dqwdqwdqwd
                                                        <div class="flex">
                                                            <input
                                                                type="text"
                                                                class="w-full rounded-xl border-2 py-2 px-3"
                                                            />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </template>
                                </card-vue>
                            </div>
                            <div
                                class="body py-6 overflow-y-auto"
                                style="height:450px;"
                            >
                                <div class="">
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
                                    <category
                                        v-for="(item, index) in categorys"
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
            <sidebar-vue class="bg-white col-span-3 p-8 text-xs">
                <template v-slot:content>
                    <div class="flex flex-col">
                        <div
                            id="profile"
                            class="flex items-center justify-between"
                        >
                            <div class="flex items-center">
                                <div class="w-12 flex items-center h-12">
                                    <img
                                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWTnqL32A0v5-KSy4vhh8wbfOKWnjAfG1duA&usqp=CAU"
                                        class="w-full h-full rounded-full"
                                        alt=""
                                    />
                                </div>
                                <div class="pl-4 flex items-center">
                                    <p class=" text-sm font-bold">
                                        Verrandy's
                                        <span>
                                            Budgets
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <a href="">
                                <i class="fas fa-chevron-down"> </i>
                            </a>
                        </div>
                        <div class="mt-4 md:mt-8">
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
                                            Rp120.000
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
                                            Rp120.000
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
                                            Rp120.000
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
                                            Rp120.000
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
                    </div>
                </template>
            </sidebar-vue>
        </div>
    </div>
</template>

<script>
import brand from "../../assets/images/ruang.png";
import icon_calendar from "../../assets/images/icon_calendar.png";
import icon_box from "../../assets/images/icon_box.png";
import icon_ayam from "../../assets/images/ayam.png";
import Category from "../../components/Category.vue";
import SidebarVue from "../../components/Sidebar.vue";
import CardVue from "../../components/Card.vue";
export default {
    components: {
        Category,
        SidebarVue,
        CardVue
    },
    data() {
        return {
            brand: brand,
            icon_ayam: icon_ayam,
            icon_calendar: icon_calendar,
            icon_box: icon_box,
            categorys: [
                {
                    category: 1,
                    budget: 1000,
                    activity: 20000,
                    available: 100000,
                    subcategorys: [
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        }
                    ]
                },
                {
                    category: 1,
                    budget: 1000,
                    activity: 20000,
                    available: 100000,
                    subcategorys: [
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        },
                        {
                            category: 3,
                            budget: 20040,
                            activity: 20000,
                            available: 11320000
                        }
                    ]
                },
                {
                    category: 1,
                    budget: 1000,
                    activity: 20000,
                    available: 100000,
                    subcategorys: [
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        },
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        },
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        },
                        {
                            category: 1,
                            budget: 20000,
                            activity: 20000,
                            available: 100000
                        }
                    ]
                }
            ]
        };
    }
};
</script>

<style>
.card {
    background-image: url("../../assets/images/icon_box.png");
}
</style>
