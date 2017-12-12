package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Customer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Customer() {
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
	    String dbName="Login";
	    String driver="com.mysql.jdbc.Driver";
	//String dbUserName="root";
	//String dbPassword="root";

	try{  
	  String field1 = request.getParameter("field1");  
	  String field2 = request.getParameter("field2");  
	  String field3 = request.getParameter("field3");  
	  String field4 = request.getParameter("field4");  
	  String field5 = request.getParameter("field5");  
	  String field6 = request.getParameter("field6");
	  String field7 = request.getParameter("field7");  
	  

	  Class.forName(driver).newInstance();  
	  conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
	  PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into artist( email, a_name, state, city, pincode, phone) values(?,?,?,?,?,?)");//try2 is the name of the table  

	 
	  pst.setString(1,field2);      
	  pst.setString(2,field3); 
	  pst.setString(3,field4); 
	  pst.setString(4,field5); 
	  pst.setString(5,field6); 
	  pst.setString(6,field7); 

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


	}


	}


