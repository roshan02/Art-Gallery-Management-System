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


public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddCustomer() {
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
      String c_id = request.getParameter("ID");  
      String c_name = request.getParameter("Name");  
      String address = request.getParameter("Address");  
      String pno = request.getParameter("Pno");  
      String title = request.getParameter("title"); 
      String cost = request.getParameter("Cost");  
      
      System.out.println(title);
      //String[] tokens = P_name.split(":\\ ");
      String query = "select * from painting where title='" + title + "' ";
    
      Class.forName(driver).newInstance();  

     conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
      Statement st = conn.createStatement();
      ResultSet rs = st.executeQuery(query);
      rs.next();
      String imageurl = rs.getString("url");
      
      PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into customer (c_id, c_name, address, phone) values(?,?,?,?)");//try2 is the name of the table  
    PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into bought_by(c_id, url, cost ) values(?, ?, ?)");
    PreparedStatement pst2 =(PreparedStatement) conn.prepareStatement("delete from painting where url = ? ");
    System.out.println("helloo hii");
      pst.setString(1,c_id);  
      pst.setString(2,c_name);        
      pst.setString(3,address);
      pst.setString(4,pno);
      pst1.setString(1,c_id);
      pst1.setString(2,imageurl);
      pst1.setString(3, cost);
      pst2.setString(1, imageurl);
      System.out.println("helloo hii1");
      int i = pst.executeUpdate();
      pst1.executeUpdate();
      System.out.println("helloo hii2");
      pst2.executeUpdate();
      System.out.println("helloo hii3");
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
      System.out.println(e.getMessage());  
    }  


}
}