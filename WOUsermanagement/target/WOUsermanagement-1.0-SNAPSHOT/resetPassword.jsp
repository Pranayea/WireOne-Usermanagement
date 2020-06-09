

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        
          <link rel="stylesheet" href="css/main.css"> 
    </head>
    <body >
        <div class="register">
            <div class="reset-left">
                
                <form action="resetPassword?userId=${userId}" method="POST">
                    <h1 style="color:  #3F704D; font-style: italic;">Hello User</h1>
                    <label>Password</label><br>
                    <input type="password" name="pass1"><br>

                    <label>Confirm Password</label>
                    <input type="password" name="pass2"><br>

                    <input type="submit" value="Change Password" class="button"><br>
                </form>
            </div>

            <div class="register-img">
                <img src="images/thinking.svg">
            </div>
        </div>
    </body>
</html>
