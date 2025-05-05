package com.Threads.controller;

import com.Threads.config.Dbconfig;
import com.Threads.Util.PasswordUtil;
import com.Threads.Util.ValidationUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 📥 Form Parameters
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("retype_password");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Part imagePart = request.getPart("profile_picture");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/register.jsp");

        // 🛡️ Validations
        if (ValidationUtil.isNullOrEmpty(role)) {
            request.setAttribute("status", "Role is required");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) {
            request.setAttribute("status", "Username must start with a letter and be alphanumeric");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("status", "Invalid email format");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            request.setAttribute("status", "Password must be at least 8 characters, include uppercase, number, and special character");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.doPasswordsMatch(password, confirmPassword)) {
            request.setAttribute("status", "Passwords do not match");
            dispatcher.forward(request, response);
            return;
        }

        if (ValidationUtil.isNullOrEmpty(firstName) || ValidationUtil.isNullOrEmpty(lastName)) {
            request.setAttribute("status", "First name and last name are required");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            request.setAttribute("status", "Invalid Nepalese phone number");
            dispatcher.forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidImageExtension(imagePart)) {
            request.setAttribute("status", "Invalid image file type (only JPG, JPEG, PNG, GIF allowed)");
            dispatcher.forward(request, response);
            return;
        }

        // 📦 DB Operation
        try (Connection con = Dbconfig.getDbConnection()) {

            // 🔍 Check username exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("status", "Username already exists");
                dispatcher.forward(request, response);
                return;
            }

            // 🔐 Encrypt password
            String encryptedPassword = PasswordUtil.encrypt(username, password);

            // 💾 Save to DB
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO users (role, username, password, first_name, last_name, email, phone, address) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );
            pst.setString(1, role);
            pst.setString(2, username);
            pst.setString(3, encryptedPassword);
            pst.setString(4, firstName);
            pst.setString(5, lastName);
            pst.setString(6, email);
            pst.setString(7, phone);
            pst.setString(8, address);

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.getSession().setAttribute("username", username);
                request.setAttribute("status", "Registration successful! You can now log in.");
            } else {
                request.setAttribute("status", "Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
