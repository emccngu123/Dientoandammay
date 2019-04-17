package project.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.connectdb.ConnectDatabase;

/**
 * Servlet implementation class ThemCauHoi
 */
@WebServlet("/ThemCauHoi")
public class ThemCauHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemCauHoi() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    int max=0;
		int idClass= Integer.parseInt(request.getParameter("classs"));
		String questName = (String) request.getParameter("name");
		String a ="A." + (String) request.getParameter("a");
		String b ="B."+ (String) request.getParameter("b");
		String c ="C." +(String) request.getParameter("c");
		String d ="D." +(String) request.getParameter("d");
		String result = (String) request.getParameter("result");
		String type = (String) request.getParameter("type");
		String message="";
			try {
				String sql= "select max(idQuestions) as max from questions";
				Connection con = ConnectDatabase.CreateConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				max = rs.getInt("max")+1;
				}
			
				String sql1 = "INSERT INTO questions ( idQuestions, questName, a,b,c,d,result,type, idClass) VALUES ('"+max+"','" +questName+"','"+a+"','"+b+"','"+c+"','"+d+"','"+result+"','"+type+"','"+idClass+"')";
		        PreparedStatement ps1 = con.prepareStatement(sql1);
		        ps1.executeUpdate();
		        message = "Trạng thái: Thêm câu hỏi thành công";	
		} catch (SQLException e) {
			message="Trạng thái:"+e.getMessage();
		}
			request.setAttribute("message", message);
			RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/ManagePage.jsp");
			rd.forward(request, response);
	}

}
