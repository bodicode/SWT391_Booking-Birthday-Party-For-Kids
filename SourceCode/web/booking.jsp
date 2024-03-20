<%-- 
    Document   : booking.jsp
    Created on : Feb 6, 2024, 4:06:25 PM
    Author     : User
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/booking.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <title>Booking</title>
</head>
<body>
<c:set var="user" value="${sessionScope.USER}"/>
<c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}"/>
<c:if test="${not empty user || not empty userGoogle}">
    <c:import url="navbar.jsp"/>
    <sql:setDataSource
            var="dataSource"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://mysqlcatshark2003-annie1141.a.aivencloud.com:21361/BOOKING_PARTY"
            user="avnadmin"
            password="AVNS_3PWIbxhW6QDNfaPBc8u"
    />
    <sql:query var="listOfPackage" dataSource="${dataSource}">
        SELECT * FROM Package;
    </sql:query>
    <sql:query var="listOfProduct" dataSource="${dataSource}">
        SELECT * FROM Food;
    </sql:query>
    <sql:query var="listOfTheme" dataSource="${dataSource}">
        SELECT * FROM Theme;
    </sql:query>
    <div class="flex flex-col m-auto bg-gray-100 sm:min-h-96 font-sans pt-36 relative">
        <div class="flex items-center m-auto py-2.5 justify-between py-3 px-2.5 cursor-pointer">
            <span class="text-center text-[#15397F] font-semibold text-2xl">Make a reservation schedule</span>
        </div>

        <div class="bg-gray-100 font-normal text-black bg-white px-10 py-7 relative w-3/4 m-auto rounded-lg border-4 border-[#FFD3E0] space-y-8">

            <div class="main-screen__block">
                <label for="package" class="font-semibold text-lg mb-3 text-[#15397F]">
                    1. Pick A Package
                </label>
                <div class="grid gap-4 grid-cols-3">
                    <c:forEach var="packageItem" items="${listOfPackage.rows}">
                        <div class="h-full group flex flex-col justify-between gap-1.5 rounded-md overflow-hidden pb-2 shadow-md"
                             id="package">
                            <div class="aspect-h-1 aspect-w-1 lg:aspect-none overflow-hidden w-full lg:h-80 rounded-lg bg-gray-200
                                group-hover:opacity-75 relative
                                transition duration-500 ease-out hover:scale-105 ">
                                <img src="${packageItem.ImagePackageURL}"
                                     class="h-full w-full object-cover object-center rounded-lg shadow-xl"
                                     alt="${packageItem.PackageName}"/>
                            </div>
                            <div class="flex items-baseline justify-between gap-x-1 px-1 mt-4">
                                <div class="font-semibold pr-2 md:pr-4 text-sm h-10">${packageItem.PackageName}</div>
                            </div>
                            <div class="text-xs text-gray-500 min-h-8 px-1">
                                    ${packageItem.Description}
                            </div>
                            <div class="flex flex-wrap gap-1 px-1"></div>
                            <div class="px-1 flex gap-1 mt-auto">
                                <div class="flex-1 flex flex-col relative rounded-md py-1 cursor-pointer lg:hover:bg-[#F0F8FF]">
                                    <div class="mt-auto text-sm font-semibold text-[#3D3D3D] text-center">
                                            ${packageItem.Price}$
                                    </div>
                                </div>
                            </div>
                            <div class="mx-1 cursor-pointer flex items-center justify-center border border-[#FFD3E0] rounded-md
                                             transition-all py-2 px-4 text-sm font-semibold bg-[#FFD3E0] text-white
                                             lg:hover:bg-pink-500 lg:hover:text-[#15397F] lg:hover:shadow-lg"
                                 id="${packageItem.PackageID}"
                                 onclick="addPackageToCart(`${packageItem.PackageID}`, this)">
                                Select
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="main-screen__block">
                <label for="theme" class="font-semibold text-lg mb-3 text-[#15397F]">
                    2. Pick A Theme
                </label>
                <div class="grid gap-4 grid-cols-3">
                    <c:forEach var="theme" items="${listOfTheme.rows}">
                        <div class="h-full group flex flex-col justify-between gap-1.5 rounded-md overflow-hidden pb-2 shadow-md"
                             id="theme">
                            <div class="overflow-hidden w-full lg:h-80 rounded-lg bg-gray-200
                                group-hover:opacity-75 relative
                                transition duration-500 ease-out">
                                <img src="${theme.ThemeImageURL}"
                                     class="h-full w-full object-cover object-center rounded-lg shadow-xl"
                                     alt="${theme.ThemeName}"/>
                            </div>
                            <div class="px-1 flex gap-1 mt-auto">
                                <div class="flex-1 flex flex-col relative rounded-md py-1 cursor-pointer lg:hover:bg-[#F0F8FF]">
                                    <div class="mt-auto text-sm font-semibold text-[#3D3D3D] text-center">
                                            ${theme.ThemeName}
                                    </div>
                                </div>
                            </div>

                            <div class="mx-1 cursor-pointer flex items-center justify-center border border-[#FFD3E0] rounded-md
                                             transition-all py-2 px-4 text-sm font-semibold bg-[#FFD3E0] text-white
                                             lg:hover:bg-pink-500 lg:hover:text-[#15397F] lg:hover:shadow-lg"
                                 id="${theme.ThemeID}"
                                 onclick="addThemeToCart(`${theme.ThemeID}`, this)">
                                Select
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="main-screen__block">
                <label for="ticket" class="font-semibold text-lg mb-3 text-[#15397F]">
                    3. Select tickets
                </label>
                <div class="flex" id="ticket">
                    <div>
                        <label for="ticketForKids" class="font-semibold text-[#15397F]">Number of kids</label>
                        <input type="number" class="w-full rounded-md" name="ticketForKids" value="0" min="0"
                               id="ticketForKids"
                               required>
                    </div>
                    <div class="m-auto">
                        <label for="ticketForAdults" class="font-semibold text-[#15397F]">Number of adults</label>
                        <input type="number" class="w-full rounded-md" name="ticketForAdults" value="0" min="0"
                               id="ticketForAdults" required>
                    </div>
                </div>
                <div id="warningCapacity" class="hidden text-red-600 mt-2"></div>
            </div>
            <div class="main-screen__block">
                <label for="product" class="font-semibold text-lg mb-3 text-[#15397F]">
                    4. Add Products
                </label>
                <div class="grid gap-4 gap-y-8 grid-cols-3">
                    <c:forEach var="product" items="${listOfProduct.rows}">
                        <div class="h-full group flex flex-col justify-between gap-1.5 rounded-md overflow-hidden pb-2 shadow-md"
                             id="product">
                            <div class="overflow-hidden w-full lg:h-80 rounded-lg bg-gray-200
                                group-hover:opacity-75 relative
                                transition duration-500 ease-out hover:scale-105">
                                <img src="${product.FoodImageURL}"
                                     class="h-full w-full object-cover object-center rounded-lg shadow-xl"
                                     alt="${product.FoodName}"/>
                            </div>
                            <div class="flex items-center justify-center gap-x-1 px-1 mt-4">
                                <div class="font-semibold text-center pr-2 md:pr-4 text-sm ">${product.FoodName}</div>
                            </div>

                            <div class="flex justify-evenly">
                                <button type="button"
                                        class="px-3 border border-gray-300 rounded-full focus:outline-none"
                                        onclick="decreaseQuantity('${product.FoodID}')">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M20 12H4"></path>
                                    </svg>
                                </button>
                                <input type="number" id="quantity_${product.FoodID}"
                                       class="w-1/3 text-center border border-gray-300 rounded-md mx-2"
                                       value="0" readonly>
                                <button type="button"
                                        class="px-3 border border-gray-300 rounded-full focus:outline-none"
                                        onclick="increaseQuantity('${product.FoodID}')">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                    </svg>
                                </button>
                            </div>

                            <div class="flex flex-wrap gap-1 px-1"></div>
                            <div class="px-1 flex gap-1 mt-auto">
                                <div class="flex-1 flex flex-col relative rounded-md py-1 cursor-pointer lg:hover:bg-[#F0F8FF]">
                                    <div class="mt-auto text-sm font-semibold text-[#3D3D3D] text-center">
                                            ${product.Price}$
                                    </div>
                                </div>
                            </div>
                            <div class="mx-1 cursor-pointer flex items-center justify-center border border-[#FFD3E0] rounded-md
                                             transition-all py-2 px-4 text-sm font-semibold bg-pink-500 text-white
                                             lg:hover:bg-pink-400 lg:hover:text-[#15397F] lg:hover:shadow-lg"
                                 id="${product.FoodID}"
                                 onclick="addProductToCart(`${product.FoodID}`)">
                                <i class="fa fa-cart-plus mr-4" aria-hidden="true"></i>
                                Add
                            </div>
                            <div id="toast-popup"
                                 class="hidden bg-green-500 text-white px-6 py-4 rounded-md fixed bottom-5 right-5 z-50">
                                Product added to cart successfully!
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="main-screen__block">
                <label for="date" class="font-semibold text-lg mb-3 text-[#15397F]">
                    5. Pick A Date & Time
                </label>
                <div class="flex space-x-8">
                    <div class="w-1/3">
                        <input type="text" class="w-full rounded-md" name="date" id="date"
                               placeholder="Select a date">
                    </div>
                    <div class="w-2/3 grid grid-cols-4 gap-4" id="timeSlotsContainer"></div>
                </div>
            </div>
            <div class="main-screen__block">
                <label for="note" class="font-semibold text-lg mb-3 text-[#15397F]">
                    6. Add a note (If any)
                </label>
                <textarea class="w-full rounded-md" name="note" id="note" rows="5"
                          placeholder="Example: I want to ....."></textarea>
            </div>
            <div class="text-2xl sticky -bottom-px z-10">
                <div class="flex flex-col justify-between text-center bg-[#fff] py-4 px-6 relative">
                    <div class="h-12 w-full border-1.5 rounded-md bg-pink-500 text-white py-1.5 px-5 justify-center
                        flex items-center cursor-pointer">
                        <input type="submit" onclick="submitForm()" class="w-full cursor-pointer" name="btAction"
                               value="Book">
                    </div>
                </div>
            </div>

        </div>
        <div class="group sticky bottom-0 flex justify-self-end self-end right-0 mr-0 z-10 w-1/8 max-h-13">
            <div class="bg-pink-500 rounded-tl-lg py-1.5 px-4 cursor-pointer w-full">
                <div id="totalAmount" class="text-white py-2 w-full">
                    <i class="fa fa-shopping-cart mr-2 transition duration-500 ease-out group-hover:scale-150"></i>
                    View Cart
                </div>
            </div>
        </div>
    </div>
    <c:import url="footer.jsp"/>
    <script src="js/booking.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            <c:forEach var="packageItem" items="${listOfPackage.rows}">
            addToListOfSelectedPackage('${packageItem.PackageID}', false);
            addToCapacityOfPackage('${packageItem.PackageID}', '${packageItem.maxGuests}');
            addToPriceOfPackage('${packageItem.PackageID}', '${packageItem.Price}');
            </c:forEach>
            <c:forEach var="theme" items="${listOfTheme.rows}">
            addToListOfSelectedTheme('${theme.ThemeID}', false);
            </c:forEach>
            <c:forEach var="product" items="${listOfProduct.rows}">
            addToPriceOfProduct('${product.FoodID}', '${product.Price}');
            </c:forEach>
            <c:set var="user" value="${sessionScope.USER}"/>
            <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}"/>
            <c:if test="${not empty user}">
            addToFormData('username', '${user.username}');
            </c:if>
            <c:if test="${not empty userGoogle}">
            addToFormData('username', '${userGoogle.email}');
            </c:if>

        });
    </script>
    <script>
        flatpickr('#date', {
            dateFormat: "d-m-Y",
        });
    </script>
</c:if>
</body>
</html>

