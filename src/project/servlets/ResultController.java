package project.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Answeruser;
import BEAN.Question;
import project.connectdb.ConnectDatabase;


@WebServlet("/ResultController")
public class ResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ResultController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = ConnectDatabase.CreateConnection();
		int countrow = Integer.parseInt(request.getParameter("firstbox"));
		int time = Integer.parseInt(request.getParameter("secondbox"));
		HttpSession session = request.getSession();
		int socaudung=0;
		int diem=0;
		List<Question> listcorrectanswer = new ArrayList<>();
		listcorrectanswer=(List<Question>) session.getAttribute("list_Question");
		String user=(String) session.getAttribute("username");
		String pass=(String) session.getAttribute("password");
		List<Answeruser> listansweruser = new ArrayList<>();
		
		for (int i=1; i<=countrow; i++)
		{
			String answer = request.getParameter("ans["+i+"]");
			
			if (answer != null)
			{
				Answeruser au = new Answeruser();
				
				au.setNumber(i);
				au.setAnswer(answer);
				
				listansweruser.add(au); 

			}
			else
			{
				
				request.setAttribute("msg", "Bạn chưa trả lởi hết tất cả các câu hỏi!");
				request.setAttribute("listCauhoi",listcorrectanswer);
				request.setAttribute("numberQuestion",countrow);
				request.setAttribute("time",time);
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/TestSheet.jsp");
				rd.forward(request,response);
				return;
			}

		}
		for (Question question : listcorrectanswer) 
		{
			for (Answeruser quest : listansweruser) 
			{
			    if(question.getAnswer().equals(quest.getAnswer()) && question.getNumber()==quest.getNumber())
			    {
			    	socaudung++;
			    }
			}
		}
		diem=(int)(((socaudung*10)/countrow));
		request.setAttribute("listcorrectanswer", listcorrectanswer);
		request.setAttribute("listansweruser", listansweruser);
		request.setAttribute("socaudung", socaudung);
		request.setAttribute("numberQuestion",countrow);
		request.setAttribute("diem",diem);
		request.setAttribute("username",user);
		request.setAttribute("password",pass);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/result.jsp");
		rd.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
