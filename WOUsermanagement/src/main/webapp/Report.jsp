<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="java.util.List"%>
<%@page import="com.cw.model.ReportAndHistory"%>
<%@page import="com.cw.Dao.HistoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Report</title>


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


        <h1 style="margin: 36px 20px 34px 62px; color:#3F704D;">Report</h1>
        <form action="report" method="post" class="report form">
            <div>
                <label>Start Date</label>
                <input type="date" name="sDate" min="2020-06-01">
            </div><br>
            <div>
                <label>End Date</label>
                <input type="date" name="eDate" min="2020-06-01"></div><br>
            <div>
                <label>Activity</label>
                <Select name="activity">
                    <option>logged in the system</option>
                    <option>Added User</option>
                    <option>Blocked User</option>
                    <option>Unblocked User</option>
                    <option>logged out</option>
                    <option>Deleted User</option>
                    <option>Edited Info Of</option>
                    <option>Edit their info</option>
                </select>
            </div>

            <input type="submit" name="submit" values="Generate" class="button">
        </form>



        <div class="report-result">
            <c:forEach var="report" items="${report}">
                <p>
                <div style="color: turquoise;"><c:out value="${report.username}"/></div>                
                <c:out value="${report.activity}"/>
                <div style="color: turquoise;"><c:out value="${report.aUsername}"/></div>
                <c:out value="${report.time}"/> 
            </p><br>            
        </c:forEach>
    </div>
</body>
</html>
