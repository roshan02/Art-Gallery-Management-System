<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta charset="UTF-8">
  <title>visitor signup</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<h2>Online Art Gallery</h2>
<body background="images/images.jpeg">
 <!-- <form action="Paintings.jsp" onsubmit="Artist.jsp"> -->
  <div class="form">

      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>

      <div class="tab-content">
        <div id="signup">
          <h1>Sign Up for Free</h1>

          <form action="Signupservlet1" method="post" onSubmit="return ValidateEmail()">>

          <!-- <div class="top-row"> -->
            <div class="field-wrap">
              <label>
                Emailid<span class="req">*</span>
              </label>
              <input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required autocomplete="off" title="Enter valid Email" />
            </div>
            <div class="field-wrap">
            <label>
              set a password<span class="req">*</span>
            </label>
            <input type="password" name="password1" required autocomplete="off"/>
          </div>
<!-- 			<input type="submit" class="button button-block" name="submit" value="Get Started"> -->
          <button type="submit" class="button button-block"/>Get Started</button>
 
          </form>

        </div>

        <div id="login">
          <h1>Welcome Back!</h1>

          <form action="LoginServlet" method="post" onSubmit="return ValidateEmail()">>

            <div class="field-wrap">
            <label>
              Email<span class="req">*</span>
            </label>
            <input type="text"name="email"  scope="session" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required autocomplete="off" title="Enter valid Email"/>
            
          </div>
        

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>

          <p class="forgot"><a href="#">Forgot Password?</a></p>

          <button class="button button-block" type="submit"/>Log In</button>

          </form>

        </div>

      </div><!-- tab-content -->

</div> 
<!-- /form -->

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="js/index.js"></script>
<script language = "Javascript">

function emailcheck(str) {

var at="@"
var dot="."
var lat=str.indexOf(at)
var lstr=str.length
var ldot=str.indexOf(dot)
if (str.indexOf(at)==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at,(lat+1))!=-1){
alert("Invalid E-mail ID")
return false
}

if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot,(lat+2))==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(" ")!=-1){
alert("Invalid E-mail ID")
return false
}
alert("valid E-mail ID")
return true 
}

function ValidateEmail(){
var emailID=document.frm.txtEmail

if ((emailID.value==null)||(emailID.value=="")){
alert("Please Enter your Email Address")
emailID.focus()
return false
}
if (emailcheck(emailID.value)==false){
emailID.value=""
emailID.focus()
return false
}
return true
}
</script>
    

</body>
</html>
 