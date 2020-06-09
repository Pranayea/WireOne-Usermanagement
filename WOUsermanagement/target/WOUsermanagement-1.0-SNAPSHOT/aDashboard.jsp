
<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="com.cw.model.Users"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin Dashboard</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
              integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css"> 
    </head>
</head>
<body>        

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("username") == null && session.getAttribute("email") == null && session.getAttribute("password") == null) {       
            response.sendRedirect("login.jsp");
        }
        else{
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
        UsersDao userDao = new UsersDao();
        Users userRole = userDao.getSUser(email,password);
        if(userRole.getuRole().equals("client")){
            response.sendRedirect("/WOUsermanagement/logout");
        }
        }
    %>

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


    <h1 style="margin: 36px 20px 34px 62px; color:#3F704D;">Hello, ${userRole} ${username}</h1>
    <div class="dashboard">
        <div class="dashboard-box">
            <i class="fas fa-users"></i>
            <div>
                <h3>Total Users</h3>
                <h6>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
                            PreparedStatement ps = con.prepareStatement("select count(*) from users");
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                                String num = rs.getString("count(*)");
                                out.print(num);
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </h6>
            </div>
        </div>

        <div class=" dashboard-box">
            <i class="fas fa-users"></i>
            <div>
                <h3>Active Users</h3>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
                        PreparedStatement ps = con.prepareStatement("select count(*) from users where status=?");
                        ps.setString(1, "active");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String num = rs.getString("count(*)");
                            out.print(num);
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>

        <div class="dashboard-box">
            <i class="fas fa-users"></i>
            <div>
                <h3>Blocked Users</h3>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
                        PreparedStatement ps = con.prepareStatement("select count(*) from users where status = ?");
                        ps.setString(1, "blocked");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            String num = rs.getString("count(*)");
                            out.print(num);
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
    </div>
            
</body>
</html>
