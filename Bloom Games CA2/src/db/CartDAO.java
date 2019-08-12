package db;
import java.util.ArrayList;

public interface CartDAO {
	
	// Entire Cart
	public ArrayList<CartItem> GetCartItemList(int CartID);
	
	public int DeleteCart(int UserID);
	
	// Individual Cart Items
	public int InsertCartItem(int CartID, int GameID, int qty);
	
	public int UpdateCartItem(int CartID, int GameID, int qty);
	
	public int DeleteCartItem(int CartID, int GameID);
	
	public boolean ItemAlreadyInCart(int UserID, int GameID);
}
