package servlets;

import java.io.IOException;
import java.util.List;

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
import db.UserLoginDAO;
import db.UserLoginDAOImpl;

/**
 * Servlet implementation class ServletCart
 */
@WebServlet("/ServletUpdateCart")
public class ServletUpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUpdateCart() {
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
		
		// Create a Cart Item
		int GameID = Integer.parseInt(request.getParameter("gameID"));
		int Qty = Integer.parseInt(request.getParameter("qty"));
		CartItem cart_item = new CartItem(GameID, Qty);
		
		HttpSession session = request.getSession();
		int UserID = Integer.parseInt(session.getAttribute("userid").toString());
		CartDAO Cart_DAO = new CartDAOImpl();
		
		// Update the Cart Item
		Cart_DAO.UpdateCartItem(UserID, GameID, Qty);
		
		response.sendRedirect("cart.jsp");
	}

}
