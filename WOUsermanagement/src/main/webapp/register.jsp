<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Register</title>
    

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
        <form class="form-group" action="registerLogin" method="POST">
            <label>Username</label><br>
            <input type="text" name="uname" required class="col-sm-2 col-form-label"><br>
            
            <label>First Name</label><br>
            <input type="text" name="fname" required class="col-sm-2 col-form-label"><br>
            
            <label>Last Name</label><br>
            <input type="text" name="lname" required class="col-sm-2 col-form-label"><br>
            
            <label>Email</label><br>
            <input type="text" name="email" required class="col-sm-2 col-form-label"><br>
            
            <label>Password</label><br>
            <input type="password" name="pass" required class="col-sm-2 col-form-label"><br>
            
            <label>What is the Name Of Your First Pet?</label><br>
            <input type="text" name="ques1" required class="col-sm-2 col-form-label"><br>
            
            <label>What is Your Favorite Song?</label><br>
            <input type="text" name="ques2" required class="col-sm-2 col-form-label"><br>
            
            <input type="submit" name="submit"  value="Register" class="btn btn-primary">
        </form>
    </body>
</html>

