<%-- 
    Document   : menu.jsp
    Created on : Feb 24, 2024, 7:08:03 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/menu.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Menu</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <div class="container">
            <div class="bg-color navigation">
                <ul class="navigation-list">
                    <li class="navigation-item">
                        Chicken
                    </li>
                    <li class="navigation-item">
                        Spaghetti
                    </li>
                    <li class="navigation-item">
                        Pizza
                    </li>
                    <li class="navigation-item">
                        Burger
                    </li>
                    <li class="navigation-item">
                        Snack
                    </li>
                    <li class="navigation-item">
                        Desert
                    </li>
                </ul>
            </div>
        </div>

        <%--<c:set var="foodList" value="${requestScope.FOOD_LIST}" />
        <c:if test="${not empty foodList}">
            <c:forEach var="food" items="${foodList}">
                <p>
                    ${food.getFoodName()}
                </p>
            </c:forEach>
        </c:if>--%>

        <c:import url="footer.jsp" />
    </body>
</html>
