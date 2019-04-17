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
import javax.servlet.http.HttpSession;

import project.connectdb.ConnectDatabase;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/CreatePost")
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePost() {
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
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		String username=(String) session.getAttribute("username");
		int max=0;
		int max2=0;
		String message = "";
		//Add Post First
		try {
			String sql= "select max(idPost) as max from forum";
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			max = rs.getInt("max")+1;
			}
			
			String sql3= "select max(id) as max from user_forum";
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ResultSet rs3 = ps3.executeQuery();
			while (rs3.next()) {
			max2 = rs3.getInt("max")+1;
			}
		
			String sql1 = "INSERT INTO forum (idPost,title,userName) VALUES ('"+max+"','" +title+"','"+username+"')";
	        PreparedStatement ps1 = con.prepareStatement(sql1);
	        ps1.executeUpdate();
	        
	        String sql2 = "INSERT INTO user_forum (id,idForum,username,message) VALUES ('"+max2+"','" +max+"','" +username+"','"+content+"')";
	        PreparedStatement ps2 = con.prepareStatement(sql2);
	        ps2.executeUpdate();
	        message = "Trạng thái: Tạo bài viết thành công";	
			} catch (SQLException e) {
				message="Trạng thái:"+e.getMessage();
			}
		request.setAttribute("message", message);
		RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/thisinh.jsp");
		rd.forward(request, response);
	}

}
