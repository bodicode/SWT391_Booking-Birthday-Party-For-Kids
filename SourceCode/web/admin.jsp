<%-- 
    Document   : admin
    Created on : Feb 21, 2024, 7:52:27 PM
    Author     : Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <script src="https://kit.fontawesome.com/eb8f8aa9fa.js" crossorigin="anonymous"></script>
        <title>Admin Center</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <div class="wrapper">
            <aside id="sidebar" class="js-sidebar">
                <div class="h-100">
                    <div class="sidebar-logo">
                        <a href="admin.jsp">
                            <img src="./Assets/images/Logo.png" alt="FreeKidsPot Logo" class="img-fluid me-1" style="max-height: 2.75rem;">
                            Admin Center</a>
                    </div>
                    <ul class="sidebar-nav">
                        <li class="sidebar-item">
                            <a href="admin.jsp" class="sidebar-link active" data-page="profile">
                                <i class="fa-solid fa-universal-access"></i>
                                My Profile
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=ShowAdmin" class="sidebar-link">
                                <i class="fa-solid fa-chart-simple"></i>
                                Admin Panel
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="adminNotification.jsp" class="sidebar-link" data-page="adminNotification">
                                <i class="fa-solid fa-envelope"></i>
                                Notification
                                <span class="position-absolute  p-1 bg-danger border border-light rounded-circle"></span>
                                <!--ADD if statement if notification is on-->

                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=ShowHost" class="sidebar-link">
                                <i class="fa-solid fa-republican"></i>
                                Manage Party Host
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=MoreFoodAdmin" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Food
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=MoreServiceAdmin" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Service
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=MoreThemeAdmin" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Theme
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=MorePackageAdmin" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Package
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=ShowCustomer" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Customer
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Reservation
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="home.jsp" class="sidebar-link" data-page="home">
                                <i class="fa-solid fa-right-from-bracket"></i>
                                Back to Homepage
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <div class="main">
                <nav class="navbar navbar-expand px-3 border-bottom">
                    <button class="btn" id="sidebar-toggle" type="button">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse navbar">
                        <!--Welcome, Admin USER_NAME code here [class="pe-md-0"]-->
                        <a href="#" class="theme-toggle ">
                            <i class="fa-regular fa-moon"></i>
                            <i class="fa-regular fa-sun"></i>
                        </a>
                    </div>
                </nav>
                <main class="content px-3 py-3">
                    <div class="container-fluid">
                        <div class="mb-4">
                            <h4>My Profile</h4>
                        </div>
                        <img src="https://previews.123rf.com/images/chuckchee/chuckchee1803/chuckchee180300002/97011498-pixelkunstdinosaurier-triceratops-auf-wei%C3%9Fem-hintergrund.jpg" 
                             alt="Avatar" class="rounded-circle img-fluid me-2" style="max-height: 5.15rem;">
                        <span class="d-inline-block align-middle mt-5">
                            Welcome back, ${user.username}
                        </span>
                        <div class="profile-info mt-4">
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <strong>Full Name:</strong>
                                </div>
                                <div class="col-md-8">
                                    ${user.fullName}
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <strong>Phone:</strong>
                                </div>
                                <div class="col-md-8">
                                    ${user.phone}
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <strong>Email Address:</strong>
                                </div>
                                <div class="col-md-8">
                                    ${user.email}
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center gap-3 mx-auto">
                            <button class="custom-btn" type="button">Edit Profile</button>
                            <button class="custom-btn2" type="button">Logout</button>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/admin.js"></script>
    </body>
</html>
