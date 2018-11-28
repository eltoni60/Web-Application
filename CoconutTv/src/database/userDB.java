 package database;

import java.sql.*;
import java.util.*;
import classes.*;
import database.favoritesDB;

//import the package.(name of the class that is being used)
public class userDB {
	private static Connection con = null;
	private static PreparedStatement dbQuery;

	private static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
			return con;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public static void updateUser(List<Users> changedUser) throws SQLException {
		getConnection();
		String userInfo = "update users set user1=?, user2=?, user3=?, where accountID=?";

		dbQuery = con.prepareStatement(userInfo);

		dbQuery.setString(1, changedUser.get(0).getUsername());
		dbQuery.setString(2, changedUser.get(1).getUsername());
		dbQuery.setString(3, changedUser.get(2).getUsername());
		dbQuery.setInt(4, changedUser.get(0).getAccountID());
		dbQuery.executeUpdate();
	}

	public static void addUser(List<Users> addedUser) throws SQLException {
		getConnection();
		String userInfo= "Insert into Users (user1,user2,user3) values (?,?,?), where accountID=?";
				
		dbQuery = con.prepareStatement(userInfo);
		
		dbQuery.setString(1, addedUser.get(0).getUsername());
		dbQuery.setString(2, addedUser.get(1).getUsername());
		dbQuery.setString(3, addedUser.get(2).getUsername());
		dbQuery.setInt(4, addedUser.get(0).getAccountID());
		dbQuery.executeUpdate();
		
		
	}
	
	public static void deleteUser(String userColumn, int accountID) throws SQLException {
		getConnection();
		String deleteUser = "Delete from ? where accountID = ?";
		dbQuery = con.prepareStatement(deleteUser);
		dbQuery.setString(1, userColumn);
		dbQuery.setInt(2, accountID);
		dbQuery.executeUpdate();
		
		//String deleteFavorites= "Delete from favorites where userID = ?";
		//dbQuery = con.prepareStatement(deleteFavorites);
		//dbQuery.setString(1,user );
		//dbQuery.executeUpdate();
		
	}
	
	public static String getUserTest(int accountID) throws SQLException{
		getConnection();
		String select= "Select * from users where accountID=?";
		dbQuery=con.prepareStatement(select);
		dbQuery.setInt(1, accountID);
		ResultSet rset = dbQuery.executeQuery();
		rset.next();
		String name = rset.getString(2);
		return name;
	}
	
	//Changing the database to store the userID's instead of the usernames to make searching for them much easier
	public static List<Users> getUserList(int accountID) throws SQLException {
		getConnection();
		List<Users> userList = new ArrayList<Users>();
		String select = "select * from users where accountID = ?";
		dbQuery = con.prepareStatement(select);
		dbQuery.setInt(1,  accountID);
		ResultSet rset = dbQuery.executeQuery();
		//Each user in the table will hold the userID and not the username
		String[] userNum = new String[]{"user1", "user2", "user3"};
		if (rset.next()) {
			for(int i = 0; i < 3; i++) {
				userList.add(favoritesDB.getUsersObj(rset.getInt(userNum[i])));
			}
		
		
		}
		return userList;
	}

}
