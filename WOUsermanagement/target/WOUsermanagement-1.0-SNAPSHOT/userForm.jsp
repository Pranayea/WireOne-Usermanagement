
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="com.cw.model.Users"%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
    else{
    int userId = Integer.parseInt(session.getAttribute("userId").toString());
    UsersDao userDao = new UsersDao();
    Users userRole = userDao.getUser(userId);
    if (userRole.getuRole().equals("client")) {
        response.sendRedirect("/WOUsermanagement/logout");
    }
    }
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Form</title>
        <link rel="stylesheet" href="css/main.css"> 
    </head>
    <body>
        <div class="userform">
        <div class="userform-img">
            <img src="images/addPost.svg">
        </div>
            <div class="userform-right">


            <form action="addUser" method="POST">
                <label>Username</label><br>
                <input type="text" name="uname" required><br>

                <label>First Name</label><br>
                <input type="text" name="fname" required><br>

                <label>Last Name</label><br>
                <input type="text" name="lname" required><br>

                <label>Email</label><br>
                <input type="text" name="email" required><br>

                <label>Password</label><br>
                <input type="password" name="pass" required><br>

                <label>What is the Name Of Your First Pet?</label><br>
                <input type="text" name="ques1" required><br>

                <label>What is Your Favorite Song?</label><br>
                <input type="text" name="ques2" required><br>

                <input type="submit" value="Save User" class="button">
            </form>

        </div>
        </div>
    </body>
</html>
