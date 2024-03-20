<%-- 
    Document   : home.jsp
    Created on : Jan 25, 2024, 4:38:14 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/slider.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-oYqG1NX5MO9t3i7TWJGP5RfnIuVndhR8gN8FiMFd6Op7fEMET5H/h8Sojr5+q0C2" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="js/slider.js" async></script>
        <title>Home</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <div class="main">
            <div class="parallax-slider">
                <div class="slider-wrapper">
                    <div style="background: url(https://cdn.pixabay.com/photo/2022/06/08/14/49/party-7250621_1280.jpg) 50% -78.5px rgb(174, 189, 198); opacity: 0; transform: translate(-100%);"
                         class="slide slide1 slide-active">
                        <div class="col-md-6 slogan">
                            "The Small World of Joyful"
                        </div>
                    </div>
                    <div style="background: url(https://cdn.pixabay.com/photo/2017/04/29/18/02/bubbles-2271209_1280.jpg) 50% -78.5px rgb(174, 189, 198); opacity: 0; transform: translate(-100%);"
                         class="slide slide2">
                        <div class="col-md-6 slogan">
                            "The Small World of Joyful"
                        </div>
                    </div>
                    <div style="background: url(https://cdn.pixabay.com/photo/2014/06/30/11/40/cupcakes-380178_1280.jpg) 50% -78.5px rgb(174, 189, 198); opacity: 0; transform: translate(-100%);"
                         class="slide slide3">
                        <div class="col-md-6 slogan">
                            "The Small World of Joyful"
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section id="about" class="about-us-home">
            <div class="container">
                <div class="content-header text-center mb-5">
                    <h2>Welcome to FreeKids Spot: Where Joy Takes Center Stage!</h2>
                </div>
                <div class="content-info row">
                    <p class="col-md-6">
                        Here, we not only arrange birthday parties but also stand as companions in creating memorable moments for your beloved little ones.
                        We understand that each birthday party is a special and significant occasion. 
                        That's why at our store, every detail is carefully prepared to ensure satisfaction and maximum joy for the entire family. 
                        Let us join you in building memorable memories and creating a perfect birthday party for your boys and girls!
                        <input class="btn btn-outline-primary d-block mt-2 px-5 px-2" type="submit" value="More" name="btAction" />
                    </p>    
                    <img class="col-md-6" src="./Assets/images/introduce05.jpg" />
                </div>
            </div>
        </section>

        <section class="introduce my-5">
            <div class="container-fluid">
                <div class="introduce-list row">
                    <div class="introduce-item col-md-4">
                        <a class="introduce-link" href="MainController?btAction=MorePackage">
                            <img class="introduce-img" src="https://cdn.pixabay.com/photo/2014/06/30/11/40/cupcakes-380178_1280.jpg" />
                            <div class="introduce-content text-dark font-weight-bold text-uppercase">
                                <h2>Package</h2>
                            </div>
                        </a>
                    </div>
                    <div class="introduce-item col-md-4">
                        <a class="introduce-link" href="MainController?btAction=MoreTheme">
                            <img class="introduce-img" src="https://cdn.pixabay.com/photo/2020/07/03/19/41/merry-christmas-5367405_1280.jpg" />
                            <div class="introduce-content text-dark font-weight-bold text-uppercase">
                                <h2>Theme</h2>
                            </div>
                        </a>
                    </div>
                    <div class="introduce-item col-md-4 ">
                        <a class="introduce-link" href="MainController?btAction=MoreFood">
                            <img class="introduce-img" src="https://cdn.pixabay.com/photo/2020/03/28/14/51/french-fries-4977354_1280.jpg" />
                            <div class="introduce-content text-dark text-uppercase">
                                <h2>Food</h2>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://mysqlcatshark2003-annie1141.a.aivencloud.com:21361/BOOKING_PARTY" user="avnadmin" password="AVNS_3PWIbxhW6QDNfaPBc8u" />
        <sql:query var="foodList" dataSource="${dataSource}">
            SELECT * FROM Food LIMIT 4;
        </sql:query>
        <sql:query var="serviceList" dataSource="${dataSource}">
            SELECT * FROM Services LIMIT 4;
        </sql:query>
        <div id="menu" class="menu my-5 bg-color">
            <div class="container-fluid">
                <c:if test="${not empty foodList.rows or not empty serviceList.rows}">
                    <div class="menu-header text-center ml-5 my-5 pt-4 text-primary">
                        <h2 class="text-uppercase">Variety of foods and entertainment</h2>
                    </div>
                    <div class="menu-list">
                        <c:forEach var="food" items="${foodList.rows}">
                            <div class="menu-item">
                                <img class="menu-item-img" src="${food.FoodImageURL}" alt="menu1"/>
                                <div class="menu-item-details">
                                    <p class="menu-item-name text-center ">${food.FoodName}</p>
                                    <a href="MainController?btAction=MoreFood" class="order-button text-uppercase font-weight-bold">
                                        Click here to see more
                                        <i class="fa fa-arrow-right"></i></a>    
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach var="service" items="${serviceList.rows}">
                            <div class="menu-item">
                                <img class="menu-item-img" src="${service.ServiceImageURL}" alt="menu1"/>
                                <div class="menu-item-details">
                                    <p class="menu-item-name text-center ">${service.ServiceName}</p>
                                    <a href="MainController?btAction=MoreService" class="order-button text-uppercase font-weight-bold">
                                        Click here to see more
                                        <i class="fa fa-arrow-right"></i></a>   
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>    
            </div>
        </div>
        <c:import url="footer.jsp" />
    </body>
</html>
