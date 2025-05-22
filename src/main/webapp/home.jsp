<%@ include file="header.jsp" %>

<!-- Hero Section -->
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

<!-- Products -->
<section class="products-section">
  <h2 class="section-title">Our Products</h2>
  <div class="products-grid">
    <div class="product-card">
      <img src="<%= request.getContextPath() %>/Resources/images/tshirt.png" />
      <h3>Classic Tee</h3>
      <p>$25.00</p>
      <button class="btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="<%= request.getContextPath() %>/Resources/images/Denim.png" />
      <h3>Denim Jacket</h3>
      <p>$60.00</p>
      <button class="btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="<%= request.getContextPath() %>/Resources/images/Hoodie.png" />
      <h3>Casual Hoodie</h3>
      <p>$45.00</p>
      <button class="btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="<%= request.getContextPath() %>/Resources/images/Pant.png" />
      <h3>Streetwear Pants</h3>
      <p>$40.00</p>
      <button class="btn">Add to Cart</button>
    </div>
  </div>
</section>

<!-- Store -->
<section class="our-store-section">
  <div class="store-content">
    <div class="store-text">
      <h2>Visit Our Store</h2>
      <p>Experience Threads & Co. in Newroad, Kathmandu.</p>
      <p><strong>📍 Address:</strong> Newroad, Kathmandu</p>
      <p><strong>🕒 Hours:</strong> Sun - Fri: 10 AM - 7 PM</p>
    </div>
    <div class="store-images">
      <div class="store-image"><img src="<%= request.getContextPath() %>/Resources/images/Store1.jpg" /></div>
      <div class="store-image"><img src="<%= request.getContextPath() %>/Resources/images/Store2.jpg" /></div>
      <div class="store-image"><img src="<%= request.getContextPath() %>/Resources/images/Store3.jpg" /></div>
    </div>
  </div>
</section>

<%@ include file="footer.jsp" %>
