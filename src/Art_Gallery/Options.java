package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Options extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Options() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "art_gallery";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "rutuja8079";
		String query= "select * from gallery";
		HttpSession session = request.getSession();
		String name1=(String)session.getAttribute("l_id");
		String submit = request.getParameter("join");
		String q1 = "update artist set g_id=? where a_id=?";
		
		try {
		    Class.forName(driver).newInstance();
		    Connection conn = DriverManager.getConnection(url + dbName, userName, password);
		    Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(query);
		   // System.out.println("gggggg4444444444");
			rs.next();
			System.out.println("  "+rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
		    
			while(rs.next()){
		    	System.out.println("*********");
		    	System.out.println(name1);
		    	String id = rs.getString(1);
		    	System.out.println(id);
		  
		        PreparedStatement pst1 =(PreparedStatement) conn.prepareStatement(q1);
		        pst1.setString(1, id);
		        pst1.setString(2, "a");
		        //System.out.println("rrrrrr");
		        pst1.executeUpdate();
		        //System.out.println("0000000");
		        if(request.getParameter("join") != null){
		        	out.println("Welcome........");
		        }
		       
		        		
		   } 
		    conn.commit();
		   rs.close();
		  // rs1.close();
		   st.close();
		   conn.close();
		   }
		   catch (Exception e) {
			   e.getMessage();
		   }
		   
	}

}
