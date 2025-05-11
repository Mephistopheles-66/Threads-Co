<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Product Details</title>
  
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Cotton T-Shirt.css">
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

  <!-- Sidebar Navigation -->
  <nav class="sidebar">
    <div class="logo">Threads & Co.</div>
    <ul>
      <li><a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a></li>
      <div id="menu-items" class="collapsed">
        <li><a href="product.html"><i class="fas fa-box"></i> Products</a></li>
        <li><a href="#"><i class="fas fa-ruler-combined"></i> Size Guide</a></li>
        <li><a href="Brandvision.html"><i class="fas fa-lightbulb"></i> Brand Vision</a></li>
        <li><a href="Foundation.html"><i class="fas fa-hands-helping"></i> Foundation</a></li>
        <li><a href="terms.html"><i class="fas fa-file-contract"></i> Terms</a></li>
      </div>
    </ul>
  </nav>

  <!-- Top Right Buttons -->
  <div class="top-right">
    <button class="btn"><i class="fas fa-shopping-cart"></i> Cart</button>
    <a href="login.html"><button class="btn"><i class="fas fa-sign-in-alt"></i> Login</button></a>
    <a href="register.html"><button class="btn"><i class="fas fa-user"></i> Register</button></a>
  </div>

  <header class="header">
    <div class="search-bar">
      <input type="text" placeholder="Search products..." />
    </div>
  </header>

  <main class="product-detail-container">
    <div class="product-detail">
      <div class="product-images">
        <div class="main-image">
        	<img src="${pageContext.request.contextPath}/Resources/Photos/t-shirt.png" alt="Cotton T-Shirt" id="main-product-image">
        </div>
      </div>

      <div class="product-info">
        <h1>Cotton T-Shirt</h1>
        <p class="product-price">$24.99</p>

        <div class="product-options">
          <div class="option-section">
            <h3>Color</h3>
            <div class="color-options">
              <button class="color-option black active" data-color="Black"></button>
              <button class="color-option white" data-color="White"></button>
              <button class="color-option beige" data-color="Beige"></button>
            </div>
            <span class="selected-option" id="selected-color">Black</span>
          </div>

          <div class="option-section">
            <h3>Size</h3>
            <div class="size-options">
              <button class="size-option" data-size="XS">XS</button>
              <button class="size-option" data-size="S">S</button>
              <button class="size-option active" data-size="M">M</button>
              <button class="size-option" data-size="L">L</button>
              <button class="size-option" data-size="XL">XL</button>
            </div>
            <span class="selected-option" id="selected-size">M</span>
            <a href="#" class="size-guide">Size Guide</a>
          </div>

          <div class="quantity-section">
            <h3>Quantity</h3>
            <div class="quantity-selector">
              <button class="quantity-btn" id="decrease">-</button>
              <input type="number" id="quantity" value="1" min="1" max="10">
              <button class="quantity-btn" id="increase">+</button>
            </div>
          </div>
        </div>

        <div class="product-actions">
          <button class="add-to-cart"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
          <button class="wishlist"><i class="far fa-heart"></i></button>
        </div>
      </div>
    </div>

    <div class="product-tabs">
      <div class="tab-buttons">
        <button class="tab-btn active" data-tab="description">Description</button>
        <button class="tab-btn" data-tab="details">Details</button>
      </div>

      <div class="tab-content">
        <div class="tab-pane active" id="description">
          <p>Our Cotton T-Shirt is the epitome of casual comfort and style. Made from 100% organic cotton, this versatile t-shirt features a classic fit that's flattering for all body types. The breathable fabric ensures all-day comfort, making it perfect for everyday wear.</p>
          <p>This essential piece can be easily dressed up or down, pairing perfectly with jeans for a casual look or under a blazer for something more polished. Available in multiple colors, our Cotton T-Shirt is a wardrobe staple you'll reach for again and again.</p>
        </div>

        <div class="tab-pane" id="details">
          <h3>Product Details</h3>
          <ul>
            <li>100% organic cotton</li>
            <li>Medium weight (180 gsm)</li>
            <li>Crew neck</li>
            <li>Short sleeves</li>
            <li>Regular fit</li>
            <li>Pre-shrunk</li>
            <li>Machine washable</li>
          </ul>

          <h3>Size & Fit</h3>
          <p>Model is 6'0" / 183 cm tall and wearing size M</p>

          <h3>Care Instructions</h3>
          <p>Machine wash cold with similar colors. Tumble dry low. Do not bleach.</p>
        </div>
      </div>
    </div>

    <div class="related-products">
      <h2>You May Also Like</h2>
      <div class="product-carousel">
        <div class="product-card">
          <a href="product_detail.html">
            <img src="/api/placeholder/200/250" alt="V-Neck T-Shirt" />
            <div class="product-info">
              <h3>V-Neck T-Shirt</h3>
              <p class="price">$29.99</p>
            </div>
          </a>
        </div>

        <div class="product-card">
          <a href="product_detail.html">
            <img src="/api/placeholder/200/250" alt="Long Sleeve Tee" />
            <div class="product-info">
              <h3>Long Sleeve Tee</h3>
              <p class="price">$34.99</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </main>

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
    // Menu toggle functionality
    const menuToggle = document.getElementById("menu-toggle");
    const menuItems = document.getElementById("menu-items");

    menuToggle.addEventListener("click", (e) => {
      e.preventDefault();
      menuItems.classList.toggle("collapsed");
    });

    // Color selection
    const colorOptions = document.querySelectorAll(".color-option");
    colorOptions.forEach(option => {
      option.addEventListener("click", () => {
        colorOptions.forEach(btn => btn.classList.remove("active"));
        option.classList.add("active");
        document.getElementById("selected-color").textContent = option.getAttribute("data-color");
      });
    });

    // Size selection
    const sizeOptions = document.querySelectorAll(".size-option");
    sizeOptions.forEach(option => {
      option.addEventListener("click", () => {
        sizeOptions.forEach(btn => btn.classList.remove("active"));
        option.classList.add("active");
        document.getElementById("selected-size").textContent = option.getAttribute("data-size");
      });
    });

    // Quantity selector
    const quantityInput = document.getElementById("quantity");
    const decreaseBtn = document.getElementById("decrease");
    const increaseBtn = document.getElementById("increase");

    decreaseBtn.addEventListener("click", () => {
      if (quantityInput.value > 1) {
        quantityInput.value = parseInt(quantityInput.value) - 1;
      }
    });

    increaseBtn.addEventListener("click", () => {
      if (quantityInput.value < 10) {
        quantityInput.value = parseInt(quantityInput.value) + 1;
      }
    });

    // Tab functionality
    const tabButtons = document.querySelectorAll(".tab-btn");
    const tabPanes = document.querySelectorAll(".tab-pane");

    tabButtons.forEach(button => {
      button.addEventListener("click", () => {
        tabButtons.forEach(btn => btn.classList.remove("active"));
        tabPanes.forEach(pane => pane.classList.remove("active"));

        button.classList.add("active");
        const tabId = button.getAttribute("data-tab");
        document.getElementById(tabId).classList.add("active");
      });
    });
  </script>
</body>
</html>
