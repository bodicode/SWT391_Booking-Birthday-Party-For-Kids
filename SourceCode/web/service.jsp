<%-- 
    Document   : service
    Created on : Feb 26, 2024, 4:50:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/service.css"/>
        <link rel="stylesheet" href="css/home.css"/>
        <script src="js/addService.js" async></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Service</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <c:set var="serviceList" value="${requestScope.SERVICE_LIST}" />
        <c:if test="${not empty serviceList}">
            <div class="container-fluid">
                <div class="row">
                    <c:if test="${user.roleID eq 3}">
                        <div class="col-md-4">
                            <div class="menu-grid bg-color d-flex justify-content-center align-items-center">
                                <a href="" onclick="addService()">
                                    <i class="icon-add fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                        <c:forEach var="service" items="${serviceList}" varStatus="counter">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <img class="item-image" src="${service.getServiceImageURL()}"/>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${service.getServiceID()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${service.getServiceName()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${service.getPrice()}</p>
                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100"  onclick="updateModal('${service.getServiceID()}', '${service.getServiceName()}', '${service.getPrice()}', '${service.getServiceImageURL()}')">Update Service</p>
                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100"  onclick="deleteModal('${service.getServiceID()}')">Delete Service</p>
                                </div>
                            </div>
                            <div id="update-modal">
                                <div class="confirm-container-update">
                                    <form>
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Update Service
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateServiceIDModal" type="text" name="txtServiceID" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateServiceNameModal" type="text" name="txtServiceName" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateImageModal" type="text" name="txtServiceImageURL" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePriceModal" type="text" name="price" value="" />
                                            <!--<input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Service" name="btAction" />--> 
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Service" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeUpdateModal()"  value="Cancel"/>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                            <div id="delete-modal">
                                <div class="confirm-container-delete">
                                    <form action="MainController" method="POST">
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Are you sure to delete this service?
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="deleteServiceID" type="hidden" name="txtServiceID" value="${service.getServiceID()}" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Delete Service" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeDeleteModal()"  value="Cancel"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <script>
                        function updateModal(serviceID, serviceName, price, image) {
                            document.getElementById("update-modal").style.display = "flex";
                            let modalId = 'updateServiceIDModal';
                            let nameId = 'updateServiceNameModal';
                            let priceId = 'updatePriceModal';
                            let imageId = 'updateImageModal';

                            document.getElementById(modalId).value = serviceID;
                            document.getElementById(nameId).value = serviceName;
                            document.getElementById(priceId).value = price;
                            document.getElementById(imageId).value = image;
                        }

                        function deleteModal(serviceID) {
                            document.getElementById("delete-modal").style.display = "flex";
                            document.getElementById('deleteServiceID').value = serviceID;
                            event.preventDefault();
                        }
                    </script>
                    <c:if test="${user.roleID ne 3}">
                        <c:forEach var="service" items="${serviceList}">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <img class="item-image" src="${service.getServiceImageURL()}" />
                                    <h3 class="item-name d-flex justify-content-center mt-2">
                                        ${service.getServiceName()}
                                    </h3>        
                                    <p class="item-price d-flex justify-content-center mt-2">
                                        Price: ${service.getPrice()}$  
                                    </p>
                                </div>
                            </div>
                        </c:forEach> 
                    </c:if>
                </div>
            </div>
        </c:if>
        <div id="modal-add">
            <div class="modal-add-container">
                <div class="modal-add-close" onclick="closeModalAddService()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-add-header text-uppercase"> 
                    Add Service
                </h2>
                <div class="modal-add-body">
                    <form action="MainController" method="POST">
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtServiceID" placeholder="Service's ID" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtServiceName" placeholder="Service's Name" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtServiceImageURL" placeholder="Service's Image" required />
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="number" name="price" placeholder="Service's Price" step="any" required/>
                        </div>
                        <div class="add-row-button">
                            <input class="btn-add" type="submit" value="Add Service" name="btAction" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp" />
        <script>
            function updateModal(serviceID, serviceName, price, image) {
                document.getElementById("update-modal").style.display = "flex";
                let modalId = 'updateServiceIDModal';
                let nameId = 'updateServiceNameModal';
                let priceId = 'updatePriceModal';
                let imageId = 'updateImageModal';

                document.getElementById(modalId).value = serviceID;
                document.getElementById(nameId).value = serviceName;
                document.getElementById(priceId).value = price;
                document.getElementById(imageId).value = image;
            }

            function deleteModal(serviceID) {
                document.getElementById("delete-modal").style.display = "flex";
                document.getElementById('deleteServiceID').value = serviceID;
                event.preventDefault();
            }
        </script>
    </body>
</html>