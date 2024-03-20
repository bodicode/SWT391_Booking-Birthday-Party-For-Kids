<%-- 
    Document   : about
    Created on : Mar 7, 2024, 5:07:28 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/about.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>About</title>
    </head>
    <body>
        <c:import url="navbar.jsp" />
        <div class="container-about container">
            <div class="w-100 h-100 text-center">
                <img class="w-50 h-100 object-fit-cover mx-auto " src="./Assets/images/about.jpeg" />
            </div>
            <h2 class="text-uppercase text-center pink my-4">About Us</h2>
            <p class="text-indend text-center">
                Welcome to FreeKids Spot - the perfect venue for extraordinary and meaningful birthday parties for children! Here, we take pride in being the ideal destination for families looking to host a special and memorable birthday celebration for their little angels.
            </p>
            <div class="row mt-4">
                <div class="image-service col-md-6 w-100 h-100 text-center my-auto">
                    <img class="w-75 my-auto img-radius" src="https://cdn.pixabay.com/photo/2017/02/09/01/29/children-2050919_1280.jpg" />
                </div>
                <div class="content-service col-md-6">
                    <h4 class="blue text-center">Services</h4>
                    <ul>
                        <li class="mb-3 text-indend">Parties: Captivating FreeKids Spot focuses on creating exciting and stylish birthday parties with a diverse menu suitable for all tastes.</li>
                        <li class="mb-3 text-indend">Creative Games: We provide space for creative games and enjoyable activities, ensuring that children have an unforgettable and fun-filled experience.</li>
                        <li class="mb-3 text-indend">Beautiful Decorations: FreeKids Spot offers a vibrant and eye-catching decor, creating the perfect backdrop for your child's birthday party.</li>
                    </ul>
                </div>
            </div>
            <div class="row mt-5">
                <div class="content-service col-md-6">
                    <h4 class="blue text-center">Facilities</h4>
                    <ul>
                        <li class="mb-3 text-indend text-height">Dedicated Play Area: FreeKids Spot features a separate play area for children where they can engage in active play and exploration with their friends.</li>
                        <li class="mb-3 text-indend text-height">Professional Staff: Our dedicated and professional staff will assist you in organizing a smooth and complete birthday celebration, ensuring that every detail is taken care of.</li>
                        <li class="mb-3 text-indend text-height">Safe Environment: FreeKids Spot is committed to ensuring the safety of all children attending, with a specially designed space to guarantee both enjoyment and safety.</li>
                    </ul>
                </div>
                <div class="image-service col-md-6 w-100 h-100 text-center my-auto">
                    <img class="w-75 img-radius" src="https://cdn.tuoitrethudo.com.vn/stores/news_dataimages/tuoitrethudocomvn/022019/19/08/nhan-vien-phuc-vu-nha-hang-co-phai-dong-bao-hiem-xa-hoi-02-.8014.jpg" />
                </div>
            </div>
            <div class="w-100 text-center">
                <img class="w-25 " src="https://i.pinimg.com/originals/ed/4a/61/ed4a61e4ad738bf356e249a5e4c2fca3.png" />
            </div>

        </div>
        <c:import url="footer.jsp" />
    </body>
</html>
