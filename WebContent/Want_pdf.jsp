<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Want Pdf</title>
</head>
<body>

<div style="text-align:center">  
    <input type="submit" value = "Save As PDF" name = "Save As PDF" margin-top: 600px/>  
</div>  
<%
String url = "jdbc:mysql://localhost:3306/";
String dbName = "art_gallery";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "rutuja8079";
String id =	 request.getParameter("ID");

try {
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url + dbName, "root", "rutuja8079");
    String query = "select * from customer WHERE C_id =?";
    PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
   ps.setString(1, id);
    out.print("<center><table width=25% border=1></center>");
    out.print("<center><h1>StockReceiptReturnQuery:</h1></center>");
    ResultSet rs = (ResultSet) ps.executeQuery();
    /* Printing column names */
    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
    while (rs.next()) {
        out.print("<tr>");
        out.print("<td>" + rsmd.getColumnName(1) + "</td>");
        out.print("<td>" + rs.getString(1) + "</td></tr>");
        out.print("<tr><td>" + rsmd.getColumnName(2) + "</td>");
        out.print("<td>" + rs.getString(2) + "</td></tr>");
        out.print("<tr><td>" + rsmd.getColumnName(3) + "</td>");
        out.print("<td>" + rs.getString(3) + "</td></tr>");
        out.print("<tr><td>" + rsmd.getColumnName(4) + "</td>");
        out.print("<td>" + rs.getString(4) + "</td></tr>");
        
    }
    out.print("</table>");
     
        RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");  
        rd.forward(request,response);  
      ps.close();
     
} catch (Exception e2) {
    e2.printStackTrace();
}


%>

</body>
</html>