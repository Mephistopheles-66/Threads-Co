<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Our Foundation | Threads & Co.</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Foundation.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
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


    <main class="foundation-container">
      <section class="foundation-top">
        <h2>Our Foundation</h2>
        <p>
          Founded with a vision to redefine how men shop for clothes, Thread&Co.
          brings together a wide collection of styles — from laid-back casuals
          to sharp formals, from active athleisure to authentic traditional wear
          — all under one digital roof.
        </p>
      </section>

      <section class="foundation-bottom">
        <div class="box">
          <h3>Our Quality Promise</h3>
          <p>
            At Thread&Co., we believe style should never come at the cost of
            quality. Every piece we create is designed to bring confidence,
            comfort, and timeless style to your wardrobe. From everyday wear to
            standout outfits, our promise is simple — clothing that feels as
            good as it looks.
          </p>
        </div>

        <div class="box">
          <h3>Proudly Made in Nepal</h3>
          <p>
            We're committed not only to great clothing — but to making a
            difference. Since launching, we’ve focused on growing and
            manufacturing in Nepal to support local talent and uplift our
            communities. By choosing Thread&Co., you’re supporting a brand
            that’s proud to be part of Nepal’s fashion movement — one that
            values quality, people, and purpose.
          </p>
        </div>
      </section>
    </main>

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