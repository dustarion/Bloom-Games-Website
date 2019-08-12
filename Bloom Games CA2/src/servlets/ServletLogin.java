package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserLogin;
import db.UserLoginDAO;
import db.UserLoginDAOImpl;

import db.Cart;
import db.CartDAO;
import db.CartDAOImpl;

/**
 * Servlet implementation class ServletLogin
 */

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// Get params
		UserLoginDAO UserLogin_DAO = new UserLoginDAOImpl();
		String name = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean successfulLogin = UserLogin_DAO.Login(name, password);
		HttpSession session = request.getSession();
		
		if (successfulLogin) {
			// If Login Valid, get User's Data
			UserLogin UserInfo = UserLogin_DAO.GetUserDetails(name);
			session.setAttribute("userid", UserInfo.GetUserID());
			session.setAttribute("name", UserInfo.GetName());
			session.setAttribute("email", UserInfo.GetEmail());
			session.setAttribute("admin", UserInfo.GetAdmin());
			
			response.sendRedirect("index.jsp");
			System.out.println("success");
		} else {
			// invalid login
			response.sendRedirect("login.jsp?fail=1");
			System.out.println("fail");
		}

		// close database connection
		UserLogin_DAO.CloseConnection();

	}

}

