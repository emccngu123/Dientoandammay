package project.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.connectdb.ConnectDatabase;

/**
 * Servlet implementation class LoginFormServlet
 */
@WebServlet("/LoginFormServlet")
public class LoginFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user = request.getParameter("uname");
		String pass = request.getParameter("psw");
		
		if(ConnectDatabase.ConDB(user, pass).equals("user")) {
			HttpSession session = request.getSession(false);
			// gÃƒÂ¡n giÃƒÂ¡ trÃ¡Â»â€¹ cÃ¡Â»Â§a userName khi Ã„â€˜Ã„Æ’ng nhÃ¡ÂºÂ­p vÃƒÂ o username
			session.setAttribute("username", user);
			session.setAttribute("password", pass);
			RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/thisinh.jsp");
			rd.forward(request, response);
		} else {
			if(ConnectDatabase.ConDB(user, pass).equals("admin")) {
				HttpSession session = request.getSession(false);
				// gÃƒÂ¡n giÃƒÂ¡ trÃ¡Â»â€¹ cÃ¡Â»Â§a userName khi Ã„â€˜Ã„Æ’ng nhÃ¡ÂºÂ­p vÃƒÂ o username
				session.setAttribute("username", user);
				session.setAttribute("password", pass);
				RequestDispatcher rd =  request.getRequestDispatcher("WEB-INF/Admin.jsp");
				rd.forward(request, response);
			}
				else
				{
					request.setAttribute("status", "Sai tên tài khoản hoặc mật khẩu");
					RequestDispatcher rd =  request.getRequestDispatcher("TrangChu");
					rd.forward(request, response);
				}
			}
	}

}
