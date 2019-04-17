package DAL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import BEAN.User;
import project.connectdb.*;

public class LoginDAL {
	
	public User getUser(String username) {
		Connection con = ConnectDatabase.CreateConnection();
		String sql = "select * from users where userName='" + username + "'";
		User us = new User();
		try {
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String fullname = rs.getString("fullName");
				us = new User(fullname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return us;
	}
	public List<User> getAllThisinh() {
		List<User> lUsers = new ArrayList<>();

		String sql = "select * from users where role='user'";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User us = new User();
				us.setFullname(rs.getString("fullName"));
				us.setUsername(rs.getString("userName"));
				us.setPassword(rs.getString("passWord"));
				lUsers.add(us);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lUsers;
	}
}
