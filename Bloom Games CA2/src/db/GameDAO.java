package db;

import java.io.InputStream;
import java.util.ArrayList;

public interface GameDAO {
	public void CloseConn();

	public boolean CreateGame(Game Game);

	public boolean UpdateGame(Game GameRow);

	public boolean DeleteGame(int GameID);

	public Game GetGameInfo(int gameid);

	public ArrayList<Game> GetGamesList();

	public ArrayList<Game> GetPreownedGamesList(int PreOwned);

}
