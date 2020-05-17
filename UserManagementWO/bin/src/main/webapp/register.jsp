<%-- 
    Document   : register
    Created on : May 15, 2020, 3:29:41 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="register" method="POST">
            <label>Username</label>
            <input type="text" name="uname" required><br>
            
            <label>Email</label>
            <input type="text" name="email" required><br>
            
            <label>Password</label>
            <input type="password" name="pass" required><br>
            
            <input type="submit" value="Register">
        </form>
    </body>
</html>

