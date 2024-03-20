<%-- 
    Document   : userDetail
    Created on : Jan 27, 2024, 6:26:29 PM
    Author     : huynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/profile.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <title>The FreeKids Spot</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <c:if test="${not empty user || not empty userGoogle}">
            <c:import url="navbar.jsp" />
            <div class="container pt-20 mx-auto flex py-5">
                <div class="w-2/5 shrink-0 mt-28 pt-4">
                    <div> 
                        <a href="profile.jsp" class="flex hover:text-pink-300">
                            <div><img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4" alt="icon-avatar" class="size-7" /></div>
                            <div class="px-2 py-1"><span>My account</span></div>
                        </a>
                    </div>
                    <div class="pl-12 mt-2 flex flex-col space-y-2">
                        <div>
                            <a href="profile.jsp" class="hover:text-pink-300 active:text-pink-300" active>
                                <span>Profile</span>
                            </a>                          
                        </div>
                        <div>
                            <a href="password.jsp" class="hover:text-pink-300 active:text-pink-300">
                                <span>Change Password</span>
                            </a>
                        </div>
                        <div>
                            <a href="deletion.jsp" class="hover:text-pink-300 active:text-pink-300">
                                <span>Delete account</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="w-3/5 rounded-md border border-state-500 shadow-md p-1 mt-28">
                    <form action="MainController" method="post" onsubmit="return validateForm()">
                        <div class="space-y-12">
                            <div class="border-b border-gray-900/10 pb-12 pl-12 ">
                                <h2 class="text-base font-semibold leading-7 text-gray-900 mt-6">Personal Information</h2>
                                <p class="mt-1 text-sm leading-6 text-gray-600">Manage profile information to secure the account.</p>
                                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                    <div class="sm:col-span-3">
                                        <label for="fullName" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">Full name</span>
                                        </label>
                                        <div class="mt-2">
                                            <input type="hidden" name="txtUserId" value="${user.username}" >
                                            <input type="text" name="txtFullName" value="${user.fullName}" id="fullName" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" 
                                                   required minlength="1" maxlength="100">
                                        </div>
                                        <div id="errorFullName" class="mt-2"></div>
                                    </div>

                                    <div class="sm:col-span-4">
                                        <label for="email" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">Email address</span>
                                        </label>
                                        <div class="mt-2">
                                            <input id="email" name="txtEmail" value="${user.email}" type="email" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                                        </div>
                                        <div id="errorEmail" class="mt-2"></div>
                                    </div>

                                    <div class="sm:col-span-4">
                                        <label for="phoneNumber" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span class="after:content-['*'] after:ml-0.5 after:text-red-500 block text-sm font-medium text-slate-700">Phone number</span>
                                        </label>
                                        <div class="mt-2">
                                            <input id="phoneNumber" name="txtPhone" value="${user.phone}" type="tel" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" required>
                                        </div>
                                        <div id="errorPhone" class="mt-2"></div>           
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 pl-12">
                            <c:set var="msg" value="${requestScope.msg}" />
                            <c:if test="${not empty msg}">
                                <p class="text-green-400">${msg}</p>
                            </c:if>
                        </div>

                        <div class="mt-6 flex items-center justify-end gap-x-6 pb-8 pr-8">                    
                            <button type="submit" name="btAction" value="editProfile"
                                    class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm 
                                    hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <c:import url="footer.jsp" />
        </c:if>
        <script src="js/profile.js"></script>
    </body>
</html>
