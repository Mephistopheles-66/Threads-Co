<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Remove JSTL tag for now since it might be causing the issue --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Threads & Co.</title>
    <!-- Google Fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Registration.css">
</head>
<body>
    <a href="${pageContext.request.contextPath}/home">
        <div class="logo">Threads & Co.</div>
    </a>

    <div class="container">
        <h1>Create Your Account</h1>

        <!-- Show registration status message without JSTL -->
        <% if(request.getAttribute("status") != null) { 
            String status = (String)request.getAttribute("status");
            String className = status.contains("successful") ? "success" : "";
        %>
            <div class="status-message <%= className %>">
                <%= status %>
            </div>
        <% } %>

        <form id="registerForm" method="POST" action="${pageContext.request.contextPath}/register">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" name="FirstName" id="firstName" placeholder="Enter first name" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" name="LastName" id="lastName" placeholder="Enter last name" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="Email" id="email" placeholder="Enter email address" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="UserName" id="username" placeholder="Choose username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="UserPassword" id="password" placeholder="Create password" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" name="PhoneNumber" id="phone" placeholder="Enter phone number" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select name="Role" id="role" required>
                        <option value="">Select Role</option>
                        <option value="customer">Customer</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" name="Address" id="address" placeholder="Enter your address" required>
            </div>

            <button type="submit" class="submit-btn">Create Account</button>
            
            <div class="login-link">
                Already have an account? <a href="${pageContext.request.contextPath}/login">Sign In</a>
            </div>
        </form>
    </div>

    <!-- JavaScript for form validation -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('registerForm');
            
            form.addEventListener('submit', function(e) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();
                const email = document.getElementById('email').value.trim();
                const phone = document.getElementById('phone').value.trim();
                
                // Basic email validation
                const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (!emailPattern.test(email)) {
                    e.preventDefault();
                    alert('Please enter a valid email address');
                    return;
                }
                
                // Basic phone validation
                const phonePattern = /^[0-9]{10}$/;
                if (!phonePattern.test(phone)) {
                    e.preventDefault();
                    alert('Please enter a valid 10-digit phone number');
                    return;
                }
                
                // Password should be at least 6 characters
                if (password.length < 6) {
                    e.preventDefault();
                    alert('Password must be at least 6 characters long');
                    return;
                }
            });
        });
    </script>
</body>
</html>