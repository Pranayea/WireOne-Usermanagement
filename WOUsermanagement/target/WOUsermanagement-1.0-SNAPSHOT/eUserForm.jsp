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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>Edit User</title>

        <link rel="stylesheet" href="css/main.css"> 
    </head>
    <body>   
        <div class="login">
            <div class="useredit-left">
                <form action="editUser?userId=${users.userId}" method="post">
                    <h1 style="color:  #3F704D; font-style: italic;">Edit a User</h1>
                    <label>Username</label>   <br>      
                    <input type="text" name="uname" 
                           value="${users.userName}"
                           /> <br>      

                    <label>First Name</label>    <br>     
                    <input type="text" name="fname" 
                           value="${users.fname}"
                           /> <br>      

                    <label>Last Name</label>    <br>     
                    <input type="text" name="lname" 
                           value="${users.lname}"
                           /> <br>      

                    <label>Email</label>       <br>  
                    <input type="text" name="email" 
                           value="${users.email} "
                           /> <br>

                    <label>Password</label>     <br>    
                    <input type="password" name="pass" 
                           value="${users.password}"
                           /> <br>      

                    <label>What is the Name Of Your First Pet?</label><br>  
                    <input type="text" name="ques1"  value="${users.ques1}" required><br>

                    <label>What is Your Favorite Song?</label><br>  
                    <input type="text" name="ques2" value="${users.ques2}" required><br>

                    <input type="submit" value="Save" class="button">
                </form> 
            </div>
            <div class="login-img">
                <img src="images/add.svg">
            </div>

        </div>            
    </body>
</html>
