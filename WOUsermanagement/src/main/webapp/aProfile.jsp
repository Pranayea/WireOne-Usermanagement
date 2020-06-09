<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
    else{
    int userid = Integer.parseInt(session.getAttribute("userId").toString());
    UsersDao userDao = new UsersDao();
    Users userRole = userDao.getUser(userid);
    if (userRole.getuRole().equals("client")) {
        response.sendRedirect("/WOUsermanagement/logout");
    }
    }
    int userId = Integer.parseInt(request.getParameter("userId"));
    UsersDao usersDao = new UsersDao();
    Users suser = usersDao.getUser(userId);
    request.setAttribute("users", suser);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Profile</title>


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>


        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>

        <div class="index">
            <div class="header">
                <div class="logo"><a href="aDashboard.jsp" style="color: white;">Dashboard</a></div>
                <div class="nav-list">
                    <a href="aHistory.jsp"><div>History</div></a>
                    <a href="userList.jsp"><div>User List</div></a>
                    <a href="Report.jsp"><div>Report</div></a>   
                    <a href="aProfile.jsp?userId=${userId}"><div>Profile</div></a>  
                </div>
                <div class="logregbtn">
                    <form action="logout">
                        <button type="submit" class="signup-btn">Logout</button>
                    </form>            
                </div>
            </div>
        </div>

        <div class="profile">
            <div class="profile-img">
                <img src="images/profile.svg">
            </div>
            <div class="profile-details">
                <label>Username</label> <h3>${users.userName}</h3>
                <label>First Name</label> <h3>${users.fname}</h3>
                <label>Last Name</label> <h3>${users.lname}</h3>
                <label>Email</label> <h3>${users.email}</h3>
            </div>
        </div>
    </body>
</html>
