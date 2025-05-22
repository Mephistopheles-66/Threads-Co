<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Our Foundation | Threads & Co.</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Georgia, serif;
      background-color: #ede9d6;
      color: #2c2c2c;
    }

    .sidebar {
      position: fixed;
      top: 30px;
      left: 30px;
      width: 200px;
      padding: 20px;
      z-index: 2;
    }

    .sidebar .logo {
      color: rgb(0, 0, 0);
      font-size: 25px;
      font-weight: bold;
      margin-bottom: 50px;
      cursor: pointer;
      text-align: center;
    }

    .sidebar ul {
      list-style: none;
    }

    .sidebar ul li {
      margin: 20px 0;
    }

    .sidebar ul li a {
      text-decoration: none;
      color: rgba(0, 0, 0, 0.8);
      font-size: 20px;
      font-weight: 400;
      display: flex;
      align-items: center;
      gap: 20px;
      padding: 5px;
      border-radius: 10px;
      transition: all 0.3s ease;
    }

    .sidebar ul li a:hover {
      transform: translateX(5px);
    }

    .collapsed {
      display: none;
    }

    .top-right {
      position: absolute;
      top: 30px;
      right: 30px;
    }

    .btn {
      background: transparent;
      border: none;
      color: rgb(0, 0, 0);
      cursor: pointer;
      margin-left: 10px;
      font-size: 20px;
    }

    .btn i {
      color: rgb(0, 0, 0);
      font-size: 16px;
    }

    .btn:hover {
      color: rgb(162, 157, 99);
    }

    .foundation-container {
      padding: 200px 20px;
      max-width: 1100px;
      margin: auto;
    }

    .foundation-top {
      background-color: #c8d6b9;
      border-radius: 20px;
      padding: 32px;
      margin-bottom: 40px;
      text-align: center;
      margin-left: 50px;
    }

    .foundation-top h2 {
      font-size: 28px;
      margin-bottom: 16px;
    }

    .foundation-top p {
      font-size: 16px;
      line-height: 1.6;
    }

    .foundation-bottom {
      display: flex;
      justify-content: space-between;
      gap: 24px;
      flex-wrap: wrap;
      margin-left: 50px;
    }

    .box {
      background-color: #c8d6b9;
      border-radius: 20px;
      padding: 24px;
      flex: 1 1 45%;
    }

    .box h3 {
      font-size: 20px;
      margin-bottom: 12px;
    }

    .box p {
      font-size: 15px;
      line-height: 1.6;
    }

    .footer {
      background: #cfdcc3;
      display: flex;
      justify-content: space-around;
      padding: 32px 16px;
      flex-wrap: wrap;
      font-size: 14px;
    }

    .footer h4 {
      margin-bottom: 8px;
    }

    .footer p {
      margin: 4px 0;
    }

    .footer i {
      margin-right: 6px;
    }

    .copyright {
      width: 100%;
      text-align: center;
      padding-top: 16px;
    }
  </style>
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
    <button class="btn"><i class="fas fa-shopping-cart"></i> Cart</button>
    <a href="login.html"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="register.html"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  </div>

  <!-- Main Content -->
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

  <!-- JavaScript -->
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
