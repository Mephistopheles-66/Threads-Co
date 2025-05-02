package com.Threads.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Threads.config.Dbconfig;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

public class RegisterService {

    private Connection dbConn;

    public RegisterService() { 
        try {
            this.dbConn = Dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public boolean registerUser(String role, String username, String password, String firstName, String lastName,
                                String email, String phone, String address) {

        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        String query = "INSERT INTO User (Role, UserName, UserPassword, FirstName, LastName, Email, PhoneNumber, Address) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, role); // Usually "user"
            stmt.setString(2, username);
            stmt.setString(3, password);
            stmt.setString(4, firstName);
            stmt.setString(5, lastName);
            stmt.setString(6, email);
            stmt.setString(7, phone);
            stmt.setString(8, address);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
