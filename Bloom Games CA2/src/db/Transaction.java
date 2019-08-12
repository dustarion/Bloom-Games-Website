package db;

import java.util.ArrayList;
import java.io.Serializable;

public class Transaction implements Serializable {
	
	// Purchase Transaction
	int TransactionID;
	int UserID;
	String PurchaseDate;
	
	// List of Purchases
	private ArrayList<GamePurchase> GamePurchaseList;

	// Constructors
	public Transaction() {}
	
	public Transaction(int TransactionID, int UserID, String PurchaseDate, ArrayList<GamePurchase> GamePurchaseList) {
		this.TransactionID = TransactionID;
		this.UserID = UserID;
		this.PurchaseDate = PurchaseDate;
		this.GamePurchaseList = GamePurchaseList;
	}
	
	public Transaction(int TransactionID, int UserID, String PurchaseDate) {
		this.TransactionID = TransactionID;
		this.UserID = UserID;
		this.PurchaseDate = PurchaseDate;
	}
	
	// Setters
	public void SetTransactionID(int TransactionID) {
		this.TransactionID = TransactionID;
	}
	
	public void SetUserID(int UserID) {
		this.UserID = UserID;
	}

	public void SetPurchaseDate(String PurchaseDate) {
		this.PurchaseDate = PurchaseDate;
	}
	
	public void SetGamePurchaseList(ArrayList<GamePurchase> GamePurchaseList) {
		this.GamePurchaseList = GamePurchaseList;
	}
	
	// Getters
	public int GetTransactionID() {
		return this.TransactionID;
	}
	
	public int GetUserID() {
		return this.UserID;
	}
	 
	public String GetPurchaseDate() {
		return this.PurchaseDate;
	}
	
	public ArrayList<GamePurchase> GetGamePurchaseList() {
		return this.GamePurchaseList;
	}
	
	// Additional Getters
	public Double GetTotalPrice() {
		Double TotalPrice = 0.0;
		
		System.out.print("Start");
		System.out.print(GamePurchaseList);
		
		for (GamePurchase game: GamePurchaseList) {
			System.out.print(game.GetTotalPrice());
			TotalPrice += game.GetTotalPrice();
		}
		
		return TotalPrice;
	}
	
}
