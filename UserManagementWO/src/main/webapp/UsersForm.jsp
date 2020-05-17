<%-- 
    Document   : addUsers
    Created on : May 17, 2020, 3:24:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        
        <div>
<!--            <c:if test="${users != null}">
                <form action="editUser" method="post">
            </c:if>        
            <c:if test="${users == null}">
                <form action="addUser" method="post">
            </c:if>
             
            <c:if test="${users != null}">
                        Edit A User
            </c:if>
            <c:if test="${users == null}">
                        Add A User
            </c:if>
            
            <br>
            <c:if test="${book != null}">
                    <input type="hidden" name="id" value="<c:out value='${book.id}' />" />
            </c:if>
                    
            <label>Username</label>       
            <input type="text" name="uname" 
                            value="<c:out value='${users.userName}' />"
                        /> <br>      
            
            <label>First Name</label>       
            <input type="text" name="fname" 
                            value="<c:out value='${users.fname}' />"
                        /> <br>      
            
            <label>Last Name</label>       
            <input type="text" name="lname" 
                            value="<c:out value='${users.lname}' />"
                        /> <br>      
            
            <label>Email</label>       
            <input type="text" name="email" 
                            value="<c:out value='${users.email}' />"
                        /> <br>
            
            <label>Password</label>       
            <input type="password" name="pass" 
                            value="<c:out value='${users.pass}' />"
                        /> <br>      
             <input type="submit" value="Save User" />
             
            </form>>-->

            <form action="addUser" method="POST">
            <label>Username</label>
            <input type="text" name="uname" required><br>
            
            <label>First Name</label>
            <input type="text" name="fname" required><br>
            
            <label>Last Name</label>
            <input type="text" name="lname" required><br>
            
            <label>Email</label>
            <input type="text" name="email" required><br>
            
            <label>Password</label>
            <input type="password" name="pass" required><br>
            
            <input type="submit" value="Register">
        </form>
            
        </div>
    </body>
</html>
