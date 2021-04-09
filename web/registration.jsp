<%-- 
    Document   : registration.jsp
    Created on : Jan 26, 2021, 10:04:06 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <h1>Registration</h1>
        <c:set var="registrationError" value="${requestScope.registrationError}"/>
        <form action="registration" method="POST">
            <table border="0" style="margin-right: auto;margin-left: auto">
                <tbody>
                    <tr>
                        <td>Email</td>
                        <td> <input type="email" name="txtEmail" value="${txtEmail}" maxlength="320"/> </td>
                        <td> <font style="color: red">${registrationError.emailError}</font> </td>
                    </tr>
                    <tr>
                        <td>Full Name</td>
                        <td> <input type="text" name="txtFullName" value="${txtFullName}" maxlength="50"/> </td>
                        <td> <font style="color: red">${registrationError.fullNameError}</font> </td>
                    </tr>
                    <tr>
                        <td> Password </td>
                        <td> <input type="password" name="txtPassword" value="" maxlength="8000"/> </td>
                        <td> <font style="color: red">${registrationError.passwordError}</font> </td>
                    </tr>
                    <tr>
                        <td> Password Confirm </td>
                        <td> <input type="password" name="txtConfirm" value="" maxlength="8000"/> </td>
                        <td> <font style="color: red">${registrationError.passwordConfirmError}</font> </td>
                    </tr>
                </tbody>
            </table>
            <div class="button" style="text-align: center">
                <input type="submit" value="Registration" />
                <input type="reset" value="Reset" />
            </div>
        </form>
        <h3> <a href="loginPage">Login</a> </h3>
    </body>
</html>
