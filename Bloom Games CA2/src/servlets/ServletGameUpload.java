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
import javax.servlet.http.Part;

import db.Game;
import db.GameDAO;
import db.GameDAOImpl;
import db.Genres;

@SuppressWarnings("serial")
@WebServlet("/ServletGameUpload")

public class ServletGameUpload extends HttpServlet {
	GameDAO GameDAOinit = new GameDAOImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Gets values of text fields
		String gameTitle = request.getParameter("gameTitle");
		System.out.print("Game TITLE: " +  request.getParameter("gameTitle"));
		String company = request.getParameter("company");
		String release = request.getParameter("releaseDate");
		String description = request.getParameter("description");
		System.out.print("PRICE: " + request.getParameter("price"));
		Double price = Double.parseDouble(request.getParameter("price"));
		String imageLocation = request.getParameter("imageLocation");
		String preowned = request.getParameter("preowned");
		
//		int creatorID = Integer.parseInt(request.getParameter("creatorID"));
		
		int qty = Integer.parseInt(request.getParameter("qty"));
		String[] genres = request.getParameterValues("genres");

		//InputStream inputStream = null; // input stream of the upload file
		Game game = new Game();
		game.SetGameTitle(gameTitle);
		game.SetCompany(company);
		game.SetReleaseDate(release);
		game.SetDescription(description);
		game.SetPrice(price);
		game.SetQty(qty);
		game.SetImageLocation(imageLocation);
		
		game.SetPreOwned(Integer.parseInt(preowned));
		ArrayList<Genres> TempArrayList = new ArrayList<Genres>();
		
		for (String s : genres) {
			Genres temp = new Genres();
			temp.SetGenreID(Integer.parseInt(s));
			TempArrayList.add(temp);
		}
		
		game.SetGenresList(TempArrayList);
		
		GameDAOinit.CreateGame(game);

		// closes the database connection
		//GameDAOinit.CloseConn();

		// sets the message in request scope
		// forwards to the message page
		response.sendRedirect("admingames.jsp?success=3");
	}

}
