import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class connectionTest {

	public static void main(String[] args) {
		
		System.out.println("----MySQL JDBC Connection Testing -------");
	    
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        System.out.println("Where is your MySQL JDBC Driver?");
	        e.printStackTrace();
	        return;
	    }

	    System.out.println("MySQL JDBC Driver Registered!");
	    Connection connection = null;

	    try {
	        connection = DriverManager.
	                getConnection("jdbc:mysql://ec2-52-78-194-164.ap-northeast-2.compute.amazonaws.com:3306/project2?useUnicode=true&characterEncoding=utf8", "pro1", "kitri21");
	        PreparedStatement pstmt;
			
				pstmt = connection.prepareStatement("select sport_name from sports s join location l on s.location_id = l.location_id where sport_name ='배드민턴' order by gu");
			
	        //pstmt.setString(1,"당구");
	        ResultSet rs = pstmt.executeQuery();
	        if(rs.next()){
	        	System.out.println(rs.getString("sport_name"));
	        }
	    
	    } catch (SQLException e) {
	        System.out.println("Connection Failed!:\n" + e.getMessage());
	    }

	    if (connection != null) {
	        System.out.println("SUCCESS!!!! You made it, take control     your database now!");
	    } else {
	        System.out.println("FAILURE! Failed to make connection!");
	    }

	}

}
