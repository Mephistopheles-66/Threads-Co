<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Threads.model.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("loggedUser");
    boolean loggedIn = (user != null);

    // Logout logic
    if ("logout".equals(request.getParameter("action"))) {
        session.invalidate();
        response.sendRedirect("home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Threads & Co.</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Home.css">
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<!-- Sidebar Navigation -->
<nav class="sidebar">
  <div class="logo">Threads & Co.</div>
  <ul>
    <li><a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a></li>
    <div id="menu-items" class="collapsed">
          <li><a href="Products.jsp"><i class="fas fa-box"></i> Products</a></li>
        <li><a href="sizechart.jsp"><i class="fas fa-ruler-combined"></i> Size Guide</a></li>
        <li><a href="brandvision.jsp"><i class="fas fa-lightbulb"></i> Brand Vision</a></li>
        <li><a href="Foundation.jsp"><i class="fas fa-hands-helping"></i> Foundation</a></li>
        <li><a href="Terms.jsp"><i class="fas fa-file-contract"></i> Terms</a></li>
        <li><a href="shippingprices.jsp"><i class="fas fa-truck"></i> Shipping Prices</a></li>
    </div>
  </ul>
</nav>

<!-- Top Right Buttons -->
<div class="top-right">
  <a href="cart.jsp" class="btn"><i class="fas fa-shopping-cart"></i> Cart</a>

  <% if (loggedIn) { %>
    <a href="cart.jsp" class="btn"><i class="fas fa-user-circle"></i> <%= user.getFirstName() %></a>
    <a href="?action=logout"><button class="btn"><i class="fas fa-sign-out-alt"></i> Logout</button></a>
  <% } else { %>
    <a href="<%= request.getContextPath() %>/login.jsp"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="<%= request.getContextPath() %>/Register.jsp"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  <% } %>
</div>
