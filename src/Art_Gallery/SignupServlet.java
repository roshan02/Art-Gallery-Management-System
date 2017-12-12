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


public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String fname=request.getParameter("fullname");  
        String lid=request.getParameter("loginid"); 
        String passward = request.getParameter("password");
        
        HttpSession session = request.getSession(false);
        if(session!=null)
        session.setAttribute("fullname", fname);

        if(SignupDao.validate(fname,lid, passward)){  
        	out.print("");
            RequestDispatcher rd=request.getRequestDispatcher("thankyou.jsp");  
            rd.forward(request,response);  
        }  
        else{  
            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);  
        }  

        out.close();  
	}*/
		response.setContentType("text/html");  
        PrintWriter pw = response.getWriter(); 
        //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
        //Connection connection;  
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="art_gallery";
        String driver="com.mysql.jdbc.Driver";
    
    try{  
      String aname = request.getParameter("fullname");  
      String ano = request.getParameter("ArtistId");  
      String state = request.getParameter("state");  
      String city = request.getParameter("city");  
      String pincode = request.getParameter("pincode"); 
      String pno = request.getParameter("mobileno");  
      String email= request.getParameter("email");  
      String pwd = request.getParameter("password");  
      

      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
      PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into artist (a_id, email, a_name, state, city, pincode, phone,g_id ) values(?,?,?,?,?,?,?,?)");//try2 is the name of the table  
     PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement("insert into login values(?,1,?)");//try2 is the name of the table  

      pst.setString(1,ano);  
      pst.setString(2,email);
      pst.setString(3,aname);        
      pst.setString(4,state);
      pst.setString(5,city);
      pst.setString(6,pincode);
      pst.setString(7,pno);
      pst.setString(8, "G1");
      pst1.setString(1,email);
      pst1.setString(2,pwd);
      
      

      int i = pst.executeUpdate();
      pst1.executeUpdate();
      //conn.commit(); 
      String msg=" ";
      if(i!=0){  
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
