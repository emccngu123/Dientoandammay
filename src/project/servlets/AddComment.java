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
 * Servlet implementation class AddComment
 */
@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
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
		String message = request.getParameter("comment");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		int max2=0;
		int idPost = Integer.parseInt(request.getParameter("idPost"));
		try {
			String sql3= "select max(id) as max from user_forum";
			Connection con = ConnectDatabase.CreateConnection();
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ResultSet rs3 = ps3.executeQuery();
			while (rs3.next()) {
			max2 = rs3.getInt("max")+1;
			}
		
	        String sql2 = "INSERT INTO user_forum (id,idForum,username,message) VALUES ('"+max2+"','" +idPost+"','" +username+"','"+message+"')";
	        PreparedStatement ps2 = con.prepareStatement(sql2);
	        ps2.executeUpdate();	
			} catch (SQLException e) {
			}
		RequestDispatcher rd =  request.getRequestDispatcher("ChiTietPost?id="+idPost);
		rd.forward(request, response);
	}

		
}
