package com.Threads.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Threads.model.UserModel;
import com.Threads.service.RegisterService;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private RegisterService registerService;

    public void init() {
        registerService = new RegisterService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String role = request.getParameter("role");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        UserModel user = new UserModel(role, userName, userPassword, firstName, lastName, email, phoneNumber, address);

        try {
            boolean isRegistered = registerService.registerUser(user);
            if (isRegistered) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
        }

        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }
}
