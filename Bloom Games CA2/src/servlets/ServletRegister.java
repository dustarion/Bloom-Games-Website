package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserLogin;
import db.UserLoginDAO;
import db.UserLoginDAOImpl;
import db.ValidationUtils;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String confirmPassword = request.getParameter("confirmPassword").trim();
		
		String name = request.getParameter("name").trim();
		String mailingAddress = request.getParameter("mailingAddress").trim();
		String contactNumber = request.getParameter("contactNumber").trim();

		String emailregex = "/^\\w+@\\w+\\.\\w+$/";
		UserLoginDAO UserLogin_DAO = new UserLoginDAOImpl();
		ValidationUtils Check = new ValidationUtils();
		
		// Check if any data sent is null
		if (Check.isNull(email) | Check.isNull(password) | Check.isNull(confirmPassword) | Check.isNull(name) | Check.isNull(mailingAddress) | Check.isNull(contactNumber)) {
			response.sendRedirect("signup.jsp?fail=null");
		}
		// Data validation
		else if (!Check.checkEmail(email) | contactNumber.trim().length() != 8 | !(Check.isInt(contactNumber)) | Check.checkPassword(password) != 0) {
			response.sendRedirect("signup.jsp?fail=condition");
		}
		else if (!password.equals(confirmPassword)) {
			response.sendRedirect("signup.jsp?fail=passwordMatch");
		} else {

			UserLogin UserData = new UserLogin(email, password, name, mailingAddress, contactNumber);

			if (UserLogin_DAO.AddUser(UserData)) {
				request.setAttribute("email", UserData.GetEmail());
				request.setAttribute("password", UserData.GetPassword());
				request.getRequestDispatcher("ServletLogin").forward(request, response);
			} else {
				response.sendRedirect("signup.jsp?fail=1");
			}
		}
			
		UserLogin_DAO.CloseConnection();
	}

}
