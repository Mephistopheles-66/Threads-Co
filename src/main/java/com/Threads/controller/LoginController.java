package com.Threads.controller;

import jakarta.servlet.ServletException;
import com.Threads.Util.CookieUtil;
import com.Threads.Util.SessionUtil;
import com.Threads.model.UserModel;
import com.Threads.service.LoginService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if there's a success message from registration
        if (request.getSession().getAttribute("registrationSuccess") != null) {
            request.setAttribute("success", request.getSession().getAttribute("registrationSuccess"));
            request.getSession().removeAttribute("registrationSuccess");
        }
        
        // IMPORTANT: Use the direct path to login.jsp
        // This was likely causing the infinite recursion
        try {
            // Direct forward to login.jsp in the root directory
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Error forwarding to login.jsp: " + e.getMessage());
            response.getWriter().println("Error loading login page. Please check server logs.");
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            
            // Basic validation
            if (username == null || username.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                
                req.setAttribute("error", "Please enter both username and password");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
                return;
            }
    
            UserModel user = loginService.loginUser(username, password);
    
            if (user != null) {
                // Set session attributes
                SessionUtil.setAttribute(req, "username", user.getUserName());
                SessionUtil.setAttribute(req, "userId", user.getUserId());
                SessionUtil.setAttribute(req, "userRole", user.getRole());
                
                // Set role cookie
                CookieUtil.addCookie(resp, "role", user.getRole(), 5 * 30);
    
                // Redirect based on role - Use sendRedirect, not forward
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    resp.sendRedirect(req.getContextPath() + "/Dashboard");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/home");
                }
            } else {
                req.setAttribute("error", "Invalid username or password");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("Error in login process: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "System error: " + e.getMessage());
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}