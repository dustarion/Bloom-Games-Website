package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import db.CartDAO;
import db.CartDAOImpl;
import db.Game;
import db.GameDAO;
import db.GameDAOImpl;
import db.Genres;

@SuppressWarnings("serial")
@WebServlet("/ServletGameDelete")

public class ServletGameDelete extends HttpServlet {
	GameDAO GameDAOinit = new GameDAOImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.print("test");
		
		// Gets values of text fields
		int GameID = Integer.parseInt(request.getParameter("gameID"));
				
		HttpSession session = request.getSession();
				
		// Delete the Cart Item
		GameDAOinit.DeleteGame(GameID);
		
		// sets the message in request scope
		// forwards to the message page
		response.sendRedirect("adminGames.jsp");
	}

}
