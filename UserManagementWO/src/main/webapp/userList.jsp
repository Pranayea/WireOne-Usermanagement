<%-- 
    Document   : userList
    Created on : May 17, 2020, 3:23:30 PM
    Author     : DELL
--%>

<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="java.util.List"%>
<%@page import="com.cw.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  
    UsersDao usersDao = new UsersDao();
    List<Users> userlist = usersDao.userList();
    request.setAttribute("userlist",userlist);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Users</title>
    </head>
    <body>
        <a href="UsersForm.jsp">Add Users</a
        
            <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>User List</h2></caption>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Role</th>
                <th>Status</th>
                <th>Join Date</th>
            </tr>
            <c:forEach var="users" items="${userlist}">
                <tr>
                    <td><c:out value="${users.userId}" /></td>
                    <td><c:out value="${users.userName}" /></td>
                    <td><c:out value="${users.fname}" /></td>
                    <td><c:out value="${users.lname}" /></td>
                    <td><c:out value="${users.email}" /></td>
                    <td><c:out value="${users.password}" /></td>
                    <td><c:out value="${users.uRole}" /></td>
                    <td><c:out value="${users.status}" /></td>
                    <td><c:out value="${users.joinDate}" /></td>
                    <td>
                        <a href="/editUser?id=<c:out value='${users.userId}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/deleteUser?id=<c:out value='${users.userId}' />">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   
    </body>
</html>
