
<%@page import="java.util.List"%>
<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    UsersDao usersDao = new UsersDao();
    List<Users> usersList = usersDao.userList();
    request.setAttribute("usersList", usersList);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users List</title>
    </head>
    <body>
        <a href="userForm.jsp">Add User</a>

        <table border="1" cellpadding="5">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>User Role</th>
                <th>Status</th>
                <th>Join Date</th>
                <th>Answer 1</th>
                <th>Answer 2</th>
            </tr>
            <c:forEach var="user" items="${usersList}">
                <tr>
                    <td><c:out value="${user.userId}" /></td>
                    <td><c:out value="${user.userName}" /></td>
                    <td><c:out value="${user.fname}" /></td>
                    <td><c:out value="${user.lname}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.uRole}" /></td>
                    <td><c:out value="${user.status}" /></td>
                    <td><c:out value="${user.joinDate}" /></td>
                    <td><c:out value="${user.ques1}" /></td>
                    <td><c:out value="${user.ques2}" /></td>
                    <td>
                        <a href="eUserForm.jsp?userId=<c:out value='${user.userId}'/>"><button>Edit</button></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="deleteUser?userId=<c:out value='${user.userId} '/>"><button>Delete</button></a> 
                        <c:if test="${user.status eq 'active'}">
                            <a href="blockUser?userId=<c:out value='${user.userId} '/>"><button>Block</button></a>    
                        </c:if>
                        <c:if test="${user.status eq 'blocked'}">
                            <a href="unblockUser?userId=<c:out value='${user.userId} '/>"><button>Unblock</button></a>
                        </c:if>

                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
