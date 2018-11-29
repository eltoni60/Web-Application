package database;

import java.sql.*;
import classes.*;

//import the package.(name of the class that is being used)
//make sure the Subscriber being passed as the parameter is one of the default values before you call this method
//Database only accepts one of three values 'silver', 'gold' or 'platinum' for level name default is silver
//Database only accepts one of three values 'active', 'canceled' or 'trial' for account status default is trial

public class subscriberDB {

	private static Connection con;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}

	public static Subscriber getSub(int accountID) throws SQLException {
		PreparedStatement dbQuery;
		String subInfo = "select * from subscriber where accountID = ?";
		String subCardInfo = "select * from card where accountID = ?";
		dbQuery = con.prepareStatement(subInfo);
		dbQuery.setInt(1, accountID);

		Subscriber sub = new Subscriber();
		Address subAdd = new Address();
		CreditCard subCard = new CreditCard();
		LoginCredentials subLogin = new LoginCredentials();

		ResultSet rset = dbQuery.executeQuery();
		rset.next();
		sub.setAccountID(accountID);
		sub.setLevelName(rset.getString(2));
		sub.setFirstName(rset.getString(3));
		sub.setLastName(rset.getString(4));

		subAdd.setLine1(rset.getString(5));
		subAdd.setLine2(rset.getString(6));
		subAdd.setCity(rset.getString(7));
		subAdd.setState(rset.getString(8));
		subAdd.setZip(rset.getString(9));

		sub.setAddress(subAdd);
		sub.setPhoneNumber(rset.getString(10));

		subLogin.setEmail(rset.getString(11));
		subLogin.setPassword(rset.getString(12));

		sub.setLoginInfo(subLogin);
		sub.setCreateDate(rset.getDate(13));
		sub.setAccountStatus(rset.getString(14));

		dbQuery = con.prepareStatement(subCardInfo);
		dbQuery.setInt(1, accountID);

		rset = dbQuery.executeQuery();
		rset.next();

		subCard.setCardID(rset.getInt(1));
		subCard.setCCV(rset.getInt(3));
		subCard.setCCNumber(rset.getString(4));
		subCard.setFirstName(rset.getString(5));
		subCard.setLastName(rset.getString(6));
		subCard.setExpYear(rset.getInt(7));
		subCard.setExpMonth(rset.getInt(8));
		subCard.setCCType(rset.getString(9));

		sub.setPaymentInfo(subCard);

		sub.setUserProfiles(userDB.getUserList(sub.getAccountID()));

		return sub;
	}

	public static void updateSubscriber(Subscriber changedSub) throws SQLException {
		PreparedStatement dbQuery;
		String personalInfo = "update subscriber set levelName = ?, firstName = ?, lastName = ?, phoneNumber = ?, emailAddress = ?, memberPassword = ?, accountStatus = ? where accountID = ?";
		String addressInfo = "update subscriber set billAddressLine1 = ?, billAddressLine2 = ?, billCity = ?, billState = ?, billZipCode = ? where accountID = ?";
		String cardInfo = "update card set creditCardCCV = ?, creditCardNumber = ?, cardHolderFristName = ?, cardHolderLastName = ?, expYear = ?, expMonth = ?, ccType = ? where accountID = ?";

		dbQuery = con.prepareStatement(personalInfo);

		dbQuery.setString(1, changedSub.getLevelName());
		dbQuery.setString(2, changedSub.getFirstName());
		dbQuery.setString(3, changedSub.getLastName());
		dbQuery.setString(4, changedSub.getPhoneNumber());
		dbQuery.setString(5, changedSub.getLoginInfo().getEmail());
		dbQuery.setString(6, changedSub.getLoginInfo().getPassword());
		dbQuery.setString(7, changedSub.getAccountStatus());
		dbQuery.setInt(8, changedSub.getAccountID());
		dbQuery.executeUpdate();

		dbQuery = con.prepareStatement(addressInfo);

		dbQuery.setString(1, changedSub.getAddress().getLine1());
		dbQuery.setString(2, changedSub.getAddress().getLine2());
		dbQuery.setString(3, changedSub.getAddress().getCity());
		dbQuery.setString(4, changedSub.getAddress().getState());
		dbQuery.setString(5, changedSub.getAddress().getZip());
		dbQuery.setInt(6, changedSub.getAccountID());
		dbQuery.executeUpdate();

		dbQuery = con.prepareStatement(cardInfo);

		dbQuery.setInt(1, changedSub.getPaymentInfo().getCCV());
		dbQuery.setString(2, changedSub.getPaymentInfo().getCCNumber());
		dbQuery.setString(3, changedSub.getPaymentInfo().getFirstName());
		dbQuery.setString(4, changedSub.getPaymentInfo().getLastName());
		dbQuery.setInt(5, changedSub.getPaymentInfo().getExpYear());
		dbQuery.setInt(6, changedSub.getPaymentInfo().getExpMonth());
		dbQuery.setString(7, changedSub.getPaymentInfo().getCCType());
		dbQuery.setInt(8, changedSub.getAccountID());
		dbQuery.executeUpdate();

		// Updates the user table using the userDB class
		userDB.updateUser(changedSub.getUserProfiles(), changedSub.getAccountID());

		// Updates the favorites table using the favoritesDB class
		for (int i = 0; i < changedSub.getUserProfiles().size(); i++) {
			favoritesDB.updateFavorites(changedSub.getUserProfiles().get(i));
		}

	}

	public static void addSubscriber(Subscriber addedSub) throws SQLException {
		PreparedStatement dbQuery;
		String subInfo = "Insert into subscriber (levelName, firstName, lastName, billAddressLine1, billAddressLine2, billCity, billState, billZipCode, phoneNumber, emailAddress, memberPassword, accountCreateDate, accountStatus) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String cardInfo = "Insert into card (accountID, creditCardCCV, creditcardNumber, cardholderfirstname, cardholderlastname, expyear,expmonth, cctype) values (?, ?, ?, ?, ?, ?, ?, ?)";

		dbQuery = con.prepareStatement(subInfo);
		java.util.Date today = new java.util.Date();

		dbQuery.setString(1, addedSub.getLevelName());
		dbQuery.setString(2, addedSub.getFirstName());
		dbQuery.setString(3, addedSub.getLastName());
		dbQuery.setString(4, addedSub.getAddress().getLine1());
		dbQuery.setString(5, addedSub.getAddress().getLine2());
		dbQuery.setString(6, addedSub.getAddress().getCity());
		dbQuery.setString(7, addedSub.getAddress().getState());
		dbQuery.setString(8, addedSub.getAddress().getZip());
		dbQuery.setString(9, addedSub.getPhoneNumber());
		dbQuery.setString(10, addedSub.getLoginInfo().getEmail());
		dbQuery.setString(11, addedSub.getLoginInfo().getPassword());
		dbQuery.setDate(12, new java.sql.Date(today.getTime()));
		dbQuery.setString(13, addedSub.getAccountStatus());
		dbQuery.executeUpdate();

		dbQuery = con.prepareStatement("select MAX(accountID) from subscriber");
		ResultSet rset = dbQuery.executeQuery();
		rset.next();
		addedSub.setAccountID(rset.getInt(1));

		dbQuery = con.prepareStatement(cardInfo);

		dbQuery.setInt(1, addedSub.getAccountID());
		dbQuery.setInt(2, addedSub.getPaymentInfo().getCCV());
		dbQuery.setString(3, addedSub.getPaymentInfo().getCCNumber());
		dbQuery.setString(4, addedSub.getPaymentInfo().getFirstName());
		dbQuery.setString(5, addedSub.getPaymentInfo().getLastName());
		dbQuery.setInt(6, addedSub.getPaymentInfo().getExpYear());
		dbQuery.setInt(7, addedSub.getPaymentInfo().getExpMonth());
		dbQuery.setString(8, addedSub.getPaymentInfo().getCCType());
		dbQuery.executeUpdate();
		
		for(int i = 0; i < addedSub.getUserProfiles().size();i++) {
			if(addedSub.getUserProfiles().get(i) != null) {
				favoritesDB.addFavorite(addedSub.getUserProfiles().get(i));	
			}
		}
		
		userDB.addUser(addedSub.getUserProfiles(), addedSub.getAccountID());

	}

	public static void deleteSubsriber(int accountID) throws SQLException {
		PreparedStatement dbQuery;
		String deleteRow = "Delete from Subscriber where accountID = ?";
		dbQuery = con.prepareStatement(deleteRow);
		dbQuery.setInt(1, accountID);
		dbQuery.executeUpdate();

	}

	public static void updateStatus(Subscriber statusChange) throws SQLException {
		PreparedStatement dbQuery;
		String updateStatusStr = "Update subscriber set accountStatus = ? where accountID = ?";
		dbQuery = con.prepareStatement(updateStatusStr);
		dbQuery.setString(1, statusChange.getAccountStatus());
		dbQuery.setInt(2, statusChange.getAccountID());
		dbQuery.executeUpdate();
	}

	public static void updateLevel(Subscriber levelChange) throws SQLException {
		PreparedStatement dbQuery;
		String updateLevelStr = "Update subscriber set levelName = ? where accountID = ?";
		dbQuery = con.prepareStatement(updateLevelStr);
		dbQuery.setString(1, levelChange.getLevelName());
		dbQuery.setInt(2, levelChange.getAccountID());
		dbQuery.executeUpdate();
	}

	public static int loginCheck(String email, String password) throws SQLException {
		PreparedStatement dbQuery;
		String test = "Select accountID from Subscriber where emailAddress = ? and memberPassword = ?";
		dbQuery = con.prepareStatement(test);
		dbQuery.setString(1, email);
		dbQuery.setString(2, password);

		ResultSet rset = dbQuery.executeQuery();
		if (rset.next()) {
			return rset.getInt("accountid");
		} else {
			return -1;
		}
	}
}
