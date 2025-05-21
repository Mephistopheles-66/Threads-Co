<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Threads & Co.</title>
    <!-- Google Fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="login-box">
        <a href="${pageContext.request.contextPath}/home">
            <div class="logo">Threads & Co.</div>
        </a>
        
        <form action="${pageContext.request.contextPath}/login" method="post">
            <h3>Welcome Back</h3>
            
            <% if(request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <% if(request.getAttribute("success") != null) { %>
                <div class="success-message" style="color: #4CAF50; margin: 10px 0; text-align: center;">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>
            
            <label for="username">Username</label>
            <input type="text" placeholder="Enter your username" id="username" name="username" required>
            
            <label for="password">Password</label>
            <input type="password" placeholder="Enter your password" id="password" name="password" required>
            
            <button type="submit">Sign In</button>
            
            <p style="text-align: center; margin-top: 20px;">
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Create Account</a>
            </p>
        </form>
    </div>
    
    <!-- Optional JavaScript for form validation -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            
            form.addEventListener('submit', function(e) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();
                
                if (username === '' || password === '') {
                    e.preventDefault();
                    alert('Please enter both username and password');
                }
            });
        });
    </script>
</body>
</html>