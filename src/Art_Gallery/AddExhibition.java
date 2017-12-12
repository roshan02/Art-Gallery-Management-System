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


public class AddExhibition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddExhibition() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
      String e_id = request.getParameter("ID");  
      String e_name = request.getParameter("Name");  
      String type = request.getParameter("Type");  
      String start_date = request.getParameter("S_date");  
      String end_date = request.getParameter("E_date"); 
      String g_name = request.getParameter("gallery_name");
      String query = "select * from gallery where g_name='" + g_name + "' ";
     
      Class.forName(driver).newInstance();  

      conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
      Statement st = conn.createStatement();
      ResultSet rs = st.executeQuery(query);
      rs.beforeFirst();
      rs.next();
      String g_id = rs.getString("g_id");
      PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into exhibition (e_id,e_name, e_type, start_date, end_date) values(?,?,?,?,?)");//try2 is the name of the table  
      PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into organise(g_id, e_id) values(?, ?)");
      
      pst.setString(1,e_id);  
      pst.setString(2,e_name);        
      pst.setString(3,type);
      pst.setString(4,start_date);
      pst.setString(5,end_date);
      pst1.setString(1,g_id);
      pst1.setString(2,e_id);
      

      int i = pst.executeUpdate();
      pst1.executeUpdate();
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