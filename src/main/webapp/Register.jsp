<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Threads & Co.</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><g fill="%23ffffff" fill-opacity="0.05"><circle cx="30" cy="30" r="4"/></g></svg>') repeat;
            animation: float 20s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 800px;
            position: relative;
            z-index: 1;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .logo {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #666;
            font-size: 1.1rem;
            font-weight: 400;
        }

        .form-container {
            position: relative;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .form-group {
            position: relative;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 0.95rem;
        }

        .input-wrapper {
            position: relative;
        }

        input, select {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 18px;
            pointer-events: none;
        }

        .submit-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .message {
            padding: 15px 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: slideIn 0.5s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .footer-links {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #e1e5e9;
        }

        .footer-links a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .floating-shapes {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .shape1 {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation: float1 6s ease-in-out infinite;
        }

        .shape2 {
            width: 120px;
            height: 120px;
            top: 70%;
            right: 10%;
            animation: float2 8s ease-in-out infinite;
        }

        .shape3 {
            width: 60px;
            height: 60px;
            bottom: 20%;
            left: 20%;
            animation: float3 7s ease-in-out infinite;
        }

        @keyframes float1 {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        @keyframes float2 {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(20px) rotate(-180deg); }
        }

        @keyframes float3 {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-15px) rotate(90deg); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 25px;
                margin: 10px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .logo {
                font-size: 2rem;
            }

            input, select {
                padding: 12px 15px;
            }

            .submit-btn {
                padding: 15px;
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 10px;
            }

            .container {
                padding: 25px 20px;
            }
        }

        /* Custom select styling */
        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6,9 12,15 18,9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 20px;
            cursor: pointer;
        }

        /* Loading animation for form submission */
        .loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .loading .submit-btn::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape shape1"></div>
        <div class="shape shape2"></div>
        <div class="shape shape3"></div>
    </div>

    <div class="container">
        <div class="header">
            <div class="logo">Threads & Co.</div>
            <div class="subtitle">Create your account and join our fashion community</div>
        </div>

        <%
        String message = "";
        String messageType = "";
        
        if (request.getParameter("submit") != null) {
            String role = request.getParameter("role");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            // Basic validation
            if (role == null || role.trim().isEmpty() || 
                userName == null || userName.trim().isEmpty() ||
                userPassword == null || userPassword.trim().isEmpty() ||
                firstName == null || firstName.trim().isEmpty() ||
                lastName == null || lastName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phoneNumber == null || phoneNumber.trim().isEmpty() ||
                address == null || address.trim().isEmpty()) {
                
                message = "All fields are required!";
                messageType = "error";
            } else if (userPassword.length() < 6) {
                message = "Password must be at least 6 characters long!";
                messageType = "error";
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/threadsco", "root", "");
                    
                    // Check if username or email already exists
                    String checkSql = "SELECT COUNT(*) FROM User WHERE UserName = ? OR Email = ?";
                    PreparedStatement checkPs = conn.prepareStatement(checkSql);
                    checkPs.setString(1, userName);
                    checkPs.setString(2, email);
                    ResultSet rs = checkPs.executeQuery();
                    
                    if (rs.next() && rs.getInt(1) > 0) {
                        message = "Username or email already exists!";
                        messageType = "error";
                    } else {
                        String sql = "INSERT INTO User (Role, UserName, UserPassword, FirstName, LastName, Email, PhoneNumber, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        ps.setString(1, role);
                        ps.setString(2, userName);
                        ps.setString(3, userPassword); // In production, hash this password
                        ps.setString(4, firstName);
                        ps.setString(5, lastName);
                        ps.setString(6, email);
                        ps.setString(7, phoneNumber);
                        ps.setString(8, address);

                        int result = ps.executeUpdate();
                        if (result > 0) {
                            message = "Registration successful! Welcome to Threads & Co.";
                            messageType = "success";
                        } else {
                            message = "Registration failed. Please try again.";
                            messageType = "error";
                        }
                        ps.close();
                    }
                    rs.close();
                    checkPs.close();
                    conn.close();
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                    messageType = "error";
                }
            }
        }
        %>

        <div class="form-container">
            <% if (!message.isEmpty()) { %>
                <div class="message <%= messageType %>">
                    <i class="fas <%= messageType.equals("success") ? "fa-check-circle" : "fa-exclamation-triangle" %>"></i>
                    <%= message %>
                </div>
            <% } %>

            <form method="post" id="registrationForm">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="firstName">
                            <i class="fas fa-user"></i> First Name *
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="firstName" name="firstName" required 
                                   placeholder="Enter your first name"
                                   value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>">
                            <i class="fas fa-user input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="lastName">
                            <i class="fas fa-user"></i> Last Name *
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="lastName" name="lastName" required 
                                   placeholder="Enter your last name"
                                   value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>">
                            <i class="fas fa-user input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userName">
                            <i class="fas fa-at"></i> Username *
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="userName" name="userName" required 
                                   placeholder="Choose a unique username"
                                   value="<%= request.getParameter("userName") != null ? request.getParameter("userName") : "" %>">
                            <i class="fas fa-at input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userPassword">
                            <i class="fas fa-lock"></i> Password *
                        </label>
                        <div class="input-wrapper">
                            <input type="password" id="userPassword" name="userPassword" required 
                                   placeholder="Create a strong password (min 6 chars)">
                            <i class="fas fa-lock input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label for="email">
                            <i class="fas fa-envelope"></i> Email Address *
                        </label>
                        <div class="input-wrapper">
                            <input type="email" id="email" name="email" required 
                                   placeholder="Enter your email address"
                                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                            <i class="fas fa-envelope input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">
                            <i class="fas fa-phone"></i> Phone Number *
                        </label>
                        <div class="input-wrapper">
                            <input type="tel" id="phoneNumber" name="phoneNumber" required 
                                   placeholder="Enter your phone number"
                                   value="<%= request.getParameter("phoneNumber") != null ? request.getParameter("phoneNumber") : "" %>">
                            <i class="fas fa-phone input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="role">
                            <i class="fas fa-user-tag"></i> Role *
                        </label>
                        <select id="role" name="role" required>
                            <option value="">Select your role</option>
                            <option value="customer" <%= "customer".equals(request.getParameter("role")) ? "selected" : "" %>>Customer</option>
                            <option value="admin" <%= "admin".equals(request.getParameter("role")) ? "selected" : "" %>>Admin</option>
                        </select>
                    </div>

                    <div class="form-group full-width">
                        <label for="address">
                            <i class="fas fa-map-marker-alt"></i> Address *
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="address" name="address" required 
                                   placeholder="Enter your complete address"
                                   value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>">
                            <i class="fas fa-map-marker-alt input-icon"></i>
                        </div>
                    </div>
                </div>

                <button type="submit" name="submit" value="Register" class="submit-btn">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </form>

            <div class="footer-links">
                Already have an account? <a href="login.jsp">Sign in here</a>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('registrationForm');
            const submitBtn = form.querySelector('.submit-btn');

            // Add loading state on form submission
            form.addEventListener('submit', function(e) {
                submitBtn.classList.add('loading');
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creating Account...';
            });

            // Enhanced form validation
            const inputs = form.querySelectorAll('input, select');
            inputs.forEach(input => {
                input.addEventListener('blur', validateField);
                input.addEventListener('input', clearValidation);
            });

            function validateField(e) {
                const field = e.target;
                const value = field.value.trim();

                // Remove previous validation
                clearValidation(e);

                if (field.hasAttribute('required') && !value) {
                    showFieldError(field, 'This field is required');
                    return false;
                }

                // Specific validations
                switch(field.type) {
                    case 'email':
                        if (value && !isValidEmail(value)) {
                            showFieldError(field, 'Please enter a valid email address');
                            return false;
                        }
                        break;
                    case 'password':
                        if (value && value.length < 6) {
                            showFieldError(field, 'Password must be at least 6 characters');
                            return false;
                        }
                        break;
                    case 'tel':
                        if (value && !isValidPhone(value)) {
                            showFieldError(field, 'Please enter a valid phone number');
                            return false;
                        }
                        break;
                }

                showFieldSuccess(field);
                return true;
            }

            function clearValidation(e) {
                const field = e.target;
                field.style.borderColor = '#e1e5e9';
                const existingError = field.parentNode.parentNode.querySelector('.field-error');
                if (existingError) {
                    existingError.remove();
                }
            }

            function showFieldError(field, message) {
                field.style.borderColor = '#dc3545';
                const errorDiv = document.createElement('div');
                errorDiv.className = 'field-error';
                errorDiv.style.color = '#dc3545';
                errorDiv.style.fontSize = '0.85rem';
                errorDiv.style.marginTop = '5px';
                errorDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i> ' + message;
                field.parentNode.parentNode.appendChild(errorDiv);
            }

            function showFieldSuccess(field) {
                field.style.borderColor = '#28a745';
            }

            function isValidEmail(email) {
                return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
            }

            function isValidPhone(phone) {
                return /^[\+]?[1-9][\d]{0,15}$/.test(phone.replace(/\s/g, ''));
            }

            // Auto-hide success messages
            const successMessage = document.querySelector('.message.success');
            if (successMessage) {
                setTimeout(() => {
                    successMessage.style.opacity = '0';
                    setTimeout(() => {
                        successMessage.remove();
                    }, 300);
                }, 3000);
            }
        });
    </script>
</body>
</html>