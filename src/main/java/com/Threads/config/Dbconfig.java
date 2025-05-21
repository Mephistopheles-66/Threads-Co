package com.Threads.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconfig {
    private static final String DB_NAME = "threadsco";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
        try {
            // Load the driver explicitly using Class.forName
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create the connection
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
            // Test the connection
            if (conn != null && !conn.isClosed()) {
                System.out.println("Database connection successful!");
                return conn;
            } else {
                throw new SQLException("Failed to establish database connection.");
            }
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found! Add the MySQL connector JAR to your project.");
            throw e;
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            throw e;
        }
    }
}