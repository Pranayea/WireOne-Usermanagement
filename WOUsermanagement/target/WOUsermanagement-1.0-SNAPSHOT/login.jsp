<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.getAttribute("eMessage");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>


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
                <div class="logo"><a href="index.html" style="color: white;">User Management</a></div>
                <div class="logregbtn">
                    <a href="register.jsp" ><button class="signin-btn">Register</button></a>
                    <a href="login.jsp"><button class="signup-btn">Login</button></a>
                </div>
            </div>
        </div>

        <h2 style="color: red">${eMessage}</h2>
        <h2 style="color: green">${sMessage}</h2>
        <div class="login">
            <div class="login-left">
                <form action="registerLogin" method="POST" class="form-group">
                    <label>Email</label><br>
                    <input type="text" name="email" class="col-lg-12 col-form-label"><br>
                    <label>Password</label><br>
                    <input type="password" name="pass" class="col-lg-12 col-form-label"><br>
                    <input type="submit" name="submit" value="Login" class="col-lg-12 btn btn-success">
                </form>


                <!-- for Forgot password form hide and appear -->
                <div class="" data-toggle="modal"
                     data-target=".user-form">
                    <!-- <button class=""><span class="lnr lnr-plus-circle add-payment-icon"></span> Forgot Password?</button> -->
                    <a href="#">Forgot Password?</a>
                </div>


                <!-- for forgot password
         <div>
             <form action="checkQuestion" method="POST">
                 <label>Email</label><br>
                 <input type="text" name="email" class="col-sm-2 col-form-label"><br>
                 
                 <label>What is the Name Of Your First Pet?</label><br>
                 <input type="text" name="ques1" class="col-sm-2 col-form-label"><br>
                 
                 <label>What is Your Favorite Song?</label><br>
                 <input type="text" name="ques2" class="col-sm-2 col-form-label"><br>
                 
                 <input type="submit" value="Validate" class="btn btn-success">
             </form>
         </div> -->

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

                                    <form class="create-form" action="checkQuestion" method="POST">
                                        <label>Email</label><br>
                                        <input type="text" name="email" class="form-control"><br>

                                        <label>What is the Name Of Your First Pet?</label><br>
                                        <input type="text" name="ques1" class="form-control"><br>

                                        <label>What is Your Favorite Song?</label><br>
                                        <input type="text" name="ques2" class="form-control"><br>

                                        <input type="submit" value="Validate" class="btn btn-info">
                                    </form>
                                </div>
                            </div>


                        </div>
                        <!-- Modal Content: ends -->

                    </div>

                </div>
            </div>
            <div class="login-img">
                <img src="images/login.svg">
            </div>
        </div>


        <style>
            .modal input{

                width: 94% !important;

            }
        </style>





    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>
