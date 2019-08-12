package db;
import java.util.ArrayList;
import java.util.List;

public interface TransactionDAO {
	
	// Get List of Transactions
	public ArrayList<Transaction> GetUserTransactions(int UserID);
	
	// Get List of Games in a Transaction
	public ArrayList<GamePurchase> GetTransactionGame(int TransactionID);
	
	public boolean AddNewTransaction(int UserID); // Checkout Cart
	
}
