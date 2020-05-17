<%-- 
    Document   : check
    Created on : May 15, 2020, 3:29:53 PM
    Author     : DELL
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Hello
        <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umngt","root","");
            if(con == null){
                out.println("Failed");
            }
            else{
                out.println("Yeaaaaaaaaaaah Passed");
            }
        %>
        
    </body>
</html>