<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Brand Vision - Threads & Co.</title>
  
  <!-- Google Fonts & Font Awesome -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: "Roboto", sans-serif;
      background-color: #f2e9e1;
      color: #1e1e1e;
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
      color: black;
      font-size: 25px;
      font-weight: bold;
      margin-bottom: 50px;
      cursor: pointer;
      text-align: center;
      font-family: "Playfair Display", serif;
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
      padding: 5px 5px;
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
      color: black;
      cursor: pointer;
      margin-left: 10px;
      font-size: 20px;
    }

    .btn i {
      font-size: 16px;
    }

    .btn:hover {
      color: rgb(162, 157, 99);
    }

    .main-content {
      margin-left: 220px;
      margin-right: 20px;
      padding-top: 80px;
    }

    .vision-section {
      background-color: #bfcfbe;
      border-radius: 15px;
      padding: 30px;
      margin-bottom: 40px;
      text-align: center;
    }

    .vision-section h1 {
      font-family: "Playfair Display", serif;
      font-size: 32px;
      margin-bottom: 20px;
    }

    .vision-section p {
      font-size: 18px;
      max-width: 800px;
      margin: 0 auto;
      line-height: 1.6;
    }

    .two-column {
      display: flex;
      justify-content: space-between;
      gap: 30px;
      margin-bottom: 40px;
    }

    .card {
      background-color: #bfcfbe;
      border-radius: 15px;
      padding: 25px;
      flex: 1;
    }

    .card h2 {
      font-family: "Playfair Display", serif;
      text-align: center;
      margin-bottom: 20px;
      font-size: 24px;
    }

    .card ul {
      list-style-type: none;
    }

    .card ul li {
      margin-bottom: 10px;
      padding-left: 20px;
      position: relative;
    }

    .card ul li:before {
      content: "•";
      position: absolute;
      left: 0;
    }

    .core-values {
      margin-top: 40px;
      margin-bottom: 40px;
    }

    .core-values h2 {
      font-family: "Playfair Display", serif;
      text-align: center;
      margin-bottom: 30px;
      font-size: 28px;
    }

    .values-container {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      gap: 20px;
    }

    .value-item {
      text-align: center;
      max-width: 250px;
    }

    .value-icon {
      width: 100px;
      height: 100px;
      background-color: white;
      border-radius: 50%;
      margin: 0 auto 15px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .value-icon i {
      font-size: 40px;
      color: #1e1e1e;
    }

    .value-item p {
      line-height: 1.5;
    }

    .footer {
      background-color: #d1d1c9;
      display: flex;
      justify-content: space-around;
      padding: 30px 20px;
      font-size: 14px;
      margin-top: 40px;
    }

    .footer-column {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .footer-column h3, .footer-column h4 {
      margin-bottom: 10px;
      font-family: "Playfair Display", serif;
    }

    .footer-column a {
      text-decoration: none;
      color: #1e1e1e;
    }

    .footer-column a:hover {
      text-decoration: underline;
    }

    .copyright {
      text-align: center;
      padding: 15px;
      background-color: #f2e9e1;
      font-size: 13px;
      color: #444;
    }

    @media (max-width: 768px) {
      .sidebar {
        width: 100%;
        position: relative;
        top: 0;
        left: 0;
        padding: 10px;
      }

      .main-content {
        margin-left: 0;
        margin-right: 0;
        padding: 20px;
      }

      .two-column {
        flex-direction: column;
      }

      .top-right {
        position: relative;
        text-align: right;
        margin-bottom: 20px;
      }

      .values-container {
        flex-direction: column;
        align-items: center;
      }
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
  <div class="main-content">
    <div class="vision-section">
      <h1>Brand Vision</h1>
      <p>At Thread&Co., our vision is to become a leading online destination for men's fashion — where style
      meets simplicity, and every man can find clothes that reflect who he is.</p>
    </div>

    <div class="two-column">
      <div class="card">
        <h2>Brand Values:</h2>
        <ul>
          <li>Quality over quantity</li>
          <li>Simplicity and style</li>
          <li>Ethical sourcing and fair trade</li>
          <li>Customer-first mindset</li>
          <li>Continuous learning and innovation</li>
        </ul>
      </div>

      <div class="card">
        <h2>Future Plans:</h2>
        <ul>
          <li>Adding new collections</li>
          <li>Launching a mobile app</li>
          <li>Partnering with local designers</li>
          <li>International shipping</li>
        </ul>
      </div>
    </div>

    <div class="core-values">
      <h2>Our Core Values:</h2>
      <div class="values-container">
        <div class="value-item">
          <div class="value-icon"><i class="fas fa-handshake"></i></div>
          <p>Build a culture where fashion meets passion and connection.</p>
        </div>
        <div class="value-item">
          <div class="value-icon"><i class="fas fa-lightbulb"></i></div>
          <p>Redefine trends, set new standards, and lead the game.</p>
        </div>
        <div class="value-item">
          <div class="value-icon"><i class="fas fa-globe"></i></div>
          <p>Stay true, be original, and embrace individuality.</p>
        </div>
      </div>
    </div>
  </div>

  <footer class="footer">
    <div class="footer-column">
      <h3>Threads & Co.</h3>
      <p><strong>📍</strong> Newroad, Kathmandu</p>
      <p><strong>📞</strong> +977-9841965381</p>
      <p><strong>✉</strong> threadsnco@gmail.com</p>
    </div>
    <div class="footer-column">
      <h4>Quick Links</h4>
      <a href="AboutUs.html">About Us</a>
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
    COPYRIGHT ©️ 2025 Threads & Co | All Rights Reserved
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
