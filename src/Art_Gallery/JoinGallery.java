package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.jasper.compiler.Node.ForwardAction;

/**
 * Servlet implementation class JoinGallery
 */
public class JoinGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinGallery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "Login";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "rutuja8079";
		String query= "select * from artist";
		//String query1= "";
		try {
		    Class.forName(driver).newInstance();
		    Connection conn = DriverManager.getConnection(url + dbName, userName, password);
		    if(request.getParameter("JOIN") != null){
		    Statement st = conn.createStatement();
		   
		   System.out.println("jjjjjjjjjjjjj");
		    ResultSet rs = st.executeQuery(query);
		    System.out.println(rs.getString(2));
		    String id= rs.getString("g_id");
		    PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into artist (g_id) values('123')");//try2 is the name of the table  
		    
			pst.setString(1, id);
			int i = pst.executeUpdate();
			if(i != 0){
				out.print("hiiiiiiiiiiiiiiiiiiiiiiii");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
				rd.forward(request,response);  
			}
		   // ResultSet rs1 = st.executeQuery(query1);
		   // while(rs.next()){}
		    	
		    	/*<div class="item">
		        		<div class="animate-box">
			        		<a href="images/nature1.jpg" class="image-popup fh5co-board-img"><img src=<%= rs.getString("link") %> alt="Free HTML5 Bootstrap template"></a>
			        		<div class="image-popup fh5co-desc">Veniam voluptatum voluptas tempora debitis harum totam vitae hic quos.
			        		<!-- <a href = "#">Join</a> -->
			        		
			        		</div>
		        		</div>
		        		<form action="index.jsp" method="post"  onsubmit="">
			        		<input type="submit" value="JOIN">
			        		
			        		</form>
		        		</div>
		   } */
		   rs.close();
		   st.close();
		   conn.close();
		   }
		}
		   catch (Exception e) {
		   }

	}

}
