package com.Threads.service;

import com.Threads.Util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/registerService")
public class RegisterService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Connection getConnection() throws SQLException,
    ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3316/userdb";
        String user = "root";
        String pass = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("Role");
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String address = request.getParameter("Address");

        // Encrypt the password before storing it
        String encryptedPassword = PasswordUtil.encrypt(username, password);

        try (Connection conn = getConnection()) {
            String query = "INSERT INTO users (role, username,password, first_name, last_name, email, phone, address) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, role);
                stmt.setString(2, username);
                stmt.setString(3, encryptedPassword);
                stmt.setString(4, firstName);
                stmt.setString(5, lastName);
                stmt.setString(6, email);
                stmt.setString(7, phone);
                stmt.setString(8, address);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    request.setAttribute("error", "Registration failed.");

                    request.getRequestDispatcher("register.jsp").forward(request,response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
}