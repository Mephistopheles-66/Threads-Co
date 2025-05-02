package com.Threads.controller;

import com.Threads.service.RegisterService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Register controller handles registration form submission and database insertion.
 */
@WebServlet(urlPatterns = { "/Registration" })
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final RegisterService registerService = new RegisterService();

    public Register() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/Registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String validationMessage = validateRegistrationForm(request);
            if (validationMessage != null) {
                handleError(request, response, validationMessage);
                return;
            }

            // Extract user data from the form
            String role = request.getParameter("Role");
            String username = request.getParameter("UserName");
            String password = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phoneNumber");
            String address = request.getParameter("Address");
            
            boolean isRegistered = registerService.registerUser(role, username, password, firstName, lastName, email, phone, address);

            if (isRegistered) {
                handleSuccess(request, response, "Registration successful!", "/WEB-INF/pages/RegistrationSuccess.jsp");
            } else {
                handleError(request, response, "Registration failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            handleError(request, response, "An error occurred during registration. Please try again.");
        }
    }

    private String validateRegistrationForm(HttpServletRequest request) {
        String role = request.getParameter("Role");
        String username = request.getParameter("UserName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("Address");

        if (role == null || role.isEmpty()) return "Role is required.";
        if (username == null || username.isEmpty()) return "Username is required.";
        if (password == null || password.isEmpty()) return "Password is required.";
        if (firstName == null || firstName.isEmpty()) return "First name is required.";
        if (lastName == null || lastName.isEmpty()) return "Last name is required.";
        if (email == null || email.isEmpty()) return "Email is required.";
        if (phoneNumber == null || phoneNumber.isEmpty()) return "Phone number is required.";
        if (address == null || address.isEmpty()) return "Address is required.";

        return null;
    }

    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(redirectPage).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);

        // Preserve form data
        req.setAttribute("Role", req.getParameter("Role"));
        req.setAttribute("UserName", req.getParameter("UserName"));
        req.setAttribute("UserPassword", req.getParameter("UserPassword"));
        req.setAttribute("firstName", req.getParameter("firstName"));
        req.setAttribute("lastName", req.getParameter("lastName"));
        req.setAttribute("email", req.getParameter("email"));
        req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
        req.setAttribute("Address", req.getParameter("Address"));

        req.getRequestDispatcher("/WEB-INF/pages/Registration.jsp").forward(req, resp);
    }
}