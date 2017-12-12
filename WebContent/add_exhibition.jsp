<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Exhibition</title>
<link type="text/css" rel="stylesheet" href="css/frontpage.css"/>
</head>
<h1>Online Art Gallery</h1>
<body>
<div class="navbar">
  <a href="frontpage.jsp">Home</a>
  <a href="About_us.jsp">About us</a>
   <a href="Change_password.jsp">Change Password</a>
    <a href="frontpage.jsp">Logout</a>
 </div>

<style>
/* General Styles */
body { 
     background: url('https://media.licdn.com/mpr/mpr/AAEAAQAAAAAAAAvYAAAAJDU4YTc5NjBhLWM5MjQtNDlmZS1iZGUwLTYwODUxNTBiNWRiNQ.jpg') no-repeat center center fixed;    
     background-size:cover;  
} 
/*html{
   background:url(http://phutora.com/img/friends3.jpg) no-repeat;
   background-size: cover;
   height:100%;
   background-color: #000;
} */
* {
   box-sizing:border-box;
   -webkit-box-sizing:border-box;
   -moz-box-sizing:border-box;
   -webkit-font-smoothing:antialiased;
   -moz-font-smoothing:antialiased;
   -o-font-smoothing:antialiased;
   font-smoothing:antialiased;
   text-rendering:optimizeLegibility;
}
body {
   color: #C0C0C0;
   font-family: Arial, san-serif;
}


/* Contact Form Styles */
h1 {
   margin: 10px 0 0 0;
}
h4{
   margin: 0 0 20px 0;
}
#contact-form {
   background-color:rgba(72,72,72,0.7);
   padding: 10px 20px 30px 20px;
   max-width:100%;
   float: left;
   left: 50%;
   position: absolute;
   margin-top:30px;
   margin-left: -260px;
   border-radius:7px;
   -webkit-border-radius:7px;
   -moz-border-radius:7px;
}
#contact-form input,   
#contact-form select,   
#contact-form textarea,   
#contact-form label { 
   font-size: 15px;  
   margin-bottom: 2px;
   font-family: Arial, san-serif;
} 
#contact-form input,   
#contact-form select,   
#contact-form textarea { 
   width:100%;
   background: #fff;
   border: 0; 
   -moz-border-radius: 4px;  
   -webkit-border-radius: 4px;  
   border-radius: 4px;
   margin-bottom: 25px;  
   padding: 5px;  
}  
#contact-form input:focus,   
#contact-form select:focus,   
#contact-form textarea:focus {  
   background-color: #E5E6E7; 
}  
#contact-form textarea {
   width:100%;
   height: 150px;
}
#contact-form button[type="submit"] {
   cursor:pointer;
   width:100%;
   border:none;
   background:#991D57;
   background-image:linear-gradient(bottom, #8C1C50 0%, #991D57 52%);
   background-image:-moz-linear-gradient(bottom, #8C1C50 0%, #991D57 52%);
   background-image:-webkit-linear-gradient(bottom, #8C1C50 0%, #991D57 52%);
   color:#FFF;
   margin:0 0 5px;
   padding:10px;
   border-radius:5px;
}
#contact-form button[type="submit"]:hover {
   background-image:linear-gradient(bottom, #9C215A 0%, #A82767 52%);
   background-image:-moz-linear-gradient(bottom, #9C215A 0%, #A82767 52%);
   background-image:-webkit-linear-gradient(bottom, #9C215A 0%, #A82767 52%);
   -webkit-transition:background 0.3s ease-in-out;
   -moz-transition:background 0.3s ease-in-out;
   transition:background-color 0.3s ease-in-out;
}
#contact-form button[type="submit"]:active {
   box-shadow:inset 0 1px 3px rgba(0,0,0,0.5);
}
input:required, textarea:required {  
   box-shadow: none;
   -moz-box-shadow: none;  
   -webkit-box-shadow: none;  
   -o-box-shadow: none;  
} 
#contact-form .required {  
   font-weight:bold;  
   color: #E5E6E7;      
}

/* Hide success/failure message
   (especially since the php is missing) */
#failure, #success {
   color: #6EA070; 
   display:none;  
}

/* Make form look nice on smaller screens */
@media only screen and (max-width: 580px) {
   #contact-form{
      left: 3%;
      margin-right: 3%;
      width: 88%;
      margin-left: 0;
      padding-left: 3%;
      padding-right: 3%;
   }
}
</style>
<!-- 
  ****************************************
  Contest Entry for Treehouse:
  "Design a Contact Form"
  Submitted by Lisa Wagner
  ****************************************
-->

<div id="contact-form">
	<div>
		<h1>Exhibition Details</h1>  
	</div>
		   <form action="AddExhibition" method="post" >
			<div>
		      <label for="ID">
		      	<span class="required">Exhibition ID:</span> 
		      	<input type="text" id="ID" name="ID" value="" placeholder="Generate ID for exhibition" required="required" tabindex="1" autofocus="autofocus" />
		      </label> 
			</div>
			<div>
		      <label for="Name">
		      	<span class="required">Exhibition Name: </span>
		      	<input type="text" id="name" name="Name" value="" placeholder="Name of Exhibition" tabindex="2" required="required" />
		      </label>  
			</div>
			<div>
		      <label for="type">
		      	<span class="required">Exhibition Type: </span>
		      	<input type="text" id="type" name="Type" value="" placeholder="Enter Exhibition Type" tabindex="3" required="required" />
		      </label>  
			</div>
			<div>
		      <label for="Name">
		      	<span class="required">Start Date: </span>
		      	<input type="date" id="s_date" name="S_date" value="" placeholder="Enter start date" tabindex="4" required="required" />
		      </label>  
			</div>
			<div>
		      <label for="Name">
		      	<span class="required">End Date: </span>
		      	<input type="date" id="e_date" name="E_date" value="" placeholder="Enter end date" tabindex="5" required="required" />
		      </label>  
			</div>
			 <%
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "art_gallery";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String password = "rutuja8079";
			String query= "select * from gallery";
			try
			{
				Class.forName(driver).newInstance();
			    Connection conn = DriverManager.getConnection(url + dbName, userName, password);

			    Statement st = conn.createStatement();
			   
			    ResultSet rs = st.executeQuery(query);
			   
			%>
			<span class="required">Select Gallery Name: </span>
			<select name = "gallery_name">
			<option value = "Select Exhibition Name"></option>
			<%
			while(rs.next())
			{
			String fname = rs.getString("g_name"); 
			%>
			<option value="<%=fname %>"><%=fname %></option>
			<%
			}
			%>
			</select>
			<%
			}
			catch (Exception e) {
			   }
			%>			
 		      <button name="submit" type="submit" id="submit" >ADD</button> 
			</div>
		   </form>

	</div>
  <script  src="js/index.js"></script>
</body>
</html>