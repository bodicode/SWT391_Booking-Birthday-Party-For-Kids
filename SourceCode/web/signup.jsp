<%-- 
    Document   : Signup
    Created on : Jan 26, 2024, 4:19:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Create new account</h1>
        <form action="MainController" method="POST">
            Username <input type="text" name="username" value="${param.username}" required=""/> ${requestScope.ERROR.usernameLengthViolent}${requestScope.ERROR.usernameIsExisted}
            <br/>Password<input type="password" name="password" value="${param.password}" required="" />
            <br/>Confirm <input type="password" name="confirm" value="${param.confirm}" required="" /> ${requestScope.ERROR.confirmNotMatch}
            <br/>Full Name <input type="text" name="fullName" value="${param.fullName}" required="" /> ${requestScope.ERROR.fullNameLengthViolent}
            <br/>Email <input type="text" name="email" value="${param.email}" required="" /> ${requestScope.ERROR.emailFormatViolent}
            <br/>Phone <input type="text" name="phone" value="${param.phone}" required="" /> ${requestScope.ERROR.phoneFormatViolent}
            <br/>Role ID <input type="text" name="roleID" value="2" readonly="" /> 
            <br/><input type="submit" value="Create" name="btAction" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
