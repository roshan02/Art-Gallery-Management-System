<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/frontpage.css">

<title>artist_info</title>

</head>
<h1>Online Art Gallery</h1>
<body>
<form action="Customer" method="post">
<div class="navbar">
  <a href="#home">Home</a>
  <a href="Paintings.jsp">Paintings</a>
  <a href="Exhibition.jsp">Exhibitions</a>
 <a href=""WebContent/css/icomoon.css"frontpage.jsp">Logout</a>
  </div>
  <a href="#" class="navbar1"> <% HttpSession httpSession=request.getSession();
      								out.println("hii "+httpSession.getAttribute("login1"));
 String a = (String) httpSession.getAttribute("login1");%>
</div>
<div class="form-style-5">

<br>
<br>
<%
String url = "jdbc:mysql://localhost:3306/";
String dbName = "art_gallery";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "rutuja8079";
String query= "select * from artist where email = '" + a +"'";
/* String query2="select * from gallery where g_id in(select * from artist where email = ?)";
String query3 ="select * from painting where email = ?"; */

try {
    Class.forName(driver).newInstance();
    Connection conn = DriverManager.getConnection(url + dbName, userName, password);

    Statement st = conn.createStatement();
   
    ResultSet rs = st.executeQuery(query);
  /*   PreparedStatement p1 = conn.prepareStatement(query2);
    p1.setString(1, a);
    PreparedStatement p2 = conn.prepareStatement(query3);
    p2.setString(1, a);
    ResultSet rs1 = p1.executeQuery();
    ResultSet rs2 = p2.executeQuery(); */

    while(rs.next()){
    	%>
    	<fieldset>
<legend><span class="number">1</span> Artist Info</legend>
<!-- <a href="edit.jsp"> Edit Info</a><br><br> -->
Id:<input type="text" name="field1" placeholder="Name *" value="<%= rs.getString(1) %>"> 
email:<input type="text" name="field2" placeholder="Artist ID *" value="<%= rs.getString(2) %>" >
Name:<input type="text" name="field2" placeholder="State *" value="<%= rs.getString(3) %>" >

State:<input type="text" name="field2" placeholder="city *" value="<%= rs.getString(4) %>" >
City:<input type="text" name="field2" placeholder="pincode *" value="<%= rs.getString(5) %>" >
Pincode:<input type="text" name="field2" placeholder="phone no *" value="<%= rs.getString(6) %>" >
Phone no.:<input type="text" name="field2" placeholder="phone no *" value="<%= rs.getString(7) %>" >
Gallery:<input type="text" name="field2" placeholder="phone no *" value="<%= rs.getString(8) %>" >
</select>   
</fieldset>
<fieldset>
<legend><span class="number">2</span> Additional Info</legend>
<textarea name="field3" placeholder="About Artist"></textarea>
</fieldset>

    	
   <%} %>
   <%rs.close();
   st.close();
   conn.close();
   }
   catch (Exception e) {
	   System.out.println(e.getMessage());
   }
   %>


</div>
</form>
</body>
</html>