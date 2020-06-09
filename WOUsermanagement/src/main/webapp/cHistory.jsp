
<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page import="java.util.List"%>
<%@page import="com.cw.model.ReportAndHistory"%>
<%@page import="com.cw.Dao.HistoryDao"%>
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
    if (!userRole.getuRole().equals("client")) {
        response.sendRedirect("/WOUsermanagement/logout");
    }
    }
    String user = request.getParameter("username");
    HistoryDao hisDao = new HistoryDao();
    List<ReportAndHistory> historyList = hisDao.listHistory(user);
    request.setAttribute("historyList", historyList);

%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>History</title>


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
                <div class="logo"><a href="cDashboard.jsp" style="color: white;">Dashboard</a></div>
                <div class="nav-list">
                    <a href="cHistory.jsp?username=${username}"><div>History</div></a>
                    <a href="cProfile.jsp?userId=${userId}"><div>Profile</div></a>  
                </div>
                <div class="logregbtn">
                    <form action="logout">
                        <button type="submit" class="signup-btn">Logout</button>
                    </form>            
                </div>
            </div>
        </div>   

        <div class="history">
            <h1>History</h1>
            <c:forEach var="history" items="${historyList}">
                <p>
                <div style="color: turquoise;"><c:out value="${history.username}"/></div>
                <c:out value="${history.activity}"/>
                <div style="color: turquoise;"><c:out value="${history.aUsername}"/></div>
                <c:out value="${history.time}"/> 
            </p><br>            
        </c:forEach>
    </div>
</body>
</html>
