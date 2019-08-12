package db;

import java.util.List;
import java.io.Serializable;

public class Cart implements Serializable {

	// List of games inside the cart
	private List<CartItem> cartItemList;

	public void SetCartList(List<CartItem> CartList) {
		this.cartItemList = CartList;
	}

	public List<CartItem> GetCartList() {
		return this.cartItemList;
	}
}
