<!-- 
<!DOCTYPE HTML>
<html>
<head>
<title>Reset Password Form  Responsive Widget Template | Home :: w3layouts</title>
<link href="css/stylep.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Reset Password Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
</head>
<body>
<form action="Edit" method="post">
<fieldset>
<legend><span class="number">1</span> Artist Info</legend>
<a href="edit.jsp"> Edit Info</a><br><br>
Id:<input type="text" name="field1" placeholder="id" "> 
email:<input type="text" name="field2" placeholder="email *"   >
Name:<input type="text" name="field3" placeholder="name *"  >

State:<input type="text" name="field4" placeholder="state *" >
City:<input type="text" name="field5" placeholder="city *"  >
Pincode:<input type="text" name="field6" placeholder="pincode *"  >
Phone no.:<input type="text" name="field7" placeholder="phone no *" " >
Gallery:<input type="text" name="field8" placeholder="gallery *"  >

<input type ="submit" value="edit" name="edit">
</select>   
</fieldset>
</form>
</body>
</html> 
 -->
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
  <a href="frontpage.jsp">Home</a>
  <a href="likes.jsp">Paintings</a>
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
    	<fieldset>
<form action="Edit" method="post">
<fieldset>
<legend><span class="number">1</span> Edit Info</legend>


email:<input type="text" name="field22" placeholder="email *"   >
Name:<input type="text" name="field33" placeholder="name *"  >

State:<input type="text" name="field44" placeholder="state *" >
City:<input type="text" name="field55" placeholder="city *"  >
Pincode:<input type="text" name="field66" placeholder="pincode *"  >
Phone no.:<input type="text" name="field77" placeholder="phone no *" " >

<input type ="submit" value="edit" name="edit">
</select>   
</fieldset>
</form>

      				<%-- <%HttpSession httpSession1=request.getSession();
      				String a2 = request.getParameter("field1");
      				httpSession1.setAttribute("loginid", a2 );
 String a1 = (String) httpSession1.getAttribute("loginid");
 %> --%>
<%--  <%response.setContentType("text/html");  
 PrintWriter pw = response.getWriter(); 
 //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
 //Connection connection;  
 Connection conn=null;
 String url="jdbc:mysql://localhost:3306/";
 String dbName="Login";
 String driver="com.mysql.jdbc.Driver";
//String dbUserName="root";
//String dbPassword="root";

try{  
String field1 = request.getParameter("field11");  
String field2 = request.getParameter("field22");  
String field3 = request.getParameter("field33");  
String field4 = request.getParameter("field44");  
String field5 = request.getParameter("field55");  
String field6 = request.getParameter("field66");
String field7 = request.getParameter("field77");  


Class.forName(driver).newInstance();  
conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
PreparedStatement pst =(PreparedStatement) conn.prepareStatement("update artist set email=?, a_name=?, state=?, city=?, pincode=?, phone=?  where a_id=?");//try2 is the name of the table  


pst.setString(1,field2);      
pst.setString(2,field3); 
pst.setString(3,field4); 
pst.setString(4,field5); 
pst.setString(5,field6); 
pst.setString(6,field7);
pst.setString(7, a);

int i = pst.executeUpdate();
//conn.commit(); 
String msg=" ";
if(i!=0){  
 msg="Record has been inserted";
 pw.println("<font size='6' color=blue>" + msg + "</font>"); 
 RequestDispatcher rd=request.getRequestDispatcher("thankyou.jsp");  
 rd.forward(request,response);  


}  
else{  
 msg="failed to insert the data";
 pw.println("<font size='6' color=blue>" + msg + "</font>");
}  
pst.close();
}  
catch (Exception e){  
pw.println(e);  
}  





 %>
 --%>
</div>
</form>
</body>
</html>