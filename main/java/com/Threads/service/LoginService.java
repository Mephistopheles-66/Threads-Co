package com.Threads.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Threads.config.Dbconfig;
import com.Threads.model.UserModel;

/**
 * Service class for handling login operations.
 * Connects to the database, verifies user credentials, and returns login status.
 */
public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes the database connection.
     */
    public LoginService() {
        try {
            dbConn = Dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Validates user credentials.
     *
     * @param userModel the UserModel object containing username and password
     * @return true if credentials are valid, false otherwise; null on DB error
     */
    public Boolean loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.err.println("Database connection failed.");
            return null;
        }

        final String query = "SELECT * FROM User WHERE username = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUserName());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("UserPassword");
                if (userModel.getUserPassword().equals(dbPassword)) {
                    // Load user details into the model
                    populateUserModel(userModel, rs);
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                dbConn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    /**
     * Populates userModel with additional data from the result set.
     *
     * @param userModel the UserModel to populate
     * @param rs        the ResultSet with user data
     * @throws SQLException if reading from ResultSet fails
     */
    private void populateUserModel(UserModel userModel, ResultSet rs) throws SQLException {
        userModel.setUserId(rs.getInt("user_id")); // Make sure this matches your DB column
        userModel.setRole(rs.getString("role"));
        userModel.setFirstName(rs.getString("first_name"));
        userModel.setLastName(rs.getString("last_name"));
        userModel.setEmail(rs.getString("email"));
        userModel.setPhoneNumber(rs.getString("phone_number"));
        userModel.setAddress(rs.getString("address"));
    }
}
