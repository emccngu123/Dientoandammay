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

import BEAN.Question;
import BEAN.User;
import DAL.GetQuestion;
import DAL.LoginDAL;

/**
 * Servlet implementation class GetAllQuestion
 */
@WebServlet("/GetAllQuestion")
public class GetAllQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllQuestion() {
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
		int classs = Integer.parseInt(request.getParameter("number"));
		 List<Question> listPro = new ArrayList<Question>();
		  GetQuestion getQuest= new GetQuestion();
        listPro = (List<Question>) getQuest.GetAllQuestion(classs);

        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(listPro, new TypeToken<List<Question>>(){}.getType());
        JsonArray jsonArray = element.getAsJsonArray();
        response.setContentType("application/json");
        response.getWriter().println(jsonArray);
	}

}
