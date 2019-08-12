package db;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment implements Serializable {
	
	int CommentID;
	int GameID;
	String CommenterName;
	int Rating;
	Timestamp Datetime;
	String Comment;

	public Comment() {

	}

	public Comment(int CommentID, int GameID, String CommenterName, int Rating, Timestamp Datetime, String Comment) {
		this.SetCommentID(CommentID);
		this.SetGameID(GameID);
		this.SetCommenterName(CommenterName);
		this.SetRating(Rating);
		this.SetDatetime(Datetime);
		this.SetComment(Comment);
	}

	// Setters
	public void SetCommentID(int CommentID) {
		this.CommentID = CommentID;
	}
	
	public void SetGameID(int GameID) {
		this.GameID = GameID;
	}
	
	public void SetCommenterName(String CommenterName) {
		this.CommenterName = CommenterName;
	}
	
	public void SetRating(int Rating) {
		this.Rating = Rating;
	}
	
	public void SetDatetime(Timestamp Datetime) {
		this.Datetime = Datetime;
	}
	
	public void SetComment(String Comment) {
		this.Comment = Comment;
	}
	
	
	// Getters
	public Timestamp GetTimeStamp() {
		return this.Datetime;
	}

	public String GetDate() {
		Date date = new Date(this.Datetime.getTime());
		DateFormat f = new SimpleDateFormat("dd-MM-yyyy");
		return f.format(date);
	}

	public int GetCommentID() {
		return this.CommentID;
	}

	public int GetGameID() {
		return this.GameID;
	}
	
	public String GetCommenterName() {
		return this.CommenterName;
	}

	public int GetRating() {
		return this.Rating;
	}

	public String GetComment() {
		return this.Comment;
	}
	
	
}
