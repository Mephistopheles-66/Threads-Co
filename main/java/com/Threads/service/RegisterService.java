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

        String Role = request.getParameter("Role");
        String UserName = request.getParameter("UserName");
        String UserPassword = request.getParameter("UserPassword");
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String Email = request.getParameter("Email");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String Address = request.getParameter("Address");

        // Encrypt the password before storing it
        String encryptedPassword = PasswordUtil.encrypt(UserName, UserPassword);

        try (Connection conn = getConnection()) {
            String query = "INSERT INTO user (Role, UserName, UserPassword, FirstName, LastName, Email, PhoneNumber, Address) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, Role);
                stmt.setString(2, UserName);
                stmt.setString(3, encryptedPassword);
                stmt.setString(4, FirstName);
                stmt.setString(5, LastName);
                stmt.setString(6, Email);
                stmt.setString(7, PhoneNumber);
                stmt.setString(8, Address);

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