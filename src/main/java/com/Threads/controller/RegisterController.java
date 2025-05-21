package com.Threads.controller;

import com.Threads.model.UserModel;
import com.Threads.service.RegisterService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to Register.jsp in the ROOT directory (not WEB-INF/pages)
        request.getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Extract form parameters
        String role = request.getParameter("Role");
        String userName = request.getParameter("UserName");
        String userPassword = request.getParameter("UserPassword");
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("PhoneNumber");
        String address = request.getParameter("Address");
        
        // Validate required fields
        if (userName == null || userName.trim().isEmpty() ||
            userPassword == null || userPassword.trim().isEmpty() ||
            firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            phoneNumber == null || phoneNumber.trim().isEmpty() ||
            address == null || address.trim().isEmpty() ||
            role == null || role.trim().isEmpty()) {
            
            request.setAttribute("status", "Please fill all the required fields");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }
        
        // Create user model
        UserModel user = new UserModel();
        user.setRole(role);
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        try {
            // Validate username and email uniqueness
            if (registerService.isUsernameExists(userName)) {
                request.setAttribute("status", "Username already exists. Please choose another one.");
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            
            if (registerService.isEmailExists(email)) {
                request.setAttribute("status", "Email already registered. Please use another email.");
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            
            // Register the user
            if (registerService.registerUser(user)) {
                // Set success message in session for display after redirect
                request.getSession().setAttribute("registrationSuccess", "Registration successful! You can now log in.");
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            } else {
                request.setAttribute("status", "Registration failed. Please try again.");
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("status", "Error: " + e.getMessage());
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }
}