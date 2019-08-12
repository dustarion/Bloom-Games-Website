package db;

import java.util.ArrayList;

public interface GenresDAO {
	public ArrayList<Genres> GetGenresList();

	public int InsertGenre(String GenreName);

	public boolean UpdateGenre(int GenreID, String GenreName);

	public int DeleteGenre(int GenreID);
}
