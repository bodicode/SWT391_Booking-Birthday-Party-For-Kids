<%-- 
    Document   : manageTheme
    Created on : Mar 8, 2024, 8:55:09 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <script src="https://kit.fontawesome.com/eb8f8aa9fa.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
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
                            <a href="MainController?btAction=ShowAdmin" class="sidebar-link" data-page="adminPanel">
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
                            <a href="MainController?btAction=ShowHost" class="sidebar-link" data-page="managePTH">
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
                            <a href="MainController?btAction=ShowCustomer" class="sidebar-link">
                                <i class="fa-solid fa-users"></i>
                                Manage Package
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="MainController?btAction=ShowCustomer" class="sidebar-link" data-page="manageCustomer">
                                <i class="fa-solid fa-users"></i>
                                Manage Customer
                            </a>
                        </li>
                        <!--                        <li class="sidebar-item">
                                                    <a href="#" class="sidebar-link">
                                                        <i class="fa-solid fa-gear"></i>
                                                        Settings
                                                    </a>
                                                </li>-->
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
                            <h4>Admin Panel</h4>
                        </div>
                        <div class="card border-0">
                            <div class="card-header">
                                <h5 class="card-title">
                                    Admin
                                </h5>
                                <!--                                <h6 class="card-subtitle text-muted">
                                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum ducimus,
                                                                    necessitatibus reprehenderit itaque!
                                                                </h6>-->
                            </div>
                            <c:if test="${not empty requestScope.THEME_LIST}" >
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">ID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Image URL</th>
                                                <th scope="col">Type</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="theme" items="${requestScope.THEME_LIST}" varStatus="counter">
                                                <tr>
                                                <tr>
                                                    <th scope="row">${counter.count}</th>
                                                    <td>${theme.getThemeID()}</td>
                                                    <td>${theme.getThemeName()}</td>
                                                    <td>${theme.getThemeImageURL()}</td>
                                                    <td>${theme.getThemeType()}</td>
                                                </tr>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/admin.js"></script>
    </body>
</html>
