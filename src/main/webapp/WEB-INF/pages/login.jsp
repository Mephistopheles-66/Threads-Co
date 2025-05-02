<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/login.css">
</head>
<body>
	<div class="login-box">
	<a href="<%= request.getContextPath() %>/pages/home.jsp"><div class="logo">Threads & Co.</div></a>
    <form>
        <h3>Login</h3>
        <img src="">

        <label for="username">Username</label>
        <input type="text" placeholder="Email" id="username">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password">

        <button>Log In</button>
        
    </form>
</body>
</html>