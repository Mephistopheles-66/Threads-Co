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
        <li><a href="<%= request.getContextPath() %>/Products.jsp"><i class="fas fa-box"></i> Products</a></li>
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
    <a href="<%= request.getContextPath() %>/login.jsp"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="<%= request.getContextPath() %>/Register.jsp"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  </div>

  <header class="header">
    <div class="search-bar">
      <input type="text" placeholder="Search products..." />
    </div>
  </header>

  <section class="hero">
    <img src="<%= request.getContextPath() %>/Resources/images/model1.jpg" alt="Model 1" class="hero-img" />
    <div class="hero-text">
      <h2>Make your <br />Fashion <br />look</h2>
      <p>More Charming</p>
      <a href="<%= request.getContextPath() %>/Products.jsp"><button>Explore</button></a>
    </div>
    <img src="<%= request.getContextPath() %>/Resources/images/model2.jpg" alt="Model 2" class="hero-img" />
  </section>

  <!-- Featured Products Section -->
  <section class="products-section">
    <h2 class="section-title">Our Products</h2>
    <div class="products-grid">
      <div class="product-card">
        <img src="<%= request.getContextPath() %>/Resources/images/tshirt.png" alt="Product 1" />
        <h3>Classic Tee</h3>
        <p>$25.00</p>
        <button class="btn">Add to Cart</button>
      </div>
      <div class="product-card">
        <img src="<%= request.getContextPath() %>/Resources/images/Denim.png" alt="Product 2" />
        <h3>Denim Jacket</h3>
        <p>$60.00</p>
        <button class="btn">Add to Cart</button>
      </div>
      <div class="product-card">
        <img src="<%= request.getContextPath() %>/Resources/images/Hoodie.png" alt="Product 3" />
        <h3>Casual Hoodie</h3>
        <p>$45.00</p>
        <button class="btn">Add to Cart</button>
      </div>
      <div class="product-card">
        <img src="<%= request.getContextPath() %>/Resources/images/Pant.png" alt="Product 4" />
        <h3>Streetwear Pants</h3>
        <p>$40.00</p> 
        <button class="btn">Add to Cart</button>
      </div>
    </div>
  </section>

  <!-- Our Store Section -->
  <section class="our-store-section">
    <div class="store-content">
      <div class="store-text">
        <h2>Visit Our Store</h2>
        <p>
          Experience Threads & Co. in person at our flagship location in Newroad, Kathmandu. 
          Discover the latest trends, enjoy personalized styling, and feel the quality firsthand.
        </p>
        <p><strong>📍 Address:</strong> Newroad, Kathmandu</p>
        <p><strong>🕒 Hours:</strong> Sun - Fri: 10 AM - 7 PM</p>
      </div>
      <div class="store-images">
        <div class="store-image">
          <img src="<%= request.getContextPath() %>/Resources/images/Store1.jpg" alt="Store View 1" />
        </div>
        <div class="store-image">
          <img src="<%= request.getContextPath() %>/Resources/images/Store2.jpg" alt="Store View 2" />
        </div>
        <div class="store-image">
          <img src="<%= request.getContextPath() %>/Resources/images/Store3.jpg" alt="Store View 3" />
        </div>
      </div>
    </div>
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
      <a href="<%= request.getContextPath() %>/AboutUs.jsp">About Us</a>
      <a href="<%= request.getContextPath() %>/ContactUs.jsp">Contact Us</a>
    </div>
    <div class="footer-column">
      <h4>Our Services</h4>
      <a href="<%= request.getContextPath() %>/PrivacyPolicy.jsp">Privacy Policy</a>
      <a href="<%= request.getContextPath() %>/ExchangeRefund.jsp">Exchange & Refund</a>
      <a href="<%= request.getContextPath() %>/TermsConditions.jsp">Terms & Condition</a>
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
