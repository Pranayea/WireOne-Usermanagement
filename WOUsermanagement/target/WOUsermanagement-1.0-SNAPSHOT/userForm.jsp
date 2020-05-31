
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Form</title>
    </head>
    <body>

        <div>


            <form action="addUser" method="POST">
                <label>Username</label>
                <input type="text" name="uname" required><br>

                <label>First Name</label>
                <input type="text" name="fname" required><br>

                <label>Last Name</label>
                <input type="text" name="lname" required><br>

                <label>Email</label>
                <input type="text" name="email" required><br>

                <label>Password</label>
                <input type="password" name="pass" required><br>

                <label>What is the Name Of Your First Pet?</label>
                <input type="text" name="ques1" required><br>

                <label>What is Your Favorite Song?</label>
                <input type="text" name="ques2" required><br>

                <input type="submit" value="Save User">
            </form>

        </div>
    </body>
</html>
