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
@WebServlet("/admin/ServletUpdate")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB

public class ServletGameUpdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameDAO GameDAOinit = new GameDAOImpl();
		Map<String, String[]> parameters = request.getParameterMap();
		for (String parameter : parameters.keySet()) {
			System.out.print(parameter);
			System.out.print(parameters.get(parameter));
		}

		System.out.println("Received Request");
		System.out.println(request.getParameter("submit"));
		System.out.println(request.getParameter("gameID"));
		if (request.getParameter("gameID") != null) {
			int gameID = Integer.parseInt(request.getParameter("game_id"));
			
			String gameTitle = request.getParameter("gameTitle");
			String company = request.getParameter("company");
			String release = request.getParameter("releaseDate");
			String description = request.getParameter("description");
			Double price = Double.parseDouble(request.getParameter("price"));
			String imageLocation = request.getParameter("imageLocation");
			int preOwned = Integer.parseInt(request.getParameter("preOwned"));
			
			String[] genres_form = request.getParameterValues("genres");
			int qty = Integer.parseInt(request.getParameter("qty"));
			
			
			Game temp = new Game();
			temp.SetGameID(gameID);
			temp.SetGameTitle(gameTitle);
			temp.SetCompany(company);
			temp.SetReleaseDate(release);
			temp.SetDescription(description);
			temp.SetPrice(price);
			temp.SetQty(qty);
			temp.SetImageLocation(imageLocation);
			temp.SetPreOwned(preOwned);
			
			ArrayList<Genres> temp2 = new ArrayList<Genres>();
			for (String s : genres_form) {
				Genres temp3 = new Genres();
				temp3.SetGenreID(Integer.parseInt(s));
				temp2.add(temp3);
			}
			
			temp.SetGenresList(temp2);
			
			GameDAOinit.UpdateGame(temp);
			
			System.out.println("Success");
			GameDAOinit.CloseConn();
			response.sendRedirect("adminGames.jsp?success=1");

		} else {
			System.out.println("An Error Occurred");
			response.sendRedirect("index.jsp");
		}
	}
}
