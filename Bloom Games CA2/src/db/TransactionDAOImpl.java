package db;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    

public class TransactionDAOImpl implements TransactionDAO {
	SqlDAO DBSQL;
	Connection con;
	
	public TransactionDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}
	
	public TransactionDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}
	
	public ArrayList<Transaction> GetUserTransactions(int UserID) {
		try {
			
			ResultSet rs = DBSQL.SelectSQL("SELECT * FROM purchase_transaction WHERE `purchase_transaction`.`owner` = ?", UserID);
			
			ArrayList<Transaction> TransactionList = new ArrayList<Transaction>();
			
			while(rs.next()) {
				Transaction temp = new Transaction();
				temp.SetTransactionID(Integer.parseInt(rs.getString("transactionID")));
				temp.SetUserID(UserID);
				temp.SetPurchaseDate(rs.getString("date"));
				temp.SetGamePurchaseList(GetTransactionGame(Integer.parseInt(rs.getString("transactionID"))));
				TransactionList.add(temp);
			}
			
			if (TransactionList.size() > 0) {
				return TransactionList;
			} else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<GamePurchase> GetTransactionGame(int TransactionID) {
		try {
			ResultSet rs = DBSQL.SelectSQL("SELECT * FROM game_purchase WHERE `game_purchase`.`transaction` = ?", TransactionID);
			
			ArrayList<GamePurchase> GamePurchaseList = new ArrayList<GamePurchase>();

			while (rs.next()) {
				GamePurchase row = new GamePurchase(TransactionID, Integer.parseInt(rs.getString("purchasedGame")), Integer.parseInt(rs.getString("quantity")), Double.parseDouble(rs.getString("unitPrice")));
				System.out.print(row);
				GamePurchaseList.add(row);
			}
			
			System.out.print("\n GamePurchaseList: " + GamePurchaseList +"\n");
			return GamePurchaseList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// Checkout Cart
	public boolean AddNewTransaction(int UserID) {
		try {
			// Get Current Cart
			CartDAO cart_DAO = new CartDAOImpl();
			ArrayList<CartItem> CurrentCartItems = cart_DAO.GetCartItemList(UserID);
			
			// Current Date Time
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			String CurrentDateTime = dtf.format(now).toString();
			
			if (CurrentCartItems.size() > 0) {
				
				// Insert Purchase_transaction first
				Object[] tempobj = { UserID, CurrentDateTime};
				boolean ins = DBSQL.InsertSQL("INSERT INTO `purchase_transaction` (`transactionID`, `owner`, `date`) VALUES (NULL, ?, ?)", tempobj);
				
				if (ins) {
					// Get the Transaction ID LAST_INSERT_ID()
					ResultSet rs = DBSQL.SelectSQL("SELECT LAST_INSERT_ID()");
					if (rs.next()) {
						int TransactionID = Integer.parseInt(rs.getString(1));
						
						// Add the Transaction Games
						for (CartItem CartItem: CurrentCartItems) {
							GameDAO game_DAO = new GameDAOImpl();
							
							Object[] tempobj2 = {TransactionID, CartItem.GetGameID(), CartItem.GetQty(), game_DAO.GetGameInfo(CartItem.GetGameID()).GetPrice()};
							boolean ins2 = DBSQL.InsertSQL("INSERT INTO `game_purchase` (`transaction`, `purchasedGame`, `quantity`, `unitPrice`) VALUES (?, ?, ?, ?)", tempobj2);
							
							// Remove Quantity From Total Game Stock
							int NewQty = game_DAO.GetGameInfo(CartItem.GetGameID()).GetQty() - CartItem.GetQty();
							
							Game NewGame = game_DAO.GetGameInfo(CartItem.GetGameID());
							NewGame.SetQty(NewQty);
							game_DAO.UpdateGame(NewGame);
							
							if (!ins2) {
								return false;
							}
						}
						
						// Reset Cart
						cart_DAO.DeleteCart(UserID);
						
						return true;
					} else {
						return false;
					}
					
				} else {
					return false;
				}
				
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
