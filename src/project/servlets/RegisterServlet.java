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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username = request.getParameter("runame");
		String password = request.getParameter("rpsw");
		String fullname = request.getParameter("name");
		String status="";
		try {
		
			String sql1 = "INSERT INTO users ( userName,passWord, fullName, role) VALUES ('"+username+"','" +password+"','"+fullname+"','"+"user"+"')";
			Connection con = ConnectDatabase.CreateConnection();
	        PreparedStatement ps1 = con.prepareStatement(sql1);
	        ps1.executeUpdate();
	        status = "Đăng kí thành công !";	
	} catch (SQLException e) {
		status="Trùng tên tài khoản !";
	}
		request.setAttribute("status", status);
		RequestDispatcher rd =  request.getRequestDispatcher("TrangChu");
		rd.forward(request, response);
	}

}
