package project.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Forum;
import project.connectdb.ConnectDatabase;

/**
 * Servlet implementation class MyPostServlet
 */
@WebServlet("/MyPostServlet")
public class MyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Lấy danh sách các title của người dùng đã đăng
				request.setCharacterEncoding("UTF-8");
			    response.setCharacterEncoding("UTF-8");
			    response.setContentType("text/html; charset=UTF-8");
				List<Forum> lF = new ArrayList<>();
				HttpSession session = request.getSession();
				String username=(String) session.getAttribute("username");
				String sql = "select * from forum where userName='"+username+"'";
				try {
					
					Connection con = ConnectDatabase.CreateConnection();
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						Forum f = new Forum();
						f.setidForum(rs.getInt("idPost"));
						f.setTitle(rs.getString("title"));
						lF.add(f);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("lTitle", lF);
				RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/DienDan.jsp");
				rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
