<%-- 
    Document   : package
    Created on : Feb 28, 2024, 8:29:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/package.css"/>
        <script src="js/package.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Package</title>
    </head>
    <body>
        <c:import url="navbar.jsp" /> 
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <c:set var="packageList" value="${requestScope.PACKAGE_LIST}" />
        <c:if test="${not empty packageList}">
            <div class="container-fluid">
                <div class="row">
                    <c:if test="${user.roleID eq 3}">
                        <div class="col-md-4">
                            <div class="menu-grid bg-color d-flex justify-content-center align-items-center">
                                <a href="" onclick="addPackage()">
                                    <i class="icon-add fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                        <c:forEach var="packageItem" items="${packageList}">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <img class="item-image" src="${packageItem.getPackageImageURL()}" />
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${packageItem.getPackageID()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${packageItem.getPackageName()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${packageItem.getPrice()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${packageItem.getPackageDescription()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${packageItem.getMaxGuests()}</p>

                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100" onclick="updateModal('${packageItem.getPackageID()}',
                                                    '${packageItem.getPackageName()}', '${packageItem.getPackageDescription()}',
                                                    '${packageItem.getPrice()}', '${packageItem.getPackageImageURL()}', '${packageItem.getMaxGuests()}')">
                                        Update Package</p>
                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100"  onclick="deleteModal('${packageItem.getPackageID()}')">Delete Package</p>
                                </div>
                            </div>
                            <div id="update-modal">
                                <div class="confirm-container-update">
                                    <form>
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Update Package
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackageIDModal" type="text" name="txtPackageID" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackageNameModal" type="text" name="txtPackageName" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackageDescriptionModal" type="text" name="txtPackageDescription" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackageImageModal" type="text" name="txtPackageImageURL" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackagePriceModal" type="number" name="price" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updatePackageMaxGuestsModal" type="number" name="txtMaxGuests" value="" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Package" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeUpdateModal()"  value="Cancel"/>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                            <div id="delete-modal">
                                <div class="confirm-container-delete">
                                    <form action="MainController" method="POST">
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Are you sure to delete this package?
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="deletePackageID" type="hidden" name="txtPackageID" value="${packageItem.getPackageID()}" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Delete Package" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeDeleteModal()"  value="Cancel"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${user.roleID ne 3}">
                        <c:forEach var="packageItem" items="${packageList}">
                            <div class="col-md-4">
                                <div class="menu-grid">
                                    <img class="item-image w-75" src="${packageItem.getPackageImageURL()}" />
                                    <h3 class="item-name d-flex justify-content-center mt-2">
                                        ${packageItem.getPackageName()}
                                    </h3>        
                                    <p class="item-price d-flex justify-content-center mt-2">
                                        Price: ${packageItem.getPrice()}$  
                                    </p>
                                    <p class="item-price d-flex justify-content-center mt-2 px-2">
                                        ${packageItem.getPackageDescription()}
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
                <div class="modal-add-close" onclick="closeModalAddPackage()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-add-header text-uppercase"> 
                    Add Package
                </h2>
                <div class="modal-add-body">
                    <form action="MainController" method="POST">
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtPackageID" placeholder="Package's ID" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtPackageName" placeholder="Package's Name" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtPackageImageURL" placeholder="Package's Image URL" required />
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtPackageDescription" placeholder="Package's Description" required />
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="number" name="price" placeholder="Package's Price" step="any" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="number" name="txtMaxGuests" placeholder="Max Guest" required/>
                        </div>
                        <div class="add-row-button">
                            <input class="btn-add" type="submit" value="Add Package" name="btAction" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp" />
        <script>
            function updateModal(packageID, packageName, packageDescription, price, image, maxGuests) {

                document.getElementById("update-modal").style.display = "flex";
                let modalId = 'updatePackageIDModal';
                let nameId = 'updatePackageNameModal';
                let descriptionId = 'updatePackageDescriptionModal';
                let priceId = 'updatePackagePriceModal';
                let imageId = 'updatePackageImageModal';
                let maxGuestId = 'updatePackageMaxGuestsModal';

                document.getElementById(modalId).value = packageID;
                document.getElementById(nameId).value = packageName;
                document.getElementById(descriptionId).value = packageDescription;
                document.getElementById(priceId).value = price;
                document.getElementById(imageId).value = image;
                document.getElementById(maxGuestId).value = maxGuests;
            }

            function deleteModal(packageID) {
                document.getElementById("delete-modal").style.display = "flex";
                document.getElementById('deletePackageID').value = packageID;
                event.preventDefault();
            }
        </script>
    </body>
</html>
