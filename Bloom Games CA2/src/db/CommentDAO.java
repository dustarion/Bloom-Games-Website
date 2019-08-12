package db;

import java.util.ArrayList;

public interface CommentDAO {
	
	// Get Comments for a Game
	public ArrayList<Comment> GetCommentList(int GameID);
	
	// Add a Comment for a Game
	public boolean AddComment(Comment Comment);
}
