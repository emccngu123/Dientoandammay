package project.servlets;

import java.io.IOException;
import java.util.*;

 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.User;
import DAL.LoginDAL;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


/**
 * Servlet implementation class GetThiSinh
 */
@WebServlet("/GetAllThisinh")
public class GetAllThisinh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllThisinh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
		  List<User> listPro = new ArrayList<User>();
		  LoginDAL loginDal= new LoginDAL();
          listPro = loginDal.getAllThisinh();

          Gson gson = new Gson();
          JsonElement element = gson.toJsonTree(listPro, new TypeToken<List<User>>(){}.getType());
          JsonArray jsonArray = element.getAsJsonArray();
          response.setContentType("application/json");
          response.getWriter().println(jsonArray);
  }


  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          // TODO Auto-generated method stub
          doGet(request, response);
  }

}
