<%-- 
    Document   : login.jsp
    Created on : Jan 22, 2024, 12:19:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Username <input type="text" name="txtUsername" /><br/>
            Password <input type="password" name="txtPassword" /><br>
            <input type="submit" value="Login" name="btAction" />
            <input type="reset" value="Reset" /> 
        </form>
        ${requestScope.ERROR}
        ${requestScope.error}
        <br/><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/booking-birthday-party-for-kids/MainController?btAction=GoogleLogin&response_type=code
                &client_id=245682681209-if987baput8k491ieth5001l5u57ohes.apps.googleusercontent.com&approval_prompt=force">Login with Google</a>
        <a href="MainController?btAction=Singup">Create new account</a>
    </body>
</html>
