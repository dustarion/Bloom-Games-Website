package db;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {
	SqlDAO DBSQL;
	Connection con;
	
	public CartDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}
	
	public CartDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}
	
	// Get the list of CartItems
	public ArrayList<CartItem> GetCartItemList(int UserID) {
		try {
			ResultSet cartItems;
				
			cartItems = DBSQL.SelectSQL("SELECT * FROM game_cart WHERE `game_cart`.`cartOwner` = ?", UserID);
			
			ArrayList<CartItem> CartItemList = new ArrayList<CartItem>();

			while (cartItems.next()) {
				CartItem row = new CartItem(Integer.parseInt(cartItems.getString("game")), Integer.parseInt(cartItems.getString("quantity")));
				CartItemList.add(row);
			}
			
			return CartItemList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// Create a New Empty Cart (Create New or Reset After Checkout)
	// TODO: Test if this works when attempting to override an existing cart.
	public int DeleteCart(int UserID) {
		try {
;
			
			// Only need to insert GenreName as the id is automatically generated on the SQL server.
			boolean ins = DBSQL.InsertSQL("DELETE FROM game_cart WHERE `game_cart`.`cartOwner` = ?", UserID);
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
	
	// Insert a Cart Item
	// 1 = Successful, 0 = Unsucessful, -1 = exception
	public int InsertCartItem(int UserID, int GameID, int qty) {
		try {
			
			Object[] tempobj = { UserID, GameID, qty };
			boolean ins = DBSQL.InsertSQL("INSERT INTO `game_cart` (`cartOwner`, `game`, `quantity`) VALUES (?, ?, ?)", tempobj);
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
	
	// Update a Cart Item
	// 1 = Successful, 0 = Unsucessful, -1 = exception
	public int UpdateCartItem(int UserID, int GameID, int qty) {
		try {
			Object[] tempobj = { qty, UserID, GameID };
			boolean upd = DBSQL.InsertSQL("UPDATE `game_cart` SET `quantity` = ? WHERE `game_cart`.`cartOwner` = ? AND  `game_cart`.`game` = ?", tempobj);
			if (upd) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	// Delete a Cart Item
	// 1 = Successful, 0 = Unsucessful, -1 = exception
	public int DeleteCartItem(int UserID, int GameID) {
		try {
			// Delete Genre
			Object[] tempobj = { UserID, GameID };
			boolean del = DBSQL.InsertSQL("DELETE FROM `game_cart` WHERE `game_cart`.`cartOwner` = ? AND  `game_cart`.`game` = ?", tempobj);
			if (del) {
				return 0;
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean ItemAlreadyInCart(int UserID, int GameID) {
		try {
			// Delete Genre
			Object[] tempobj = { UserID, GameID };
			ResultSet rs = DBSQL.SelectSQL("SELECT FROM 'game_cart' WHERE `game_cart`.`cartOwner` = ? AND  `game_cart`.`game` = ?", tempobj);
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
