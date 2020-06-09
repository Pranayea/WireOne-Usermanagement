<%@page import="com.cw.model.Users"%>
<%@page import="com.cw.Dao.UsersDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
    else{
    int userid = Integer.parseInt(session.getAttribute("userId").toString());
    UsersDao userDao = new UsersDao();
    Users userRole = userDao.getUser(userid);
    if (!userRole.getuRole().equals("client")) {
        response.sendRedirect("/WOUsermanagement/logout");
    }
    }
    int userId = Integer.parseInt(request.getParameter("userId"));
    UsersDao usersDao = new UsersDao();
    Users suser = usersDao.getUser(userId);
    request.setAttribute("users", suser);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Profile</title>


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

        <div class="profile">
            <div class="profile-img">
                <img src="images/profile.svg">
            </div>
            <div style="width: 50%;">
                <div class="profile-details">
                    <label>Username</label> <h3>${users.userName}</h3>
                    <label>First Name</label> <h3>${users.fname}</h3>
                    <label>Last Name</label> <h3>${users.lname}</h3>
                    <label>Email</label> <h3>${users.email}</h3>


                    <div class="" data-toggle="modal"
                         data-target=".user-form">
                        <button class="button"><span class="lnr lnr-plus-circle add-payment-icon "></span> Edit</button>


                    </div>


                    <div class="modal fade user-form" tabindex="-1" role="dialog"
                         aria-labelledby="myLargeModalLabel" aria-hidden="true">

                        <div class="modal-dialog">

                            <!-- Modal Content: begins -->
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <div class="body-message">

                                        <h1>${message}</h1>    
                                        <form action="EditSUser?userId=${users.userId}" method="post" class="edit-form">
                                            <h2 style="margin: 10px; color:#3F704D;">Edit A User</h2>
                                            <label>Username</label>     
                                            <br>  
                                            <input type="text" name="uname" 
                                                   value="${users.userName}"
                                                   />     <br>  

                                            <label>First Name</label>    <br>      
                                            <input type="text" name="fname" 
                                                   value="${users.fname}"
                                                   /> <br>      

                                            <label>Last Name</label>    <br>      
                                            <input type="text" name="lname" 
                                                   value="${users.lname}"
                                                   /> <br>      

                                            <label>Email</label>   <br>       
                                            <input type="text" name="email" 
                                                   value="${users.email} "
                                                   /> <br>

                                            <label>Password</label>  <br>        
                                            <input type="password" name="pass" 
                                                   value="${users.password}"
                                                   /> <br>      

                                            <label>What is the Name Of Your First Pet?</label> <br>  
                                            <input type="text" name="ques1"  value="${users.ques1}" required><br>

                                            <label>What is Your Favorite Song?</label> <br>  
                                            <input type="text" name="ques2" value="${users.ques2}" required><br> <br>  

                                            <input type="submit" value="Save" class="edit-save">
                                        </form>          
                                    </div>
                                </div>


                            </div>
                            <!-- Modal Content: ends -->

                        </div>

                    </div>

                </div>
            </div>
        </div>


    </body>
</html>
