package db;

import java.io.Serializable;

public class UserLogin implements Serializable {
	
	int userID;
	String email;
	String password;
	String saltedPasswordHash;
	int admin;
	String name;
	String mailingAddress;
	String contactNumber;

	public UserLogin() {}

	public UserLogin(int userID, String email, String password, String saltedPasswordHash, int admin, String name, String mailingAddress, String contactNumber) {
		// Use for grabbing info from database
		this.userID = userID;
		this.email = email;
		this.password = password;
		this.saltedPasswordHash = saltedPasswordHash;
		this.admin = admin;
		this.name = name;
		this.mailingAddress = mailingAddress;
		this.contactNumber = contactNumber;
	}

	public UserLogin(String email, String password, String name, String mailingAddress, String contactNumber) {
		// New registration
		this.email = email;
		this.password = password;
		this.name = name;
		this.mailingAddress = mailingAddress;
		this.contactNumber = contactNumber;
	}

	// Setters
	public void SetUserID(int userID) {
		this.userID = userID;
	}

	public void SetEmail(String Email) {
		this.email = Email;
	}

	public void SetPassword(String Password) {
		this.password = Password;
	}
	
	public void SetSaltedPasswordHash(String saltedPasswordHash) {
		this.saltedPasswordHash = saltedPasswordHash;
	}

	public void SetAdmin(int Admin) {
		this.admin = Admin;
	}

	public void SetName(String name) {
		this.name = name;
	}

	public void SetMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}

	public void SetContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	// Getters
	public int GetUserID() {
		return this.userID;
	}
	
	public String GetEmail() {
		return this.email;
	}

	public String GetPassword() {
		return this.password;
	}
	
	public String GetSaltedPasswordHash() {
		if (this.saltedPasswordHash != null) {

			return this.saltedPasswordHash;
		} else {
			this.GenerateShadow();
			return this.saltedPasswordHash;
		}
	}

	public int GetAdmin() {
		return this.admin;
	}

	public String GetName() {
		return this.name;
	}

	public String GetMailingAddress() {
		return this.mailingAddress;
	}

	public String GetContactNumber() {
		return this.contactNumber;
	}

	// Generation
	public void GenerateShadow() {
		SecurePass PassShadow = new SecurePass(GetPassword());
		SetSaltedPasswordHash(PassShadow.getSaltedHash());
	}
}
