package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import db.Game;
import db.GameDAO;
import db.GameDAOImpl;
import db.Genres;

@SuppressWarnings("serial")
@WebServlet("/ServletGameUpdateQty")

public class ServletGameUpdateQty extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameDAO GameDAOinit = new GameDAOImpl();
		Map<String, String[]> parameters = request.getParameterMap();
		for (String parameter : parameters.keySet()) {
			System.out.print(parameter);
			System.out.print(parameters.get(parameter));
		}

		System.out.println("Received Request");
		if (request.getParameter("gameID") != null) {
			int gameID = Integer.parseInt(request.getParameter("gameID"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			
			Game temp = GameDAOinit.GetGameInfo(gameID);
			temp.SetQty(qty);
			
			GameDAOinit.UpdateGame(temp);
			
			System.out.println("Success");
			response.sendRedirect("admin.jsp");

		} else {
			System.out.println("An Error Occurred");
			response.sendRedirect("admin.jsp");
		}
	}
}
