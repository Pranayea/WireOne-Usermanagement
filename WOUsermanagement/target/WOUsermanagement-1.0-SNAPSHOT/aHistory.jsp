<%@page import="com.cw.model.History"%>
<%@page import="java.util.List"%>
<%@page import="com.cw.Dao.HistoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    HistoryDao hisDao = new HistoryDao();
    List<History> historyList = hisDao.listHistory();
    request.setAttribute("historyList", historyList);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
        <h1>History</h1>
        <c:forEach var="history" items="${historyList}">
            <p>
            <c:out value="${history.hid}"/>
            <c:out value="${history.userId}"/>
            <c:out value="${history.activity}"/>
            <c:out value="${history.time}"/> 
            </p><br>            
        </c:forEach>
    </body>
</html>
