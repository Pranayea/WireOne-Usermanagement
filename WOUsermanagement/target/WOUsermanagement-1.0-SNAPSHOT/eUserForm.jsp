<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="com.cw.model.Users"%>
<%

    int userId = Integer.parseInt(request.getParameter("userId"));
    UsersDao usersDao = new UsersDao();
    Users suser = usersDao.getUser(userId);
    request.setAttribute("users",suser);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>        
        <form action="editUser" method="post">
            Edit A User
            <input type="hidden" name="userId" value="${users.userId}">
            <br>
            <label>Username</label>       
            <input type="text" name="uname" 
                   value="${users.userName}"
                   /> <br>      

            <label>First Name</label>       
            <input type="text" name="fname" 
                   value="${users.fname}"
                   /> <br>      

            <label>Last Name</label>       
            <input type="text" name="lname" 
                   value="${users.lname}"
                   /> <br>      

            <label>Email</label>       
            <input type="text" name="email" 
                   value="${users.email} "
                   /> <br>

            <label>Password</label>       
            <input type="password" name="pass" 
                   value="${users.password}"
                   /> <br>      

            <label>What is the Name Of Your First Pet?</label>
            <input type="text" name="ques1"  value="${users.ques1}" required><br>

            <label>What is Your Favorite Song?</label>
            <input type="text" name="ques2" value="${users.ques2}" required><br>

            <input type="submit" value="Save">
        </form>                
    </body>
</html>
