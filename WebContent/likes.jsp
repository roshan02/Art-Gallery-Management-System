<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>like</title>
<link type="text/css" rel="stylesheet" href="css/frontpage.css"/>
<link rel="shortcut icon" href="favicon.ico">

	<!-- Google Webfonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style1.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>

</head>
<body>
<div class="navbar">
  <a href="frontpage.jsp">Home</a>
  <a href="likes.jsp">Paintings</a>
  <!--  <a href="My_profile.jsp">My Profile</a>
    <a href="gallery_option.jsp">Gallery options</a>
     <a href="upload_paintings.jsp">Upload Paintings</a> -->
     <a href="search.jsp">Search</a>
      <a href="frontpage.jsp">Logout</a>
       <a href="#" class="navbar1"><% HttpSession httpSession=request.getSession();
			String id = request.getParameter("email");
			httpSession.setAttribute("login1",id );
			if(id != null) {
				out.println("hii "+httpSession.getAttribute("login1"));
			}
			String a = (String)httpSession.getAttribute("login1");%>

     
</div>
<form action="likes1.jsp" method="post"  onsubmit="index.jsp">
<div id="fh5co-main">
		<div class="container">

			<div class="row">

        <div id="fh5co-board" data-columns>
        
	        	  	


<%
String url = "jdbc:mysql://localhost:3306/";
String dbName = "art_gallery";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "rutuja8079";
String query= "select * from painting";
//String query2 = "insert into likes (v_id, title) values(?, ?)";
try {
    Class.forName(driver).newInstance();
    Connection conn = DriverManager.getConnection(url + dbName, userName, password);

    Statement st = conn.createStatement();
   
    ResultSet rs = st.executeQuery(query);
    while(rs.next()){
    	%>
    	<div class="item">
        		<div class="animate-box">
	        		<a href=<%= rs.getString("url") %> class="image-popup fh5co-board-img"><img src=<%= rs.getString("url") %> alt="Free HTML5 Bootstrap template"></a>
	        		<div class="image-popup fh5co-desc"><%= rs.getString("title") %>
	        		
	        		</div>
	        		<a href="likes1.jsp?value=<%= rs.getString("title")%>">Like</a>
        		</div>
        		</div>
   <%}
    rs.close();
    // rs1.close();
     st.close();
     conn.close();
     }
     catch (Exception e) {
  	   
  	   System.out.println(e.getMessage());
     }
 
%> 
   
   </div>
</div>
</div>
   <script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Salvattore -->
	<script src="js/salvattore.min.js"></script>
	<!-- Main JS -->
	<script src="js/main1.js"></script>
   
</form>
</body>
</html>