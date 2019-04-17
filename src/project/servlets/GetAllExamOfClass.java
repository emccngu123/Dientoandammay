package project.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import BEAN.Exam;
import BEAN.Question;
import BEAN.User;
import DAL.LoginDAL;
import DAL.TestDAL;

/**
 * Servlet implementation class GetAllExamOfClass
 */
@WebServlet("/GetAllExamOfClass")
public class GetAllExamOfClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllExamOfClass() {
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
		String classs = request.getParameter("number");
        int classID=0;
        
          if(classs.equals("Math"))
           {
          	 classID=2;
           }
           if(classs.equals("Physics"))
           {
          	 classID=5;
           }
           if(classs.equals("Geography"))
           {
          	 classID=6;
           }
          
  		  List<Exam> listPro = new ArrayList<>();
  		  TestDAL loginDal= new TestDAL();
          listPro = loginDal.getAllDethi(classID);
          Gson gson = new Gson();
          JsonElement element = gson.toJsonTree(listPro, new TypeToken<List<Exam>>(){}.getType());
          JsonArray jsonArray = element.getAsJsonArray();
          response.setContentType("application/json");
          response.getWriter().println(jsonArray);
	}

}
