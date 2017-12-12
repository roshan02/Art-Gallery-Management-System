package Art_Gallery;

import java.sql.*;

import javax.servlet.RequestDispatcher;

public class Gallery1 {
	public static void validate(){
		int i = 0;
	Connection conn=null, conn1=null; 
	String url = "jdbc:mysql://localhost:3306/";
        String dbName = "Login";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "rutuja8079";
        try {
            try {
				Class.forName(driver).newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            conn = DriverManager.getConnection(url + dbName, userName, password);
           // conn1 = DriverManager.getConnection(url + dbName, userName, password);

        

        String sql = "INSERT INTO gallery values(?)";

       // Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        Statement st = conn.createStatement();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = st.executeQuery("SELECT * FROM users");
        while (rs.next()) {
            String nm = rs.getString(1);
           
            pstmt.setString(1, nm);
            pstmt.executeUpdate();
            
        }
    } catch (SQLException e) {
        System.out.println("could not get JDBC connection: " +e);
    } finally {
        try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
			conn1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
		
		//return i;
}
}


