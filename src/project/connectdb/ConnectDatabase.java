package project.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDatabase {

	public static String ConDB(String username, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
		Connection cnn = null;
		PreparedStatement stm=null;
		ResultSet rs=null;
		String tmp="concac";
		
		try {		
			cnn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/thitracnghiemonline", "root", "1234");
			
			String sql = "SELECT * FROM users WHERE userName='" 
					+ username + "' AND passWord='" + pass + "'";
			stm = cnn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()) {
				tmp = rs.getString("role");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tmp;
	}
	public static Connection CreateConnection(){
		Connection conn= null;
		String url="jdbc:mysql://localhost:3307/thitracnghiemonline";
		String username="root";
		String password="1234";
		

		try {
			// load Driver
			Class.forName("com.mysql.jdbc.Driver");
			
			// create connection
			conn = DriverManager.getConnection(url,username,password);
			
			
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(SQLException ex){
			ex.printStackTrace();
			System.out.println("Error connection " + ex);
		}

		return conn;
	}
}
