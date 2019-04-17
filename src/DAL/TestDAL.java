package DAL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import BEAN.Exam;
import BEAN.User;
import project.connectdb.*;

public class TestDAL {
	public List<Exam> getAllDethi(int id) {
		List<Exam> lExams = new ArrayList<>();

		String sql = "select * from tests where idClass='"+id+"'";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Exam e = new Exam();
				e.setID(rs.getInt("idTests"));
				e.setTime(rs.getInt("timeLimit"));
				e.setSocauhoi(rs.getInt("numberQuestion"));
				e.setIDClass(rs.getInt("idClass"));
				e.setUsername(rs.getString("user"));
				lExams.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lExams;
	}
	
}
