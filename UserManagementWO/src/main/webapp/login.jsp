<%-- 
    Document   : login
    Created on : May 15, 2020, 3:29:31 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            <label>Email</label>
            <input type="text" name="email" required><br>
            <label>Password</label>
            <input type="password" name="pass" required><br>
            <input type="submit" name="submit" value="Login">
        </form>
    </body>
</html>
