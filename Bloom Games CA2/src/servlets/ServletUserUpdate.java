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

/**
 * Servlet implementation class ServletUpdateUser
 */
@WebServlet("/ServletUserUpdate")
public class ServletUserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUserUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") != null) {
			int userID = (int) session.getAttribute("userid");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String contactNumber = request.getParameter("contact");
			String mailingAddress = request.getParameter("address");
			UserLogin UserData = new UserLogin();
			
			UserData.SetUserID(userID);
			UserData.SetEmail(email);
			
			UserData.SetName(name);
			UserData.SetMailingAddress(mailingAddress);
			UserData.SetContactNumber(contactNumber);
			
			UserLoginDAO UserLogin_DAO = new UserLoginDAOImpl();
			if (UserLogin_DAO.UpdateUserInfo(UserData)) {
				session.setAttribute("name", name);
				response.sendRedirect("userSettings.jsp?success=1");
			} else {
				response.sendRedirect("userSettings.jsp?fail=1");
			}
			// TODO Auto-generated method stub
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
