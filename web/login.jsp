<%-- 
    Document   : login
    Created on : Jan 26, 2021, 8:15:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <h2> <font style="color: red">${requestScope.loginError}</font> </h2>
        <h2> <font style="color: green">${requestScope.MESSAGE}</font> </h2>
        <form action="login" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email</td>
                        <td> <input type="text" name="txtEmail" value="${param.txtEmail}" maxlength="320"/> </td>
                        <td> <font style="color: red">${requestScope.emailError}</font> </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td> <input type="password" name="txtPassword" value="" maxlength="8000"/> </td>
                        <td> <font style="color: red">${requestScope.passwordError}</font> </td>
                    </tr>
                    <tr>
                        <td> <input type="submit" value="Login" name="btnAction" /> </td>
                        <td> <input type="reset" value="Reset" /> </td>
                        <td> <a href="registrationPage" style="text-decoration: none">Registration</a> </td>
                    </tr>
                </tbody>
            </table>
        </form>                  
    </body>
</html>
