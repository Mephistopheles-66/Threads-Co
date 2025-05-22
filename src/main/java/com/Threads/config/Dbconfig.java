package com.Threads.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconfig {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/threadsco";
    private static final String JDBC_USER = "root";  // replace with your MySQL username
    private static final String JDBC_PASSWORD = "";  // replace with your MySQL password

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method for ProductService
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }
    
    // Method for LoginService
    public static Connection getDbConnection() throws SQLException {
        return getConnection();
    }
}