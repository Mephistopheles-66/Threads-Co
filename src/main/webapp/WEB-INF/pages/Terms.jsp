<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Terms & Conditions | Threads & Co.</title>

  <!-- Stylesheets -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Terms.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

  <!-- Header -->
  <header class="header">
    <div class="logo">Threads & Co.</div>
    <div class="header-links">
      <span><i class="fas fa-shopping-cart"></i> Cart</span>
      <a href="login.html"><i class="fas fa-sign-in-alt"></i> Login</a>
      <a href="register.html"><i class="fas fa-user-plus"></i> Sign Up</a>
    </div>
  </header>

  <!-- Sidebar Navigation -->
  <nav class="sidebar">
    <ul>
      <li>
        <a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a>
      </li>
      <div id="menu-items" class="collapsed">
        <li><a href="#"><i class="fas fa-box"></i> Products</a></li>
        <li><a href="#"><i class="fas fa-ruler-combined"></i> Size Guide</a></li>
        <li><a href="#"><i class="fas fa-lightbulb"></i> Brand Vision</a></li>
        <li><a href="#"><i class="fas fa-hands-helping"></i> Foundation</a></li>
        <li><a href="#"><i class="fas fa-file-contract"></i> Terms</a></li>
        <li><a href="#"><i class="fas fa-truck"></i> Shipping Prices</a></li>
      </div>
    </ul>
  </nav>

  <!-- Terms & Conditions -->
  <main class="terms-container">
    <h1>Terms & Condition</h1>
    <div class="terms-intro">
      Welcome to Thread&Co. These Terms and Conditions outline the rules and
      regulations for the use of our website and services. By accessing or
      using our website, you agree to accept and follow these terms.
    </div>

    <section class="terms-grid">
      <div class="terms-box green">
        <h2>1. General Use:</h2>
        <ul>
          <li>You must be at least 18 years old to place an order or create an account.</li>
          <li>You agree not to misuse our site or interfere with its functionality.</li>
          <li>All content on this site is owned by Thread&Co. and may not be used without permission.</li>
        </ul>
      </div>

      <div class="terms-box brown">
        <h2>2. Products & Pricing:</h2>
        <ul>
          <li>We strive to ensure all product details, descriptions, and prices are accurate.</li>
          <li>Prices may change without prior notice.</li>
          <li>Product availability is not guaranteed and may be limited or discontinued.</li>
        </ul>
      </div>

      <div class="terms-box brown">
        <h2>3. Payments:</h2>
        <ul>
          <li>We accept secure online payments through <strong>eSewa</strong>, <strong>Khalti</strong>.</li>
          <li>All payments must be made in full before dispatch.</li>
        </ul>
      </div>

      <div class="terms-box green">
        <h2>4. Returns & Refunds:</h2>
        <ul>
          <li>Returns are accepted within 3 days of delivery, if the product is unused and in original condition.</li>
          <li>Refunds are processed after the returned product is received and approved.</li>
        </ul>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer class="footer">
    <div>
      <h4>Threads & Co.</h4>
      <p>
        <i class="fas fa-location-dot"></i> Newroad, Kathmandu<br />
        <i class="fas fa-phone"></i> +977-9841963581<br />
        <i class="fas fa-envelope"></i> threadsnco@gmail.com
      </p>
    </div>

    <div>
      <h4>Quick Links</h4>
      <p>About Us</p>
      <p>Contact Us</p>
    </div>

    <div>
      <h4>Our Services</h4>
      <p>Privacy Policy</p>
      <p>Exchange & Refund</p>
      <p>Terms & Condition</p>
    </div>

    <p class="copyright">
      COPYRIGHT © 2025 Threads & Co | All Rights Reserved
    </p>
  </footer>

  <!-- Script -->
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
