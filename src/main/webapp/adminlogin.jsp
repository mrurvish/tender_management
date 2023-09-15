<%-- 
    Document   : adminlogin
    Created on : 15 Sep, 2023, 9:05:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css//stylelogin.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="cont">
        <div class="form sign-in" align="center">
              <form action="Loginsrv" method="post" align="center">
              <h2>Welcome</h2>
              <label>
                  <span>Email</span>
                  <input type="text" name="username"/>
              </label>
              <label>
                  <span>Password</span>
                  <input type="password" name="password"/>
              </label>
              <p class="forgot-pass">Forgot password?</p>
              <button type="submit" class="submit">Sign In</button>
              
              </form>
          </div>
        </div>
    </body>
</html>
