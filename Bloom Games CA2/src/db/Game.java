package db;

import java.io.Serializable;
import java.util.ArrayList;

public class Game implements Serializable {
	
	// Game
	int GameID;
	String GameTitle;
	String Company;
	String ReleaseDate;
	String Description;
	Double Price;
	String ImageLocation;
	int PreOwned;
	int Quantity;
	ArrayList<Genres> Genres;
	
	public Game() {}
	
	public Game(int GameID, String GameTitle, String Company, String ReleaseDate, String Description,
			Double Price, String ImageLocation, int PreOwned, int Quantity, ArrayList<Genres> GenresList) {
		this.GameID = GameID;
		this.GameTitle = GameTitle;
		this.Company = Company;
		this.ReleaseDate = ReleaseDate;
		this.Description = Description;
		this.Price = Price;
		this.ImageLocation = ImageLocation;
		this.PreOwned = PreOwned;
		this.Quantity = Quantity;
		this.Genres = GenresList;
	}
	
	public Game(int GameID, String GameTitle, String Company, String ReleaseDate, String Description,
			Double Price, String ImageLocation, int PreOwned, int Quantity) {
		this.GameID = GameID;
		this.GameTitle = GameTitle;
		this.Company = Company;
		this.ReleaseDate = ReleaseDate;
		this.Description = Description;
		this.Price = Price;
		this.ImageLocation = ImageLocation;
		this.PreOwned = PreOwned;
		this.Quantity = Quantity;
	}
	
	// Setter Methods
	
	public void SetGameID(int GameID) {
		this.GameID = GameID;
	}

	public void SetGameTitle(String GameTitle) {
		this.GameTitle = GameTitle;
	}

	public void SetCompany(String Company) {
		this.Company = Company;
	}

	public void SetReleaseDate(String ReleaseDate) {
		this.ReleaseDate = ReleaseDate;
	}

	public void SetDescription(String Description) {
		this.Description = Description;
	}

	public void SetPrice(Double Price) {
		this.Price = Price;
	}
	
	public void SetImageLocation(String ImageLocation) {
		this.ImageLocation = ImageLocation;
	}
	
	public void SetPreOwned(int PreOwned) {
		this.PreOwned = PreOwned;
	}
	
	
	public void SetQty(int Qty) {
		this.Quantity = Qty;
	}

	public void SetGenresList(ArrayList<Genres> GenresList) {
		this.Genres = GenresList;
	}

	// Getter Methods

	public int GetGameID() {
		return this.GameID;
	}

	public String GetGameTitle() {
		return this.GameTitle;
	}

	public String GetCompany() {
		return this.Company;
	}

	public String GetReleaseDate() {
		return this.ReleaseDate;
	}

	public String GetDescription() {
		return this.Description;
	}

	public Double GetPrice() {
		return this.Price;
	}
	
	public String GetImageLocation() {
		return this.ImageLocation;
	}
	
	public int GetPreOwned() {
		return this.PreOwned;
	}
	
	public int GetQty() {
		return this.Quantity;
	}

	public ArrayList<Genres> GetGenres() {
		return this.Genres;
	}
}