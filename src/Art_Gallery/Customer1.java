/*package Art_Gallery;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;


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
  String Fname = request.getParameter("fullname");  
  String lid = request.getParameter("loginid");  
  String pwd = request.getParameter("password");  
  

  Class.forName(driver).newInstance();  
  conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
  PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into customer values(?,?,?)");//try2 is the name of the table  

  pst.setString(1,Fname);  
  pst.setString(2,lid);        
  pst.setString(3,pwd);
  

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
*/