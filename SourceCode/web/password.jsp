<%-- 
    Document   : password
    Created on : Jan 29, 2024, 9:30:19 AM
    Author     : huynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>The FreeKids Spot</title>
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
                            <div class="border-b border-gray-900/10 pb-12 pl-12">
                                <h2 class="text-base font-semibold leading-7 text-gray-900 mt-6">Change Password</h2>
                                <p class="mt-1 text-sm leading-6 text-gray-600">It's a good idea to use a strong password</p>

                                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                    <div class="sm:col-span-4">
                                        <label for="oldPassword" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span>Current password</span>
                                        </label>
                                        <div class="mt-2">                        
                                            <input type="hidden" name="txtUserId" value="${user.username}" />
                                            <input type="hidden" id="userPassword" value="${user.password}"/>
                                            <input type="password" name="txtOldPassword" value="" id="oldPassword" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-400 sm:text-sm sm:leading-6" required>
                                        </div>
                                        <div id="errorOldPassword"></div>
                                    </div>
                                    <div class="sm:col-span-4">
                                        <label for="newPassword" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span>New password</span>
                                        </label>
                                        <div class="mt-2">
                                            <input type="password" name="txtNewPassword" value="" id="newPassword" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-400 sm:text-sm sm:leading-6" required onkeyup="checkPasswordStrength()">
                                        </div>

                                        <div id="passwordStrength" class="mt-2"></div>
                                        <div id="errorNewPassword"></div>
                                    </div>
                                    <div class="sm:col-span-4">
                                        <label for="confirmPassword" class="block text-sm font-medium leading-6 text-gray-900">
                                            <span>Confirm password</span>
                                        </label>
                                        <div class="mt-2">
                                            <input type="password" name="txtConfirmPassword" value="" id="confirmPassword" 
                                                   class="block w-full rounded-md border-0 py-1.5 pl-1.5 text-gray-900 shadow-sm 
                                                   ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 
                                                   focus:ring-2 focus:ring-inset focus:ring-indigo-400 sm:text-sm sm:leading-6" required onkeyup="checkPasswordMatch()">

                                        </div>
                                        <div id="errorMessage" class="mt-2"></div>
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
                            <button type="submit" name="btAction" value="changePassword"
                                    class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm 
                                    hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                Update password
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <c:import url="footer.jsp" />
        </c:if>
        <script src="js/password.js"></script>
    </body>
</html>