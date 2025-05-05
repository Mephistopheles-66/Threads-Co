<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

  <!-- Sidebar Navigation -->
  <nav class="sidebar">
    <div class="logo">Threads & Co.</div>
    <ul>
      <li>
        <a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a>
      </li>
      <div id="menu-items" class="collapsed">
        <li><a href="${pageContext.request.contextPath}/Products.jsp"><i class="fas fa-box"></i> Products</a></li>
        <li><a href="#"><i class="fas fa-lightbulb"></i> Brand Vision</a></li>
        <li><a href="#"><i class="fas fa-hands-helping"></i> Foundation</a></li>
        <li><a href="#"><i class="fas fa-file-contract"></i> Terms</a></li>
        <li><a href="#"><i class="fas fa-truck"></i> </a></li>
      </div>
    </ul>
  </nav>

  <!-- Top Right Buttons -->
  <div class="top-right">
    <button class="btn"><i class="fas fa-shopping-cart"></i> Cart</button>
    <a href="login.jsp"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="${pageContext.request.contextPath}/Register.jsp"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  </div>

  <header class="header">
    <div class="search-bar">
      <input type="text" placeholder="Search products..." />
    </div>
  </header>

  <section class="hero">
  	<img src="${pageContext.request.contextPath}/Resources/images/model1.jpg" alt="Model1" class ="hero-img">
    <div class="hero-text">
      <h2>Make your <br />Fashion <br />look</h2>
      <p>More Charming</p>
      <a href="${pageContext.request.contextPath}/Products.jsp"><button>Explore</button></a>
    </div>
    <img src="${pageContext.request.contextPath}/Resources/images/model2.jpg" alt="Model 2" class ="hero-img">
  </section>

  <footer class="footer">
    <div class="footer-column">
      <h3>Threads & Co.</h3>
      <p><strong>📍</strong> Newroad, Kathmandu</p>
      <p><strong>📞</strong> +977-9841965381</p>
      <p><strong>✉️</strong> threadsnco@gmail.com</p>
    </div>
    <div class="footer-column">
      <h4>Quick Links</h4>
      <a href="#">About Us</a>
      <a href="#">Contact Us</a>
    </div>
    <div class="footer-column">
      <h4>Our Services</h4>
      <a href="#">Privacy Policy</a>
      <a href="#">Exchange & Refund</a>
      <a href="#">Terms & Condition</a>
    </div>
  </footer>

  <div class="copyright">
    COPYRIGHT © 2025 Threads & Co | All Rights Reserved
  </div>

  <script>
    const menuToggle = document.getElementById("menu-toggle");
    const menuItems = document.getElementById("menu-items");

    menuToggle.addEventListener("click", (e) => {
      e.preventDefault();
      menuItems.classList.toggle("collapsed");
    });
  </script>
</body>
</html>
