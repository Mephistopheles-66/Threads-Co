<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Registration.css">
</head>
<body>

    <a href="${pageContext.request.contextPath}/home.jsp">>
        <div class="logo">Threads & Co.</div>
    </a>

    <div class="container">
        <h1>Register</h1>

        <form>

            <div class="form-row">
                <div class="form-group">
                    <label>Role:</label>
                    <input type="text" name="Role">
                </div>
                <div class="form-group">
                    <label>Username:</label>
                    <input type="text" name="username">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>First Name:</label>
                    <input type="text" name="firstName">
                </div>
                <div class="form-group">
                    <label>Last Name:</label>
                    <input type="text" name="lastName">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="Email">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Phone Number:</label>
                    <input type="tel" name="phone">
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" name="Address">
                </div>
            </div>

            <button type="submit" class="submit-btn">Submit</button>

        </form>
    </div>

</body>
</html>
