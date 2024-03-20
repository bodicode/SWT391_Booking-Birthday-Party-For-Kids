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
        <link rel="stylesheet" href="css/food.css"/>
        <link rel="stylesheet" href="css/home.css"/>
        <script src="js/addFood.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Food</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <c:set var="foodList" value="${requestScope.FOOD_LIST}" />
        <c:if test="${not empty foodList}">
            <div class="container-fluid">
                <div class="row">
                    <c:if test="${user.roleID == 1 or user.roleID == 3}">
                        <div class="col-md-4">
                            <div class="menu-grid bg-color d-flex justify-content-center align-items-center">
                                <a href="" onclick="addFood()">
                                    <i class=" icon-add fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                        <c:forEach var="food" items="${foodList}">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <form action="MainController" method="POST">
                                        <img class="item-image" src="${food.getFoodImageURL()}" val/>
                                        <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${food.getFoodID()}</p>
                                        <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${food.getFoodName()}</p>
                                        <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${food.getPrice()}</p>
                                        <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100" onclick="updateModal('${food.getFoodID()}', '${food.getFoodName()}', '${food.getPrice()}', '${food.getFoodImageURL()}')">Update Food</p>
                                        <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100" onclick="deleteModal('${food.getFoodID()}')">Delete Food</p>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${user.roleID ne 3}">
                        <c:forEach var="food" items="${foodList}">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <img class="item-image" src="${food.getFoodImageURL()}" />
                                    <h3 class="item-name d-flex justify-content-center mt-2">
                                        ${food.getFoodName()}
                                    </h3>        
                                    <p class="item-price d-flex justify-content-center mt-2">
                                        Price: ${food.getPrice()}$  
                                    </p>
                                </div>
                            </div>
                            <div id="update-modal">
                                <div class="confirm-container-update">
                                    <form>
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Update Food
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateFoodIDModal" type="text" name="txtFoodID" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateFoodNameModal" type="text" name="txtFoodName" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateFoodImageModal" type="text" name="txtFoodImageURL" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateFoodPriceModal" type="text" name="price" value="" />
                                            <!--<input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Service" name="btAction" />--> 
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Food" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeUpdateModal()"  value="Cancel"/>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                            <div id="delete-modal">
                                <div class="confirm-container-delete">
                                    <form action="MainController" method="POST">
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Are you sure to delete this food?
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="deleteFoodID" type="hidden" name="txtFoodID" value="${food.getFoodID()}" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Delete Food" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeDeleteModal()"  value="Cancel"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </c:if>
        <div id="modal-add">
            <div class="modal-add-container">
                <div class="modal-add-close" onclick="closeModalAddFood()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-add-header text-uppercase"> 
                    Add food
                </h2>
                <div class="modal-add-body">
                    <form action="MainController" method="POST">
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtFoodID" placeholder="Food's ID" required/>
                        </div>
                        <c:if test="${not empty requestScope.ERROR_FOOD.foodIDIsExisted}">
                            <div class="error text-center mb-3 text-danger">${requestScope.ERROR_FOOD.foodIDIsExisted}</div>
                        </c:if>
                        <c:if test="${not empty requestScope.ERROR_FOOD.foodIDViolent}">
                            <div class="error text-center mb-3 text-danger">${requestScope.ERROR_FOOD.foodIDViolent}</div>
                        </c:if>

                        <div class="add-row">
                            <input class="text-box" type="text" name="txtFoodName" placeholder="Food's Name" required/>
                        </div>
                        <c:if test="${not empty requestScope.ERROR_FOOD.foodNameIsExisted}">
                            <div class="error text-center mb-3 text-danger">${requestScope.ERROR_FOOD.foodNameIsExisted}</div>
                        </c:if>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtFoodImageURL" placeholder="Food's Image" required />
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="number" name="price" placeholder="Food's Price" step="any" required/>
                        </div>
                        <c:if test="${not empty requestScope.ERROR_FOOD.priceViolent}">
                            <div class="error text-center mb-3 text-danger">${requestScope.ERROR_FOOD.priceViolent}</div>
                        </c:if>
                        <div class="add-row-button">
                            <input class="btn-add" type="submit" value="Add Food" name="btAction" />
                        </div>
                    </form>
                </div>
            </div>
            <c:set var="error" value="${requestScope.ERROR_FOOD}" />
            <c:if test="${not empty error}" >
                <script>
                    document.getElementById("modal-add").style.display = "flex";
                </script>    
            </c:if>
        </div>
        <c:import url="footer.jsp" />
        <script>
            function updateModal(foodID, foodName, price, image) {
                document.getElementById("update-modal").style.display = "flex";
                let modalId = 'updateFoodIDModal';
                let nameId = 'updateFoodNameModal';
                let priceId = 'updateFoodPriceModal';
                let imageId = 'updateFoodImageModal';

                document.getElementById(modalId).value = foodID;
                document.getElementById(nameId).value = foodName;
                document.getElementById(priceId).value = price;
                document.getElementById(imageId).value = image;
            }

            function deleteModal(foodID) {
                document.getElementById("delete-modal").style.display = "flex";
                document.getElementById('deleteFoodID').value = foodID;
                event.preventDefault();
            }
        </script>
    </body>
</html>
