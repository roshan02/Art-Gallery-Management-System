<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%

   /*  if (request.getParameter("id") != null && request.getParameter("id") != "")
    {
        id = Integer.parseInt(request.getParameter("id").toString());
    }
 */
 String url = "jdbc:mysql://localhost:3306/";
    String dbName = "art_gallery";
	String driver = "com.mysql.jdbc.Driver";
    Statement stmt = null;
    Connection con = null;
    String Content = new String("");
	String id = "C1";
    try
    {
        String filename = "data" + id + ".pdf";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url + dbName, "root", "rutuja8079");

        stmt = con.createStatement();
        String qry = "select * from customer where c_id =" + id;
        ResultSet rst = stmt.executeQuery(qry);
        if (rst.next())
        {
            Content = rst.getString("c_name");
        }
        out.println(Content);
        byte requestBytes[] = Content.getBytes();
        ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
        response.reset();
        response.setContentType("application/pdf");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("Content-disposition", "attachment; filename=" + filename);

        byte[] buf = new byte[1024];
        int len;
        while ((len = bis.read(buf)) > 0)
        {
            response.getOutputStream().write(buf, 0, len);
        }
        bis.close();
        response.getOutputStream().flush();
    }
    catch (Exception e)
    {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
%>