package db;

import java.sql.Connection;
import java.sql.ResultSet;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class UserLoginDAOImpl implements UserLoginDAO {
	SqlDAO DBSQL;
	Connection con;

	public UserLoginDAOImpl(SqlDAO DB) {
		DBSQL = DB;
		con = DBSQL.GetConnectionObj();
	}

	public UserLoginDAOImpl() {
		DBSQL = new SqlDAOImpl();
		con = DBSQL.GetConnectionObj();
	}

	public void CloseConnection() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// Login
	public boolean Login(String email, String password) {
		try {
			ResultSet rs;
			ValidationUtils Check = new ValidationUtils();
			if (Check.checkEmail(email)) {
				System.out.println("Valid Email");
				
				// Check if email exists in DB
				ResultSet rsemail = DBSQL.SelectSQL("SELECT * from users WHERE email = ?", email);
				
				if (rsemail.next()) {
					// Email Exists
					// Get the User with the matching Email
					rs = DBSQL.SelectSQL("SELECT * from users WHERE userID = ?", rsemail.getObject("userid"));
				} else {
					return false;
				}
			} else {
				rs = DBSQL.SelectSQL("SELECT * from users WHERE email = ?", email);
			}
			
			// User Exists, now check password.
			if (rs.next()) {
				String encpassword = rs.getString("password");
				SecurePass crypto = new SecurePass(password, encpassword);
				if (crypto.getSaltedHash().contentEquals("true")) {
					return true;
				} else {
					System.out.println("not match");
					return false;
				}
			} else {
				System.out.println("nothing returned");
				return false;
			}
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
			return false;
		}
	}

	// Get the User Data
	public UserLogin GetUserDetails(int userID) {
		try {
			UserLogin temp = new UserLogin();
			ResultSet rs = DBSQL.SelectSQL("SELECT * FROM users WHERE userID = ?", userID);
			if (rs.next()) {
				temp.SetUserID(userID);
				temp.SetEmail(rs.getString("email"));
				temp.SetAdmin(rs.getInt("admin"));
				
				// Password not sent for security reasons.
			}
			
			ResultSet rs1 = DBSQL.SelectSQL("SELECT * FROM user_data WHERE userid = ?", userID);

			if (rs1.next()) {
				temp.SetName(rs1.getString("name"));
				temp.SetMailingAddress(rs1.getString("mailingAddress"));
				temp.SetContactNumber(rs1.getString("contactNumber"));
				return temp;
			} else {

				return null;
			}
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}

	public UserLogin GetUserDetails(String email) {
		try {
			UserLogin temp = new UserLogin();
			
			ResultSet rsemail;
			ResultSet rs;
		
			ValidationUtils Check = new ValidationUtils();
			if (Check.checkEmail(email)) {
				System.out.println("Valid Email");
				
				rsemail = DBSQL.SelectSQL("SELECT * from users WHERE email = ?", email);
				if (rsemail.next()) {
					rs = DBSQL.SelectSQL("SELECT * from user_data WHERE userID = ?", rsemail.getObject("userID"));
				} else {
					System.out.println("failed1");
					return null;
				}
			} else {
				System.out.println("failed2");
				return null;
			}
			int userid = -1;
			if (rs.next()) {
				userid = rs.getInt("userID");
				temp.SetUserID(rs.getInt("userID"));
				temp.SetEmail(email);
				temp.SetAdmin(rsemail.getInt("admin"));
			} else {
				System.out.println("RETURNING NOTHING" + email);
			}
			
			ResultSet rs1 = DBSQL.SelectSQL("SELECT * FROM user_data WHERE userid = ?", userid);

			if (rs1.next()) {

				temp.SetName(rs1.getString("name"));
				temp.SetMailingAddress(rs1.getString("mailingAddress"));
				temp.SetContactNumber(rs1.getString("contactNumber"));
				return temp;
			} else {
				System.out.println("Error, NULL Value");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// Check if a given email already exists in the DB
	public boolean CheckIfEmailAlreadyExists(String email) {
		return CheckDuplicate("email", email);
	}

	// Check if Field Already Exists is already registered
	public boolean CheckDuplicate(String Field, String Value) {
		try {
			String sql1 = "SELECT * FROM `users` WHERE `?` = ?";
			Object[] temp1 = { Field, Value };
			ResultSet rs1 = DBSQL.SelectSQL(sql1, temp1);
			if (rs1.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// User Signup
	public boolean AddUser(UserLogin RegistrationDetails) {
		try {
			UserLogin RD = RegistrationDetails;
			
			// Grab the Auto_increment ID for the next row that will be put in via database
			
//			RD.SetUserID(GetNextUserID());
//			System.out.print(RD.GetUserID());
			
			// Run a query to insert the registration in
			Object[] temp1 = { RD.GetEmail(), RD.GetSaltedPasswordHash(), RD.GetAdmin()};
			String sql1 = "INSERT INTO `users` (`userID`, `email`, `password`, `admin`) VALUES (NULL, ?, ?, ?)";
			boolean is1 = DBSQL.InsertSQL(sql1, temp1);
			
			if (is1) {
				
				// Insert User Data
				String sql2 = "INSERT INTO `user_data` (`userID`, `name`, `mailingAddress`, `contactNumber`) VALUES (LAST_INSERT_ID(), ?, ?, ?)";
				Object[] temp2 = {RD.GetName(), RD.GetMailingAddress(), RD.GetContactNumber() };
				return DBSQL.InsertSQL(sql2, temp2);

			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// Update a User's Info
	public boolean UpdateUserInfo(UserLogin UserDetails) {
		try {
			System.out.print(UserDetails);
			
			UserLogin UD = UserDetails;
			
			String sql1 = "UPDATE `user_data` SET `name` = ?, `mailingAddress` = ?, `contactNumber` = ? WHERE `user_data`.`userID` = ?";
			Object[] temp1 = { UD.GetName(), UD.GetMailingAddress(), UD.GetContactNumber(), UD.GetUserID() };
			return DBSQL.InsertSQL(sql1, temp1);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// Update Email
	public boolean UpdateEmail(UserLogin UserDetails) {
		try {
			UserLogin UD = UserDetails;
			String sql1 = "UPDATE `users` SET `email` = ? WHERE `users`.`userID` = ?";
			Object[] temp1 = { UD.GetEmail(), UD.GetUserID() };
			return DBSQL.InsertSQL(sql1, temp1);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
