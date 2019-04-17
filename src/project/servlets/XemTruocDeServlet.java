package project.servlets;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Question;
import BEAN.User;
import DAL.GetQuestion;
import DAL.LoginDAL;

/**
 * Servlet implementation class XemTruocDeServlet
 */
@WebServlet("/XemTruocDeServlet")
public class XemTruocDeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XemTruocDeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Copying all the input parameters in to local variables 
				int socaude = Integer.parseInt(request.getParameter("easy")); 
				int socautb = Integer.parseInt(request.getParameter("medium")); 
				int socauhard = Integer.parseInt(request.getParameter("hard")); 
				int time = Integer.parseInt(request.getParameter("time")); 
				int sum = socaude+socautb+socauhard;
				String className = request.getParameter("chon");				
				int o=0;
				if(className.equals("Math"))
				{
					o=2;
				}
				if(className.equals("Geography"))
				{
				 	o=6;
				}
				if(className.equals("Physics"))
				{
					o=5;
				}
				List<Question> listEasy = new ArrayList<>();
				GetQuestion log= new GetQuestion();
				listEasy = log.GetQuest( "easy",o);
				Collections.shuffle(listEasy);
				List<Question> listCauhoi= new ArrayList<>();
				for(int i=0;i<socaude;i++)
				{
					Question a=listEasy.get(i);
					listCauhoi.add(a);
				}
				List<Question> listMedium = new ArrayList<>();
				listMedium = log.GetQuest("Medium",o);
				Collections.shuffle(listMedium);
				for(int i=0;i<socautb;i++)
				{
					listCauhoi.add(listMedium.get(i));
				}
				List<Question> listHard = new ArrayList<>();
				listHard = log.GetQuest("Hard",o);
				Collections.shuffle(listHard);
				for(int i=0;i<socauhard;i++)
				{
					listCauhoi.add(listHard.get(i));
				}
				HttpSession session = request.getSession();
				session.setAttribute("all_Question", listCauhoi);
				session.setAttribute("tong_Cauhoi", sum);
				session.setAttribute("time_Limit", time);
				session.setAttribute("Mamon", o);
				request.setAttribute("className", className);
				request.setAttribute("listCauhoi", listCauhoi);
				request.getRequestDispatcher("/WEB-INF/De.jsp").forward(request, response);
			//	RegisterBean registerBean = new RegisterBean(); 
				//Using Java Beans - An easiest way to play with group of related data 
			//	registerBean.setFullName(fullName); 
			//	registerBean.setEmail(email); 
			//	registerBean.setUserName(userName); 
			//	registerBean.setPassword(password);  
			//	RegisterDao registerDao = new RegisterDao(); 
				//The core Logic of the Registration application is present here. We are going to insert user data in to the database. 
			//	String userRegistered = registerDao.registerUser(registerBean); 
		/*		if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page 
				{ 
				request.getRequestDispatcher("/Home.jsp").forward(request, response); 
				} 
				else   //On Failure, display a meaningful message to the User. 
				{ 
				request.setAttribute("errMessage", userRegistered); 
				request.getRequestDispatcher("/Register.jsp").forward(request, response); 
				} */
			} 
}

