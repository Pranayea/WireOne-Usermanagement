

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <h1>Hello User</h1>
        <form action="resetPassword?userId=${userId}" method="POST">
            <label>Password</label>
            <input type="password" name="pass1"><br>

            <label>Confirm Password</label>
            <input type="password" name="pass2"><br>
            
            <input type="submit" value="Change Password"><br>
        </form>
    </body>
</html>
