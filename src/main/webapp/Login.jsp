<%-- 
    Document   : Login
    Created on : 22 Aug, 2023, 8:22:50 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>HTML5 Login Form with validation Example</title>
 
<link rel="stylesheet" href="css//stylelogin.css">

</head>
<body>
  <br>
  <br>
      <div class="cont">
          <div class="form sign-in">
              <form action="Loginsrv" method="post">
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
          <div class="sub-cont">
              <div class="img">
                  <div class="img__text m--up">
                   
                      <h3>Don't have an account? Please Sign up!<h3>
                  </div>
                  <div class="img__text m--in">
                  
                      <h3>If you already has an account, just sign in.<h3>
                  </div>
                  <div class="img__btn">
                      <span class="m--up">Sign Up</span>
                      <span class="m--in">Sign In</span>
                  </div>
              </div>
              <div class="form sign-up">
                  <form action="Registersrv" method="post">
                  <h2>Create your Account</h2>
                  <label>
                      <span>Name</span>
                      <input type="text" name="vname"/>
                  </label>
                  <label>
                      <span>Mobile</span>
                      <input type="number" name="vmob"/>
                  </label>
                  <label>
                      <span>Email</span>
                      <input type="email" name="vemail"/>
                  </label>
                  <label>
                      <span>Password</span>
                      <input type="password" name="vpass"/>
                  </label>
                  <label>
                      <span>Coumpany</span>
                      <input type="text" name="cname"/>
                  </label>
                  <label>
                      <span>Address</span>
                      <input type="textarea" name="vaddr"/>
                  </label>
                  <button type="submit" class="submit">Sign Up</button>
                  </form>
              </div>
          </div>
      </div>
  
      <script>
          document.querySelector('.img__btn').addEventListener('click', function() {
              document.querySelector('.cont').classList.toggle('s--signup');
          });
      </script>
  
</body>
</html>
