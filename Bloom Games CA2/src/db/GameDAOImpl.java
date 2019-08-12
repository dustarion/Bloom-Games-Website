package db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GameDAOImpl implements GameDAO {
	SqlDAO DBSQL;
	Connection con;

	public GameDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}

	public GameDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}

	public void CloseConn() {
		DBSQL.CloseConnection();
	}

	public boolean CreateGame(Game Game) {
		try {
			System.out.println("createGame");
			PreparedStatement ps = con.prepareStatement("INSERT INTO `games` (`gameID`, `gameTitle`,`Company`, `releaseDate`, `description`, `price`, `imageLocation`, `preOwned`, `quantity`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setObject(1, Game.GetGameTitle());
			ps.setObject(2, Game.GetCompany());
			ps.setObject(3, Game.GetReleaseDate());
			ps.setObject(4, Game.GetDescription());
			ps.setObject(5, Game.GetPrice());
			ps.setObject(6, Game.GetImageLocation());
			ps.setObject(7, Game.GetPreOwned());
			ps.setObject(8, Game.GetQty());
			ps.execute();
			
			// Get the ID Number
			int GameID;
			ResultSet insertID = DBSQL.SelectSQL("SELECT LAST_INSERT_ID()");
			if (insertID.next()) {
				GameID = Integer.parseInt(insertID.getString(1));
			} else {
				return false;
			}

			for (Genres s : Game.GetGenres()) {
				Object[] fields = {s.GetGenreID(), Game.GetGameID()};
				boolean insert = DBSQL.InsertSQL("INSERT INTO `game_genre` (`genreID`, `gameID`) VALUES ( ?, ?)", fields);
				if (insert) {
					System.out.println("Genre - Success");
				} else {
					System.out.println("Genre - Fail");
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean UpdateGame(Game GameRow) {
		try {
			System.out.println("test");
			PreparedStatement ps = con.prepareStatement(
					"UPDATE `games` SET `gameTitle` = ?, `Company` = ?, `releaseDate` = ?, `description` = ?, `price` = ?, `imageLocation` = ?, `preOwned` = ?, `quantity` = ? WHERE `games`.`gameID` = ?");
			ps.setObject(1, GameRow.GetGameTitle());
			ps.setObject(2, GameRow.GetCompany());
			ps.setObject(3, GameRow.GetReleaseDate());
			ps.setObject(4, GameRow.GetDescription());
			ps.setObject(5, GameRow.GetPrice());
			ps.setObject(6, GameRow.GetImageLocation());
			ps.setObject(7, GameRow.GetPreOwned());
			ps.setObject(8, GameRow.GetQty());
			ps.setObject(9, GameRow.GetGameID());
			ps.execute();

			DBSQL.InsertSQL("DELETE FROM `game_genre` WHERE `gameID` = ?", GameRow.GetGameID());

			for (Genres s : GameRow.GetGenres()) {
				System.out.println(s);
				Object[] fields = { s.GetGenreID(), GameRow.GetGameID()};
				boolean insert = DBSQL.InsertSQL("INSERT INTO `game_genre` (`genreID`, `gameID`) VALUES ( ?, ?)", fields);
				if (insert) {
					System.out.println("Genre - Success");
				} else {
					System.out.println("Genre - Fail");
				}
			}
			return true;

		} catch (Exception e) {
			System.out.println("Crashed");
			e.printStackTrace();
			return false;
		}
	}

	public boolean DeleteGame(int GameID) {
		try {
			// Delete Game
			boolean del = DBSQL.InsertSQL("DELETE FROM `games` WHERE `games`.`gameID` = ?", GameID);
			if (del) {
				// Successful Deletion
				// Delete Game Genre's
				return DBSQL.InsertSQL("DELETE FROM `game_genre` WHERE `game_genre`.`gameID` = ?", GameID);
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Game GetGameInfo(int gameid) {
		try {
			ResultSet rs = DBSQL.SelectSQL("SELECT * from games WHERE gameID = ?", gameid);
			if (rs.next()) {
				Game row = new Game(Integer.parseInt(rs.getString("gameID")), rs.getString("gametitle"), rs.getString("company"), rs.getString("releasedate"), rs.getString("description"), Double.parseDouble(rs.getString("price")), rs.getString("imageLocation"), Integer.parseInt(rs.getString("preowned")), Integer.parseInt(rs.getString("quantity")));
				
				ResultSet rs1 = DBSQL.SelectSQL(
						"SELECT gg.gameID, G.genreName FROM game_genre gg, genre G WHERE gg.gameID = ? AND gg.genreID = G.genreID",
						rs.getString("gameID"));
				ArrayList<Genres> temparray = new ArrayList<Genres>();
				while (rs1.next()) {
					Genres temp = new Genres();
					temp.SetGenreName(rs1.getString(2));
					temparray.add(temp);
				}
				row.SetGenresList(temparray);
				return row;
			} else {
				System.out.println("Function returning null");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Crashed!");
			return null;
		}
	}

	public ArrayList<Game> GetGamesList() {
		try {
			
			ResultSet rs = DBSQL.SelectSQL("SELECT * from games");
			ArrayList<Game> results = new ArrayList<Game>();
			
			while (rs.next()) {
				results.add(GetGameInfo(Integer.parseInt(rs.getString("gameID"))));
			}
			return results;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	// Preowned = 1, New = 0
	public ArrayList<Game> GetPreownedGamesList(int PreOwned) {
		try {
			ResultSet rs;
			rs = DBSQL.SelectSQL("SELECT * from games WHERE preOwned = ?", PreOwned);
			ArrayList<Game> results = new ArrayList<Game>();
			while (rs.next()) {
				results.add(GetGameInfo(Integer.parseInt(rs.getString("gameID"))));
			}
			return results;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

}
