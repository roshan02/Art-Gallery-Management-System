package Art_Gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Edit
 */
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
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
		Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/";
		String dbName = "art_gallery";
	        String driver = "com.mysql.jdbc.Driver";
	        String userName = "root";
	        String password = "rutuja8079";
	        String id = request.getParameter("field1");
	        String email = request.getParameter("field22");
	        String name = request.getParameter("field33");
	        String state = request.getParameter("field44");
	        String city= request.getParameter("field55");
	        String pincode= request.getParameter("field66");
	        String phone = request.getParameter("field77");
	        String g_id = request.getParameter("field88");
	        HttpSession session = request.getSession();
	        String email1 = (String) session.getAttribute("login");
	        try {
	            Class.forName(driver).newInstance();
	            conn = DriverManager
	                    .getConnection(url + dbName, userName, password);

	            pst = conn.prepareStatement("update artist set  email=?, a_name=?, state=?, city=?,pincode=?, phone=? where a_id=?");
	            //pst.setString(1, id);
	            pst.setString(1, email);
	            pst.setString(2, name);
	            pst.setString(3, state);
	            pst.setString(4, city);
	            pst.setString(5, pincode);
	            pst.setString(6, phone);
	            pst.setString(7, email1);
	            System.out.println("ttttttt");
	            
	            pst.executeUpdate();
	            out.println("succeessful...");
	            System.out.println("ppp");
	            
	}
	        catch (Exception e) {
	     	   System.out.println(e.getMessage());
	        }

}
}
