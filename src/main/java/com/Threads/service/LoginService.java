package com.Threads.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.Threads.config.Dbconfig;
import com.Threads.model.UserModel;

/**
 * Service class for login-related operations
 */
public class LoginService {
    
    /**
     * Authenticate a user
     * 
     * @param username The username
     * @param password The password (plain text)
     * @return UserModel if authentication successful, null otherwise
     */
    public UserModel loginUser(String username, String password) {
        String query = "SELECT * FROM User WHERE UserName = ?";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            try {
                conn = Dbconfig.getDbConnection();
                System.out.println("Database connection successful for login!");
            } catch (ClassNotFoundException | SQLException e) {
                System.err.println("Database connection error in LoginService: " + e.getMessage());
                e.printStackTrace();
                return null;
            }
            
            // Prepare and execute statement
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String storedPassword = rs.getString("UserPassword");
                
                // Verify password
                if (verifyPassword(password, storedPassword)) {
                    UserModel user = new UserModel();
                    user.setUserId(rs.getInt("UserID"));
                    user.setRole(rs.getString("Role"));
                    user.setUserName(rs.getString("UserName"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setAddress(rs.getString("Address"));
                    return user;
                }
            }
            
            return null; // Authentication failed
            
        } catch (SQLException e) {
            System.err.println("Database error in login: " + e.getMessage());
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
    
    /**
     * Hash a password using SHA-256
     * 
     * @param password The plain text password
     * @return The hashed password
     */
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes());
            
            // Convert to hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            System.err.println("Error hashing password: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Verify a password
     * 
     * @param inputPassword The plain text password input
     * @param storedPassword The stored hashed password
     * @return true if password matches, false otherwise
     */
    private boolean verifyPassword(String inputPassword, String storedPassword) {
        String hashedInput = hashPassword(inputPassword);
        return hashedInput != null && hashedInput.equals(storedPassword);
    }
    
    /**
     * Get user by ID
     * 
     * @param userId The user ID
     * @return UserModel if found, null otherwise
     */
    public UserModel getUserById(int userId) {
        String query = "SELECT * FROM User WHERE UserID = ?";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            conn = Dbconfig.getDbConnection();
            
            // Prepare and execute statement
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setUserId(rs.getInt("UserID"));
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setAddress(rs.getString("Address"));
                return user;
            }
            
            return null; // User not found
            
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error getting user by ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
}