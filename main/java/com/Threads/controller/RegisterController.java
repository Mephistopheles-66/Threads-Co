package com.Threads.controller;

import com.Threads.config.Dbconfig;
import com.Threads.Util.PasswordUtil;
import com.Threads.Util.ValidationUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 📥 Form Parameters
        String Role = request.getParameter("Role");
        String UserName = request.getParameter("UserName");
        String UserPassword = request.getParameter("UserPassword");
        String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String Email = request.getParameter("Email");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String Address = request.getParameter("Address");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/register.jsp");

        // ✅ Validations
        if (ValidationUtil.isNullOrEmpty(Role)) {
            request.setAttribute("status", "Role is required");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isAlphanumericStartingWithLetter(UserName)) {
            request.setAttribute("status", "Username must start with a letter and be alphanumeric");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(Email)) {
            request.setAttribute("status", "Invalid email format");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(UserPassword)) {
            request.setAttribute("status", "Password must be at least 8 characters, include uppercase, number, and special character");
            dispatcher.forward(request, response);
            return;
        }

        if (ValidationUtil.isNullOrEmpty(FirstName) || ValidationUtil.isNullOrEmpty(LastName)) {
            request.setAttribute("status", "First name and last name are required");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(PhoneNumber)) {
            request.setAttribute("status", "Invalid Nepalese phone number");
            dispatcher.forward(request, response);
            return;
        }

        // ✅ DB Operation
        try (Connection con = Dbconfig.getDbConnection()) {

            if (con == null || con.isClosed()) {
                request.setAttribute("status", "Database connection error");
                dispatcher.forward(request, response);
                return;
            }

            // Check if username already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE UserName = ?");
            checkStmt.setString(1, UserName);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("status", "Username already exists");
                dispatcher.forward(request, response);
                return;
            }

            // Encrypt password
            String encryptedPassword = PasswordUtil.encrypt(UserName, UserPassword);

            // Insert user data
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO users (Role, UserName, UserPassword, FirstName, LastName, Email, PhoneNumber, Address) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );
            pst.setString(1, Role);
            pst.setString(2, UserName);
            pst.setString(3, encryptedPassword);
            pst.setString(4, FirstName);
            pst.setString(5, LastName);
            pst.setString(6, Email);
            pst.setString(7, PhoneNumber);
            pst.setString(8, Address);

            int rowCount = pst.executeUpdate();
            System.out.println("Inserted rows: " + rowCount); // Debug

            if (rowCount > 0) {
                request.getSession().setAttribute("UserName", UserName);
                request.setAttribute("status", "Registration successful! You can now log in.");
            } else {
                request.setAttribute("status", "Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace(); // Always log full exception
            request.setAttribute("status", "Server error: " + e.getMessage());
        }

        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
    }
}
