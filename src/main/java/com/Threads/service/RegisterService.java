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
 * Service class for user registration operations
 */
public class RegisterService {

    /**
     * Register a new user
     *
     * @param user The user model with registration details
     * @return true if registration was successful, false otherwise
     */
    public boolean registerUser(UserModel user) throws Exception {
        String query = "INSERT INTO User (Role, UserName, UserPassword, FirstName, LastName, Email, PhoneNumber, Address) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Dbconfig.getDbConnection();

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getRole());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, hashPassword(user.getUserPassword()));
            pstmt.setString(4, user.getFirstName());
            pstmt.setString(5, user.getLastName());
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getPhoneNumber());
            pstmt.setString(8, user.getAddress());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("UserName")) {
                throw new Exception("Username already exists");
            } else if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("Email")) {
                throw new Exception("Email already exists");
            } else {
                throw new Exception("Database error during registration: " + e.getMessage());
            }
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
            }
        }
    }

    /**
     * Check if a username already exists
     *
     * @param username The username to check
     * @return true if username exists, false otherwise
     */
    public boolean isUsernameExists(String username) throws Exception {
        String query = "SELECT COUNT(*) FROM User WHERE UserName = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Dbconfig.getDbConnection();

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

            return false;

        } catch (SQLException e) {
            throw new Exception("Error checking username availability: " + e.getMessage());
        } finally {
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
     * Check if an email already exists
     *
     * @param email The email to check
     * @return true if email exists, false otherwise
     */
    public boolean isEmailExists(String email) throws Exception {
        String query = "SELECT COUNT(*) FROM User WHERE Email = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Dbconfig.getDbConnection();

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

            return false;

        } catch (SQLException e) {
            throw new Exception("Error checking email availability: " + e.getMessage());
        } finally {
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
            byte[] hash = digest.digest(password.getBytes("UTF-8"));

            // Convert to hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException | java.io.UnsupportedEncodingException e) {
            System.err.println("Error hashing password: " + e.getMessage());
            // In production, you might want to throw an exception here instead
            return password; // Fallback to plain password if hashing fails
        }
    }

    /**
     * Verify a password against a hashed password
     *
     * @param plainPassword The plain text password
     * @param hashedPassword The hashed password from database
     * @return true if passwords match, false otherwise
     */
    public boolean verifyPassword(String plainPassword, String hashedPassword) {
        String hashedInput = hashPassword(plainPassword);
        return hashedInput.equals(hashedPassword);
    }
}