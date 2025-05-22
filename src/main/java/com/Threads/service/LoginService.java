package com.Threads.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Threads.config.Dbconfig;
import com.Threads.model.UserModel;
import com.Threads.Util.PasswordUtil; // ✅ Use hashing

public class LoginService {

    public UserModel validateUser(String username, String password) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        UserModel user = null;

        try {
            conn = Dbconfig.getDbConnection();

            String sql = "SELECT * FROM User WHERE UserName = ? AND UserPassword = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            // ✅ hash the password before checking against DB
            String hashedPassword = PasswordUtil.hashPassword(password);
            stmt.setString(2, hashedPassword);

            rs = stmt.executeQuery();

            if (rs.next()) {
                user = new UserModel();
                user.setUserId(rs.getInt("UserID"));
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setUserPassword(rs.getString("UserPassword"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setAddress(rs.getString("Address"));
            }

        } catch (Exception e) {
            throw new Exception("Error validating user: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return user;
    }
}
