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

import BEAN.Forum;
import BEAN.UserForum;
import project.connectdb.ConnectDatabase;

/**
 * Servlet implementation class ChiTietPost
 */
@WebServlet("/ChiTietPost")
public class ChiTietPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// lấy id bài viết
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		int idPost = Integer.parseInt(request.getParameter("id"));
		List<UserForum> lUF = new ArrayList<>();
		String title="";
		// lấy chi tiết trong bảng user_forum, trong đó có các cmt
		String sql = "select * from user_forum where idForum= '"+idPost+"'";
		String sql1 = "select * from Forum where idPost= '"+idPost+"'";
		try {
			
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserForum uf = new UserForum();
				uf.setidForum(rs.getInt("idForum"));
				uf.setUser(rs.getString("username"));
				uf.setMessage(rs.getString("message"));
				lUF.add(uf);
			}
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				 title = rs1.getString("title");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("lUserRep", lUF);
		request.setAttribute("Title", title);
		request.setAttribute("idPost", idPost);
		RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/Post.jsp");
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
