package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.CartItem;
import db.Cart;
import db.CartDAO;
import db.CartDAOImpl;
import db.Transaction;
import db.TransactionDAO;
import db.TransactionDAOImpl;

/**
 * Servlet implementation class ServletCart
 */
@WebServlet("/ServletCheckout")
public class ServletCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletCheckout() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("test!");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userid") != null) {
			int UserID = Integer.parseInt(session.getAttribute("userid").toString());
			TransactionDAO Transaction_DAO = new TransactionDAOImpl();
			
			if (Transaction_DAO.AddNewTransaction(UserID)) {
				response.sendRedirect("checkoutSuccess.jsp");
			} else {
				response.sendRedirect("checkoutSuccess.jsp?fail=true");
			}
		} else {
			response.sendRedirect("login.jsp");
		}

	}

}
