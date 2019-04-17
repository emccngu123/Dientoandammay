package project.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Question;
import DAL.GetQuestion;

/**
 * Servlet implementation class TrangKtra
 */
@WebServlet("/TrangKtra")
public class TrangKtra extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangKtra() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int examID = Integer.parseInt(request.getParameter("id"));// lay id bai test
		HttpSession session = request.getSession();
		String username=(String) session.getAttribute("username");
		int time = Integer.parseInt(request.getParameter("time")); // láº¥y thá»�i gian bÃ i test
		int sum = Integer.parseInt(request.getParameter("numberQuestion")); // láº¥y thá»�i gian bÃ i test
		//lay ra danh sach cÃ¢u há»�i trong bÃ i test bai test 
		GetQuestion gqt= new GetQuestion();
		List<Question> lQ = new ArrayList<>();
		lQ= gqt.GetQuestInExam(examID);
		session = request.getSession(false);
		session.setAttribute("list_Question", lQ);
		session.setAttribute("id_Test", examID);
		request.setAttribute("listCauhoi",lQ);
		request.setAttribute("time",time);
		request.setAttribute("numberQuestion",sum);
		request.getRequestDispatcher("WEB-INF/TestSheet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
