package db;

import java.io.Serializable;

public class Genres implements Serializable {
	
	int GenreID;
	String GenreName;

	public Genres() {

	}

	public Genres(int GenreID, String GenreName) {
		this.GenreID = GenreID;
		this.GenreName = GenreName;
	}

	public void SetGenreID(int GenreID) {
		this.GenreID = GenreID;
	}

	public void SetGenreName(String GenreName) {
		this.GenreName = GenreName;
	}

	public int GetGenreID() {
		return this.GenreID;
	}

	public String GetGenreName() {
		return this.GenreName;
	}
}
