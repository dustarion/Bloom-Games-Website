package db;

import java.io.Serializable;

public class GamePurchase implements Serializable {
	
	// Purchase Transaction
	int TransactionID;
	int GameID;
	int Quantity;
	Double UnitPrice;
	
	public GamePurchase() {}
	
	public GamePurchase(int TransactionID, int GameID, int Quantity, Double UnitPrice) {
		this.TransactionID = TransactionID;
		this.GameID = GameID;
		this.Quantity = Quantity;
		this.UnitPrice = UnitPrice;
	}
	
	public GamePurchase(int GameID, int Quantity, Double UnitPrice) {
		this.GameID = GameID;
		this.Quantity = Quantity;
		this.UnitPrice = UnitPrice;
	}
	
	// Setters
	public void SetTransactionID(int TransactionID) {
		this.TransactionID = TransactionID;
	}
	
	public void SetGameID(int GameID) {
		this.GameID = GameID;
	}
	
	public void SetQuantity(int Quantity) {
		this.Quantity = Quantity;
	}
	
	public void SetUnitPrice(Double UnitPrice) {
		this.UnitPrice = UnitPrice;
	}

	// Getters
	public int GetTransactionID() {
		return this.TransactionID;
	}
	
	public int GetGameID() {
		return this.GameID;
	}
	
	public int GetQuantity() {
		return this.Quantity;
	}
	
	public Double GetUnitPrice() {
		return this.UnitPrice;
	}
	
	// Additional Get's
	public Double GetTotalPrice() {
		return (this.UnitPrice * this.Quantity);
	}
	
}
