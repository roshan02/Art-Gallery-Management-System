package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadPainting extends HttpServlet {
	private static final long serialVersionUID = 1L;
        public UploadPainting() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter pw = response.getWriter(); 
        //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
        //Connection connection;  
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="art_gallery";
        String driver="com.mysql.jdbc.Driver";
    //String dbUserName="root";
    //String dbPassword="root";

    try{  
      String title = request.getParameter("title");  
      String year = request.getParameter("year");  
      String iurl = request.getParameter("url");  
      String type= request.getParameter("ptype");  
      //String id= (String)session.getAttribute("login");
      

      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
      PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into painting (title, year, url, type) values(?,?,?,?)");//try2 is the name of the table  
      PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into painting (a_id) values(?)");//try2 is the name of the table  

      
      pst.setString(1,title);  
      pst.setString(2,year);        
      pst.setString(3,iurl);
      pst.setString(4,type);
      //pst1.setString(1, id);
         
      int i = pst.executeUpdate();
      int j = pst1.executeUpdate();
      //conn.commit(); 
      String msg=" ";
      if(i!=0 && j!=0){  
        msg="Record has been inserted";
        pw.println("<font size='6' color=blue>" + msg + "</font>"); 
        RequestDispatcher rd=request.getRequestDispatcher("Artist.jsp");  
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


}

	}


