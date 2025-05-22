package com.Threads.controller;

import com.Threads.model.UserModel;
import com.Threads.service.LoginService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginService loginService;

    @Override
    public void init() throws ServletException {
        loginService = new LoginService();
    }

    // Show login form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // Process login
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserModel user = loginService.validateUser(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", user);
                
                // Check user role - modify this based on how role is stored in your UserModel
                if ("admin".equals(user.getRole())) {
                    // For admin users - using forward instead of redirect to access WEB-INF
                    request.getRequestDispatcher("/WEB-INF/pages/Admin/dashboard.jsp").forward(request, response);
                } else {
                    // For regular users
                    response.sendRedirect("home.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}