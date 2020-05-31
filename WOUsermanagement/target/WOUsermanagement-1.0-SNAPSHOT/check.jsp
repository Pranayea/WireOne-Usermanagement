
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check</title>
    </head>
    <body style="width: 20%">
        <h1>Hello World!</h1>
        <%
            String sql ="SELECT *FROM history INNER JOIN users on users.userId = history.userId";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt", "root", "");
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String username = rs.getString("username");
                String activity = rs.getString("activity");
                Object time = rs.getObject("time");
                out.println(username + activity + time);   
            }                    
        %>
    </body>
</html>
