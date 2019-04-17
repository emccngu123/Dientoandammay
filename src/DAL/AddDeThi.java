package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Question;
import BEAN.User;
import project.connectdb.ConnectDatabase;

public class AddDeThi {
	public boolean AddTest(int tongsocau, int time, int idClass, String username) {
		int max=0;
		PreparedStatement preparedStatement = null; 
		String sql = "SELECT MAX(idTests) as max FROM tests";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				max = rs.getInt("max")+1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			String query = "insert into tests(idTests,timeLimit,numberQuestion,idClass,user) values (?,?,?,?,?)"; //Insert user details into the table 'USERS' 
			preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data 
			preparedStatement.setLong(1, max); 
			preparedStatement.setLong(2, time); 
			preparedStatement.setLong(3, tongsocau); 
			preparedStatement.setLong(4, idClass);
			preparedStatement.setString(5, username); 
			preparedStatement.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}
