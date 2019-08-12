package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

public class CommentDAOImpl implements CommentDAO {
	SqlDAO DBSQL;
	Connection con;

	public CommentDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}

	public CommentDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}

	// Get Comments for a given Game
	public ArrayList<Comment> GetCommentList(int GameID) {
		try {
			
			// First find all the comment id's using the GameID
			ResultSet comments = DBSQL.SelectSQL("SELECT * from game_comment WHERE gamecommentID = ?", GameID);
			List<Integer> commentIDs = new ArrayList<Integer>();
			while (comments.next()) {
				int row = Integer.parseInt(comments.getString("commentID"));
				commentIDs.add(row);
			}
			
			// Now create an array of comments
			ArrayList<Comment> commentList = new ArrayList<Comment>();
			
			// Iterate through commentIDs to fill up commentList
			for (int commentID : commentIDs) {
				commentList.add(GetComment(GameID, commentID));
			}
			
			return commentList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private Comment GetComment(int GameID, int CommentID) {
		try {
			ResultSet comment = DBSQL.SelectSQL("SELECT * from comments WHERE commentID = ?", CommentID);
			
			while (comment.next()) {
				String CommenterName = comment.getString("commenterName");
				int Rating = Integer.parseInt(comment.getString("rating"));
				Timestamp Datetime = comment.getTimestamp("date");
				String Comment = comment.getString("comment");
				
				return new Comment(CommentID, GameID, CommenterName, Rating, Datetime, Comment);
			}
			
			// If it reaches here then
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Add a comment for a given Game
	// Input is a comment object which has all the data we need to add it to our sql db.
	public boolean AddComment(Comment Comment) {
		try {
			Object[] comm = {Comment.GetCommenterName(), Comment.GetComment(), Comment.GetRating(), Comment.GetTimeStamp()};
			
			boolean ins = DBSQL.InsertSQL("INSERT INTO `comments` (`commentID`, `commenterName`,`rating`, `date`,`comment`) VALUES (NULL, ?, ?, ?, ?)", comm);
				
			if (ins) {
				Object[] tempobj = { Comment.GetGameID() };
				return DBSQL.InsertSQL("INSERT INTO `game_comment` (`commentID`, `gameCommentID`) VALUES (LAST_INSERT_ID(), ?)", tempobj);
			}
			
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
