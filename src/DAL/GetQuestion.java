package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import BEAN.Question;
import BEAN.User;
import project.connectdb.ConnectDatabase;

public class GetQuestion {
	public List<Question> GetQuest( String type, int mamon) {
		List<Question> lQuests = new ArrayList<>();

		String sql = "select * from questions where type='"+type+"' and idClass= "+ mamon;
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Question q= new Question();
				q.setID(rs.getInt("idQuestions"));
				q.setQuestname(rs.getString("questName"));
				q.setA(rs.getString("a"));
				q.setB(rs.getString("b"));
				q.setC(rs.getString("c"));
				q.setD(rs.getString("d"));
				lQuests.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lQuests;
	}
	public List<Question> GetQuestInExam(int idTest) { // láº¥y sá»‘ cÃ¢u há»�i cá»§a mÃ£ Ä‘á»� Ä‘á»ƒ hiá»‡n cÃ¢u há»�i lÃªn cho tháº±ng lÃ m Ä‘á»� thi
		List<Question> lQuests = new ArrayList<>();
		//List<Integer> lIDQuest = new ArrayList<>();
		String sql = "select * from testquestions where idTest='"+idTest+"'";
		try {
			int i=1;
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Question q = new Question();
				q= this.GetQuestion(rs.getInt("idQuest"),i);
				lQuests.add(q);
				i++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lQuests;
	}
	public static Question GetQuestion(int idQuestion,int i) {
		Question q= new Question();
		String sql = "select * from questions where idQuestions= '"+idQuestion+"'";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {	
				q.setNumber(i);
				q.setID(rs.getInt("idQuestions"));
				q.setQuestname(rs.getString("questName"));
				q.setA(rs.getString("a"));
				q.setB(rs.getString("b"));
				q.setC(rs.getString("c"));
				q.setD(rs.getString("d"));
				q.setAnswer(rs.getString("result"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return q;
	}
	public static List<Question> GetAllQuestion(int classs) {
		
		List<Question> lQuests = new ArrayList<>();
		String sql = "select * from questions where idClass='"+classs+"'";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {	
				Question q= new Question();
				q.setID(rs.getInt("idQuestions"));
				q.setQuestname(rs.getString("questName"));
				q.setA(rs.getString("a"));
				q.setB(rs.getString("b"));
				q.setC(rs.getString("c"));
				q.setD(rs.getString("d"));
				q.setAnswer(rs.getString("result"));
				q.setType(rs.getString("type"));
				lQuests.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lQuests;
	}
	
	
}
