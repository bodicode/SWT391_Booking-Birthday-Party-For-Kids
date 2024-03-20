<%-- 
    Document   : contact
    Created on : Mar 6, 2024, 7:48:26 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/contact.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Contact</title>
    </head>

    <body>
        <c:import url="navbar.jsp" />
        <div class="container container-contact">
            <h2 class="text-center text-uppercase pink mb-5">
                Contact FreeKids Spot
            </h2>
            <div class="row">
                <div class="col-md-6">
                    <h4 class="blue w-100 text-uppercase">Contact Info</h4>
                    <div class="contact-info my-4">
                        <p><i class="mr-3 fa fa-cutlery"></i>FreeKids Spot</p>
                        <p><i class="mr-3 fa fa-phone"></i>097799979</p>
                        <p><i class="mr-3 fa fa-envelope"></i>freekidsspot@gmail.com</p>
                        <p><i class="mr-3 fa fa-map-marker"></i>Address: Lot E2a-7,Street D1, D. D1, Long Thanh My, Thu Duc City, Ho Chi Minh City 700000</p>
                    </div>
                    <h4 class="pink bt pt-4 mt w-100 text-uppercase">Contact Us</h4>
                    <div class="contact-form">
                        <form action="https://formspree.io/f/mbjnobad" class="" method="post">
                            <input class="contact-form-textbox form-control form-control-sm py-3 px-2 my-4" type="text" name="Name" value="" placeholder="Your name" />
                            <input class="contact-form-textbox form-control form-control-sm py-3 px-2 my-4" type="text" name="Phone" value="" placeholder="Phone" />
                            <input class="contact-form-textbox form-control form-control-sm py-3 px-2 my-4" type="email" name="Email" value="" placeholder="Email" />
                            <input class="contact-form-textbox form-control form-control-sm py-3 px-2 my-4" type="text" name="Message" value="" placeholder="Message" />
                            <div class="w-100 d-flex">
                                <input class="py-3 px-5 contact-form-btn btn btn-primary btn-sm mx-auto" type="submit" value="Submit"  />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="image w-100 h-100">
                        <img class="w-100 h-100 object-fit-cover" src="./Assets/images/contact.jpeg" />
                    </div>
                </div>
            </div>

        </div>
        <c:import url="footer.jsp" />
    </body>
</html>
