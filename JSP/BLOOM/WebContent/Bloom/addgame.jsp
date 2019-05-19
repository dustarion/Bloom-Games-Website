<%@page import ="java.sql.*"%>
<% 
try {
	String gameTitle = request.getParameter("gameTitle");
	String Company = request.getParameter("Company");
	String releaseDate = request.getParameter("releaseDate");
	String description = request.getParameter("description");
	int price = Integer.parseInt(request.getParameter("price"));
	String imageLocation = request.getParameter("imageLocation");
	String preOwned = request.getParameter("preOwned");
	String trailerLocation = request.getParameter("trailerLocation");
	String purchaseLocation = request.getParameter("purchaseLocation");
	int creatorID = Integer.parseInt(request.getParameter("creatorID"));
	
	
 // Step1: Load JDBC Driver
 Class.forName("com.mysql.jdbc.Driver");
 
 // Step 2: Define Connection URL
 String connURL ="jdbc:mysql://localhost/bloom?user=root&password=han12345&serverTimezone=UTC"; 

 // Step 3: Establish connection to URL
 Connection conn = DriverManager.getConnection(connURL); 

 // Step 4: Create Statement object
 //Statement stmt = conn.createStatement();

 // Step 5: Execute SQL Command
 String sqlStr = "INSERT into games(gameTitle,Company,releaseDate,description,price,imageLocation,preOwned,trailerLocation,purchaseLocation,creatorID)values(?,?,?,?,?,?,?,?,?,?)";
 PreparedStatement pstmt = conn.prepareStatement(sqlStr);
 
 pstmt.setString(1, gameTitle);
 pstmt.setString(2, Company);
 pstmt.setString(3, releaseDate);
 pstmt.setString(4,description);
 pstmt.setInt(5,price);
 pstmt.setString(6,imageLocation);
 pstmt.setString(7,preOwned);
 pstmt.setString(8,trailerLocation);
 pstmt.setString(9,purchaseLocation);
 pstmt.setInt(10,creatorID);
 
 
 
 int count = pstmt.executeUpdate();

 // Step 6: Process Result
 if(count > 0){
		out.println("Records updated!");
	}else{
		out.println("Did not update records");
	}
 
 // Step 7: Close connection
 conn.close();
 } catch (Exception e) {
 System.err.println("Error :" + e);
 }
 
 %>