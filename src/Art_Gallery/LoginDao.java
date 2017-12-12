package Art_Gallery;

import java.sql.*;

public class LoginDao {
	public static boolean validate(String name, String user,String pass) {        
        boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "art_gallery";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "rutuja8079";
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager
                    .getConnection(url + dbName, userName, password);

            pst = conn.prepareStatement("select * from login where email=? and usertype = ? and password=? ");
            pst.setString(1, name);
            pst.setString(2, user);
            pst.setString(3, pass);
           
         
            rs = pst.executeQuery();
            status = rs.next();
           

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return status;
    }
}
