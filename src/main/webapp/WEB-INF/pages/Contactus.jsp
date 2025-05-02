<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - Threads & Co.</title>

  <!-- Stylesheets -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Contactus.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <li><a href="#"><i class="fas fa-box"></i> Products</a></li>
        <li><a href="#"><i class="fas fa-ruler-combined"></i> Size Guide</a></li>
        <li><a href="#"><i class="fas fa-lightbulb"></i> Brand Vision</a></li>
        <li><a href="#"><i class="fas fa-hands-helping"></i> Foundation</a></li>
        <li><a href="#"><i class="fas fa-file-contract"></i> Terms</a></li>
        <li><a href="#"><i class="fas fa-truck"></i> Shipping Prices</a></li>
      </div>
    </ul>
  </nav>

  <!-- Top Right Buttons -->
  <div class="top-right">
    <button class="btn"><i class="fas fa-shopping-cart"></i> Cart</button>
    <a href="login.html"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="register.html"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  </div>

  <!-- Contact Section -->
  <section class="contact-section">
    <div class="contact-box">
      <div class="contact-form">
        <h2>Contact Us</h2>
        <p>Feel free to contact us anytime.</p>
        <input type="text" placeholder="Name" />
        <input type="email" placeholder="Email" />
        <textarea placeholder="Message"></textarea>
        <button>Send</button>
      </div>

      <div class="contact-info">
        <h3>Info</h3>
        <p><i class="fas fa-envelope"></i> <a href="#">threads&co@gmail.com</a></p>
        <p><i class="fas fa-phone"></i> +977-9846382661</p>
        <p><i class="fas fa-clock"></i> 10:00 A.M - 7:00 P.M</p>
        <p><i class="fas fa-map-marker-alt"></i> Newroad, Kathmandu</p>

        <div class="socials">
          <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
          <a href="#" class="social-icon"><i class="fab fa-tiktok"></i></a>
        </div>
      </div>
    </div>
  </section>

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
