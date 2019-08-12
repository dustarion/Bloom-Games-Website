package servlets;

import java.io.IOException;

import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Comment;
import db.CommentDAO;
import db.CommentDAOImpl;

/**
 * Servlet implementation class ServletAddComment
 */
@WebServlet("/ServletAddComment")
public class ServletAddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletAddComment() {
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
		try {
			if (request.getParameter("submit") != null) {
				int gameID = Integer.parseInt(request.getParameter("gameID"));
				String commenterName = request.getParameter("commenterName");
				int rating = Integer.parseInt(request.getParameter("rating"));
				String comment = request.getParameter("comment");
				
				Comment cmt = new Comment();
				cmt.SetGameID(gameID);
				cmt.SetCommenterName(commenterName);
				cmt.SetRating(rating);
				cmt.SetComment(comment);
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			    cmt.SetDatetime(timestamp);
				
				
				CommentDAO Comment_DAO = new CommentDAOImpl();
				if (Comment_DAO.AddComment(cmt)) {
					response.sendRedirect("game.jsp?gameid=" + gameID + "&success=1");
				} else {
					response.sendRedirect("game.jsp?gameid=" + gameID + "&success=0");
				}
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		}

	}

}
