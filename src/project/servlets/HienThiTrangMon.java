package project.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Exam;
import BEAN.Question;
import DAL.TestDAL;

/**
 * Servlet implementation class HienThiTrangMon
 */
@WebServlet("/HienThiTrangMon")
public class HienThiTrangMon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HienThiTrangMon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idClass = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		String username =(String)session.getAttribute("username");
		String className = request.getParameter("name");
			// Load danh sách đề ra
			TestDAL exam =new TestDAL();
			List<Exam> lE= exam.getAllDethi(idClass);
			//System.out.println(lE.get(1).getID());
			request.setAttribute("listExam",lE);
			request.setAttribute("className",className);
			request.getRequestDispatcher("/WEB-INF/ClassView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
