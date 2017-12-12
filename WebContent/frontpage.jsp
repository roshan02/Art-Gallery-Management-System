
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%-- <%@ page import="javax.portlet.PortletPreferences" %> --%>
<%-- <%@ taglib uri="/WEB-INF/tld/liferay-portlet.tld" prefix="portlet" %>
<portlet:defineObjects /> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Art Gallery</title>
<link rel="stylesheet" href="css/frontpage.css">
	<script type="text/javascript" href="js/frontpage.js"></script>
 -<link rel="shortcut icon" href="favicon.ico">
</head>
<body background="art_gallery_wall_background_wallpaper.jpg">
<h2>Online Art Gallery</h2>
<div class="navbar">
  <a href="frontpage.jsp">Home</a>
  <a href="visitorsignup.jsp">Paintings</a>
  <a href="Exhibition.jsp">Exhibitions</a>
  <div class="dropdown1">
    <button class="dropbtn1">SignUp
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content1">
      <a href="index.jsp">Artist</a>
      <!-- <a href="#">Customer</a>
 -->    </div>
  </div>
  <div class="dropdown1">
    <button class="dropbtn1">Login
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content1">
      <a href="index1.jsp">Admin</a>
      <!-- <a href="index1.jsp">Customer</a> -->
      <a href="index1.jsp">Artist</a>
    </div>
  </div>
</div>
<br>
<br>

<style>
* {box-sizing:border-box}
body {
	font-family: Verdana,sans-serif;
	/* //background-image:url("Images/art_gallery_wall_background_wallpaper.jpg"); */
}
.mySlides {
	display:none;
	/* height: 1vw !important;  */
	}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  max-height: 5000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  height: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>


<!-- <h2>Automatic Slideshow</h2>
<p>Change image every 2 seconds:</p>
 -->
<div class="slideshow-container">

<div class="mySlides fade">
<!--   <div class="numbertext">1 / 3</div>
 -->  <img src="https://www.thechannels.org/wp-content/uploads/2016/09/MTWTsuno3-edit-1.jpg" style="width:100%;height:30vw">
  
</div>

<div class="mySlides fade">
  <!-- <div class="numbertext">2 / 3</div> -->
  <img src="https://1.bp.blogspot.com/-r3YNBP3Cohk/Wa0p9Wjy9YI/AAAAAAAAkeM/OssgRUkyRv4J0duhN72SgM3q9NnZXWInQCLcBGAs/s1600/corey_barksdale_art.jpg" style="width:100% ;height:30vw">
  
</div>

<div class="mySlides fade">
  <!-- <div class="numbertext">3 / 3</div> -->
  <img src="https://www.wandermonkey.com/images/listing_images/gallery/1277/Jehangir%20Art%20Gallery%20Mumbai%20Attractions%20WanderMonkey.com%20(11).JPG" style="width:100%;height:30vw">
  
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>