package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddGallery() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter pw = response.getWriter();  
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="art_gallery";
        String driver="com.mysql.jdbc.Driver";
    try{  
      String g_id = request.getParameter("ID");  
      String g_name = request.getParameter("Name");  
      String landmark = request.getParameter("Loc");  
      String city = request.getParameter("City");  
      String Url = request.getParameter("Url"); 
     
      Class.forName(driver).newInstance();  

      conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
      Statement st = conn.createStatement();
  
      PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into gallery (g_id, g_name, landmark, city, url) values(?,?,?,?,?)");//try2 is the name of the table  
      pst.setString(1,g_id);  
      pst.setString(2,g_name);        
      pst.setString(3,landmark);
      pst.setString(4,city);
      pst.setString(5, Url);
     
      int i = pst.executeUpdate();
      //conn.commit(); 
      String msg=" ";
      if(i!=0){  
        msg="Record has been inserted";
        pw.println("<font size='6' color=blue>" + msg + "</font>"); 
        RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");  
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
