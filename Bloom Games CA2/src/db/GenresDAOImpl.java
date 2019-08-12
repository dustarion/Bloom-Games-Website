package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GenresDAOImpl implements GenresDAO {
	SqlDAO DBSQL;
	Connection con;

	public GenresDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}

	public GenresDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}

	// Get the list of Genres
	public ArrayList<Genres> GetGenresList() {
		try {
			ResultSet genres;
			
			genres = DBSQL.SelectSQL("SELECT * FROM genre");
			
			ArrayList<Genres> genre_list = new ArrayList<Genres>();

			while (genres.next()) {
				Genres row = new Genres(Integer.parseInt(genres.getString("genreID")), genres.getString("genreName"));
				genre_list.add(row);
			}
			return genre_list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Insert a Genre
	public int InsertGenre(String GenreName) {
		try {
			// Only need to insert GenreName as the id is automatically generated on the SQL server.
			boolean ins = DBSQL.InsertSQL("INSERT INTO `genre` (`genreId`, `genreName`) VALUES (NULL, ?)\r\n", GenreName);
			if (ins) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// Update Genres
	// TODO: Test tempobj for bugs!
	public boolean UpdateGenre(int GenreID, String GenreName) {
		try {
			Object[] tempobj = { GenreName, GenreID };
			boolean upd = DBSQL.InsertSQL("UPDATE `genre` SET `genreName` = ? WHERE `genre`.`genreId` = ?", tempobj);
			if (upd) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// Delete a Genre
	public int DeleteGenre(int GenreID) {
		try {
			ResultSet rs = DBSQL.SelectSQL("SELECT * FROM game_genre WHERE genreID = ?", GenreID);
			if (rs.next()) {
				// Prevent deletion of genre as there are games that exist.
				return 1;
			} else {
				// Delete Genre
				boolean del = DBSQL.InsertSQL("DELETE FROM 'genre' WHERE `genre`.`genreID` = ?", GenreID);
				if (del) {
					return 0;
				} else {
					return -1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
}