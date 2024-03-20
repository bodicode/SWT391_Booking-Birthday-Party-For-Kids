<%-- 
    Document   : navbar.jsp
    Created on : Feb 24, 2024, 10:25:13 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/navbar.css"/>
        <link rel="stylesheet" href="css/home.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <header style="" class="header">
            <div class="info">
                <div class="container">
                    <div class="hotline">
                        <a class="text-dark hotline-link" href="#" title="">
                            <i class="phone-icon fa fa-phone"></i>
                            097799979
                        </a>
                        <a class="text-dark hotline-link" href="#" title="">
                            <i class="mail-icon fa fa-envelope"></i>
                            freekidsspot@gmail.com
                        </a>
                    </div>
                    <div class="login-signup">
                        <c:if test="${empty user and empty userGoogle}" >
                            <a id="login" class="login-link" onclick="login()">
                                Login
                            </a>
                            <a id="signup" class="signup-link" onclick="signup()">
                                Signup
                            </a>
                        </c:if>
                        <c:if test="${not empty user}" >
                            <div id="user" class="account">
                                <p class="account__name">
                                    <i class="account__icon fa fa-user"></i>${user.fullName}
                                <div class="account__info">
                                    <ul class="account__info-list">
                                        <li class="account__info-item">
                                            <a href= "profile.jsp"> 
                                                My Profile 
                                            </a>
                                        </li>
                                        <li class="account__info-item">History Transaction</li>
                                            <c:if test="${user.roleID eq 1}">
                                                <li class="account__info-item"><a href="admin.jsp">Dashboard</a></li>
                                            </c:if>
                                        <form action="MainController" method="POST">
                                            <li class="account__info-item account__info-item-seperate"><a href="MainController?btAction=Logout">Logout</a></li>
                                        </form>
                                    </ul>
                                </div>
                                </p>
                            </div>
                        </c:if>
                        <c:if test="${not empty userGoogle}" >
                            <div id="user" class="account">
                                <p class="account__name">
                                    <i class="account__icon fa fa-user"></i>${userGoogle.email}
                                <div class="account__info">
                                    <ul class="account__info-list">
                                        <li class="account__info-item">
                                            <a href= "profile.jsp"> 
                                                My Profile 
                                            </a>
                                        </li>
                                        <li class="account__info-item">History Transaction</li>
                                        <form action="MainController" method="POST">
                                            <li class="account__info-item account__info-item-seperate"><a href="MainController?btAction=Logout">Logout</a></li>
                                        </form>
                                    </ul>
                                </div>
                                </p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="navbar-main">
                <div class="container">
                    <div class="navbar-left">
                        <ul class="navbar-left-list">
                            <li class="nav-item navbar-left-item"><a class="navbar-link" href="home.jsp">Home</a></li>
                            <li class="navbar-left-item"><a class="navbar-link" href="MainController?btAction=MoreFood">Food</a></li>
                            <li class="navbar-left-item"><a class="navbar-link" href="MainController?btAction=MoreService">Entertainment</a></li>
                        </ul>
                    </div>
                    <div class="logo">
                        <a href="#home"><img class="logo-image" src="./Assets/images/Logo.png" alt="FreeSpotKids Logo"/></a>
                    </div>
                    <div class="navbar-right">  
                        <ul class="navbar-right-list">
                            <li class="navbar-right-item"><a class="navbar-link" href="about.jsp">About Us</a></li>
                            <li class="navbar-right-item"><a class="navbar-link" href="contact.jsp">Contact</a></li>
                            <li class="navbar-right-item booking-button">
                                <a href="#" onclick="checkAndRedirect()" class="text-dark">
                                    <i class="booking-icon fa fa-bell"></i>BOOKING
                                    <script>
                                        function checkAndRedirect() {
                                            var userExist = ${not empty user or not empty userGoogle};
                                            if (userExist) {
                                                // Nếu tồn tại, chuyển hướng tới trang booking.jsp
                                                window.location.href = "booking.jsp";
                                            } else {
                                                // Nếu không tồn tại, hiển thị modal login
                                                document.getElementById("modal-login").style.display = "flex";
                                            }
                                        }
                                    </script>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <div id="modal-login">
            <div class="modal-login-container">
                <div class="modal-login-close" onclick="closeModalLogin()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-login-header"> 
                    Sign in
                </h2>
                <div class="modal-login-body">
                    <form  action="MainController" method="POST">
                        <div class="login-row">
                            <input class="text-box" type="text" name="txtUsername" placeholder="Username" />
                        </div>
                        <div class="login-row">
                            <input class="text-box" type="password" name="txtPassword" placeholder="Password" />
                        </div>
                        <c:set var="error" value="${requestScope.ERROR_LOGIN}" />
                        <c:if test="${not empty error}" >
                            <p class="login-error">${requestScope.ERROR_LOGIN}</p>
                        </c:if>
                        <div class="forgot-create">
                            <div class="login-row-forgot-password">
                                <a href="#" class="login-row-forgot-password-text">Forgot password?</a>
                            </div>
                            <div class="create-account">
                                <a class="create-account-text" href="#" onclick="signup()">Create new account</a>
                            </div>
                        </div>
                        <div class="alternative-login-button">
                            <div class="login-row-button">
                                <input class="btn-login-modal" type="submit" value="Login" name="btAction" />
                            </div>
                            <div class="alternative-login-text">
                                or
                            </div>
                            <div class="login-google-button">
                                <div class="login-google-text" >
                                    <i class="login-google-icon fa fa-google"></i>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/booking-birthday-party-for-kids/MainController?btAction=GoogleLogin&response_type=code
                                       &client_id=245682681209-if987baput8k491ieth5001l5u57ohes.apps.googleusercontent.com&approval_prompt=force">Login with Google</a>                    
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>  
        </div>

        <c:set var="loginError" value="${requestScope.ERROR_LOGIN}" />
        <c:set var="loginGoogleError" value="${requestScope.ERROR}" />

        <c:if test="${not empty loginError}" >
            <script>
                document.getElementById("modal-login").style.display = "flex";
            </script>
        </c:if>

        <div id="modal-signup">
            <div class="modal-signup-container">
                <div class="modal-signup-close" onclick="closeModalSingup()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-signup-header"> 
                    Create New Account
                </h2>
                <div class="modal-signup-body">
                    <form class="" action="MainController" method="POST">
                        <div class="signup-row">
                            <input class="text-box" type="text" name="fullName" value="${param.fullName}" placeholder="Your name" />
                            <div class="signup-error">
                                <p class="signup-error-text">
                                    ${requestScope.ERROR_SIGNUP.fullNameLengthViolent}
                                </p>
                            </div>
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="text" name="username" value="${param.username}" placeholder="Username" />
                            <div class="signup-error">
                                <p class="signup-error-text">
                                    ${requestScope.ERROR_SIGNUP.usernameLengthViolent}${requestScope.ERROR_SIGNUP.usernameIsExisted}
                                </p>
                            </div>
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="password" name="password" value="${password}" placeholder="Password" />
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="password" name="confirm" value="${confirm}" placeholder="Confirm Password" />
                            <div class="signup-error">
                                <p class="signup-error-text">
                                    ${requestScope.ERROR_SIGNUP.confirmNotMatch}
                                </p>
                            </div>
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="text" name="email" value="${email}" placeholder="Email" />
                            <div class="signup-error">
                                <p class="signup-error-text">
                                    ${requestScope.ERROR_SIGNUP.emailFormatViolent}
                                </p>
                            </div>
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="text" name="phone" value="${phone}" placeholder="Phone" />
                            <div class="signup-error">
                                <p class="signup-error-text">
                                    ${requestScope.ERROR_SIGNUP.phoneFormatViolent}
                                </p>
                            </div>
                        </div>
                        <div class="signup-row">
                            <input class="text-box" type="hidden" name="roleID" value="2" readonly="" placeholder="Guest" />
                        </div>
                        <div class="alternative-signup-button">
                            <div class="signup-row-button">
                                <input class="btn-signup-modal" type="submit" value="Create account" name="btAction" />
                            </div>
                            <div class="alternative-signup-text">
                                or
                            </div>
                            <div class="signup-google-button">
                                <div class="signup-google-text" >
                                    <i class="signup-google-icon fa fa-google"></i>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/booking-birthday-party-for-kids/MainController?btAction=GoogleLogin&response_type=code
                                       &client_id=245682681209-if987baput8k491ieth5001l5u57ohes.apps.googleusercontent.com&approval_prompt=force">Signup with Google</a>                    
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="switch-login">
                        <a class="switch-login-text" href="#" onclick="switchLogin()">I'm have already account</a>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="errorSignup" value="${requestScope.ERROR_SIGNUP}" />
        <c:if test="${not empty errorSignup}" >
            <script>
                document.getElementById("modal-signup").style.display = "flex";
            </script>    
        </c:if>
        <script src="js/navbar.js"></script>
    </body>
</html>
