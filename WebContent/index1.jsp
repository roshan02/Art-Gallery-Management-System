<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<h2>Online Art Gallery</h2>
  <div class="form">

        <div id="login">
          <h1> Login</h1>
          <h2>Welcome Back!</h2>

          <form action="LoginServlet" method="post">

            <div class="field-wrap">
            <label>
              Email<span class="req">*</span>
            </label>
            <input type="text"name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required autocomplete="off"  title="Enter valid email"/>
          </div>
        

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>

          <p class="forgot"><a href="Forgot_password.jsp">Forgot Password?</a></p>

          <button class="button button-block"/>Log In</button>

          </form>

        </div>

</div> 
<!-- /form -->

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="js/index.js"></script>

</body>
</html>
 