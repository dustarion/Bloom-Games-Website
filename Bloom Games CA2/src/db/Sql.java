package db;

import java.io.Serializable;

public class Sql implements Serializable {
	
	// SQL Database Settings
	String Username = "root";
	String Password = "12345";
	String MainDatabase = "db1";
	String Host = "localhost";
	String Port = "3306";

	public String GetDBUsername() {
		return this.Username;
	}

	public String GetPassword() {
		return this.Password;
	}

	public String GetMainDatabase() {
		return this.MainDatabase;
	}

	public String GetHost() {
		return this.Host;
	}

	public String GetPort() {
		return this.Port;
	}
}
