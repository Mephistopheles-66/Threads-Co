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
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserModel user = new UserModel();
        user.setUserName(username);
        user.setUserPassword(password);

        Boolean isValidUser = loginService.loginUser(user);

        if (isValidUser != null && isValidUser) {
          
            user.setUserId(1); 
            user.setRole("user"); 

            SessionUtil.setAttribute(req, "username", user.getUserName());
            SessionUtil.setAttribute(req, "userId", user.getUserId());
            CookieUtil.addCookie(resp, "role", user.getRole(), 5 * 30);

            if ("admin".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
        }
    }
}