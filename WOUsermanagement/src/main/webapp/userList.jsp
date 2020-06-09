
<%@page import="java.util.List"%>
<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

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
    UsersDao usersDao = new UsersDao();
    List<Users> usersList = usersDao.userList();
    request.setAttribute("usersList", usersList);
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>User List</title>


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


        <div class="list-head">
            <h2 style="margin: 20px;">List of Users</h2>
            <a href="userForm.jsp" style="margin: 20px;"><button class="button">Add User</button></a>
        </div>
        <table class="table table-hover">


            <tr>
                <th scope="col">User ID</th>
                <th scope="col">Username</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <th scope="col">User Role</th>
                <th scope="col">Status</th>
                <th scope="col">Join Date</th>
                <th scope="col">Answer 1</th>
                <th scope="col">Answer 2</th>
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
                        <c:if test="${user.uRole eq 'admin'}">
                            <a href="showEditForm?userId=<c:out value='${user.userId}'/>"><button class="btn btn-info">Edit</button></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>

                        <c:if test="${user.uRole eq 'client'}">
                            <a href="showEditForm?userId=<c:out value='${user.userId}'/>"><button class="btn btn-info">Edit</button></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:if test="${user.status eq 'active'}">
                                <a href="blockUser?userId=<c:out value='${user.userId} '/>"><button class="btn btn-warning">Block</button></a>    
                            </c:if>
                            <c:if test="${user.status eq 'blocked'}">
                                <a href="unblockUser?userId=<c:out value='${user.userId} '/>"><button class="btn btn-warning">Unblock</button></a>
                            </c:if>
                            <a href="deleteUser?userId=<c:out value='${user.userId} '/>"><button class="btn btn-danger">Delete</button></a> 
                        </c:if>

                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
