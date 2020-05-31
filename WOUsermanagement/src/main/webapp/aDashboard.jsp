<%-- 
    Document   : aDashboard
    Created on : May 17, 2020, 9:35:13 AM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>        

        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <a href="aDashboard.jsp">Dashboard</a>
        <a href="aHistory.jsp">History</a>
        <a href="userList.jsp">User List</a>

        <h1>Hello ${username}</h1>

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

    </body>
</html>
