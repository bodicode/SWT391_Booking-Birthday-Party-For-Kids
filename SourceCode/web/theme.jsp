<%-- 
    Document   : theme
    Created on : Feb 28, 2024, 3:40:21 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/theme.css"/>
        <script src="js/theme.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Theme</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <c:set var="themeList" value="${requestScope.THEME_LIST}" />
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userGoogle" value="${sessionScope.USER_GOOGLE}" />
        <c:if test="${not empty themeList}">
            <div class="container-fluid">
                <div class="row">
                    <c:if test="${user.roleID eq 3}">
                        <div class="col-md-3">
                            <div class="theme-grid bg-color d-flex justify-content-center align-items-center">
                                <a href="" onclick="addTheme()">
                                    <i class=" icon-add fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                        <c:forEach var="theme" items="${themeList}">
                            <div class="col-md-3">
                                <div class="theme-grid">
                                    <img class="item-image" src="${theme.getThemeImageURL()}" />
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${theme.getThemeID()}</p>
                                    <p class="mx-auto mt-2 text-box d-flex justify-content-center w-75">${theme.getThemeName()}</p>
                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100"  onclick="updateModal('${theme.getThemeID()}', '${theme.getThemeName()}', '${theme.getThemeImageURL()}', '${theme.getThemeType()}')">Update Theme</p>
                                    <p class="mx-auto d-flex justify-content-center mb-2 btn-add w-100"  onclick="deleteModal('${theme.getThemeID()}')">Delete Theme</p>       
                                </div>
                            </div>
                            <div id="update-modal">
                                <div class="confirm-container-update">
                                    <form>
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Update Theme
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateThemeIDModal" type="text" name="txtThemeID" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateThemeNameModal" type="text" name="txtThemeName" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateThemeImageModal" type="text" name="txtThemeImageURL" value="" />
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="updateThemeTypeID" type="text" name="txtThemeTypeID" value="" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Update Theme" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeUpdateModal()"  value="Cancel"/>
                                        </div> 
                                    </form>
                                </div>
                            </div>
                            <div id="delete-modal">
                                <div class="confirm-container-delete">
                                    <form action="MainController" method="POST">
                                        <h4 class="my-4 confirm-content d-flex justify-content-center fw-bold">
                                            Are you sure to delete this theme?
                                        </h4>
                                        <div class="confirm-button">
                                            <input class="mx-auto mt-2 text-box d-flex justify-content-center w-75" id="deleteThemeID" type="hidden" name="txtThemeID" value="${theme.getThemeID()}" />
                                            <input class="mx-auto btn-confirm mb-2 w-100" type="submit" value="Delete Theme" name="btAction" /> 
                                            <input class="mx-auto mb-2 btn-cancel w-100 text-center" onclick="closeDeleteModal()"  value="Cancel"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${user.roleID ne 3}">
                        <c:forEach var="theme" items="${themeList}">
                            <div class="col-md-3">
                                <div class="theme-grid">
                                    <img class="item-image" src="${theme.getThemeImageURL()}" />
                                    <p class="bg-pink item-name d-flex justify-content-center py-3 m-0">
                                        ${theme.getThemeName()}
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
                <div class="modal-add-close" onclick="closeModalAddTheme()">
                    <i class="fa fa-close"></i>
                </div>
                <h2 class="modal-add-header text-uppercase"> 
                    Add Theme
                </h2>
                <div class="modal-add-body">
                    <form action="MainController" method="POST">
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtThemeID" placeholder="Theme's ID" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtThemeName" placeholder="Theme's Name" required/>
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="text" name="txtThemeImageURL" placeholder="Theme's Image" required />
                        </div>
                        <div class="add-row">
                            <input class="text-box" type="number" name="themeType" placeholder="1 for boy or 2 for girl" required/>
                        </div>
                        <div class="add-row-button">
                            <input class="btn-add" type="submit" value="Add Theme" name="btAction" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <c:import url="footer.jsp" />
        <script>
            function updateModal(themeID, themeName, image, typeID) {
                document.getElementById("update-modal").style.display = "flex";
                let modalId = 'updateThemeIDModal';
                let nameId = 'updateThemeNameModal';
                let imageId = 'updateThemeImageModal';
                let typeId = 'updateThemeTypeID';
                document.getElementById(modalId).value = themeID;
                document.getElementById(nameId).value = themeName;
                document.getElementById(imageId).value = image;
                document.getElementById(typeId).value = typeID;
            }

            function deleteModal(themeID) {
                document.getElementById("delete-modal").style.display = "flex";
                document.getElementById('deleteThemeID').value = themeID;
                event.preventDefault();
            }
        </script>
    </body>
</html>
