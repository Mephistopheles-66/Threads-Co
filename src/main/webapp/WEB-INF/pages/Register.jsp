<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Threads & Co.</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Registration.css">
</head>
<body>

    <a href="${pageContext.request.contextPath}/home.jsp">
        <div class="logo">Threads & Co.</div>
    </a>

    <div class="container">
        <h1>Create Your Account</h1>

        <!-- Show registration status message -->
        <c:if test="${not empty status}">
            <div class="status-message">${status}</div>
        </c:if>

        <form method="POST" action="${pageContext.request.contextPath}/register">

            <div class="form-row">
                <div class="form-group">
                    <label for="role">Role:</label>
                    <input type="text" name="Role" id="role" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="UserName" id="username" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="UserPassword" id="password" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" name="FirstName" id="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" name="LastName" id="lastName" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="Email" id="email" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" name="PhoneNumber" id="phone" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" name="Address" id="address" required>
                </div>
            </div>

            <button type="submit" class="submit-btn">Register</button>
        </form>
    </div>

</body>
</html>
