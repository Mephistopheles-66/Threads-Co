<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Threads & Co. | Add Product</title>

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/view/CSS/admindashboard.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet" />
</head>
<body>

  <!-- Sidebar -->
  <nav class="sidebar">
    <ul>
      <li><a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a></li>
      <div id="menu-items" class="collapsed">
        <li><a href="${pageContext.request.contextPath}/adminDashboard"><i class="fas fa-lightbulb"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/viewProductList"><i class="fas fa-box"></i> Products List</a></li>
        <li><a href="${pageContext.request.contextPath}/showOrders"><i class="fas fa-ruler-combined"></i> Recent Orders</a></li>
        <li style="background-color: #4414a4;">
          <a href="${pageContext.request.contextPath}/addProductForm" style="color: white;"><i class="fas fa-shopping-cart"></i> Add New Product</a>
        </li>
      </div>
    </ul>
  </nav>

  <!-- Header -->
  <header class="admin-header">
    <div class="header-left">Threads & Co.</div>
    <div class="header-center">Add New Product</div>
    <div class="header-right-notification"><i class="fas fa-bell notification-icon"></i></div>
    <div class="header-right-user">
      <a href="${pageContext.request.contextPath}/adminLogout" class="user-link"><i class="fas fa-user user-icon"></i></a>
    </div>
  </header>

  <!-- Main Content -->
  <main style="margin-left: 230px; padding: 20px;">
    <section class="add-product-section">
      <h2>Add New Product</h2>
      <form class="add-product-form"
            action="${pageContext.request.contextPath}/AddProduct"
            method="post"
            enctype="multipart/form-data">

        <label for="productId">Product ID</label>
        <input type="text" id="productId" name="ProductID" placeholder="Enter product ID" required />

        <label for="productName">Product Name</label>
        <input type="text" id="productName" name="ProductName" placeholder="Enter product name" required />

        <label for="productCategory">Category</label>
        <input type="text" id="productCategory" name="ProductCategory" placeholder="Enter product category" required />

        <label for="productDescription">Description</label>
        <textarea id="productDescription" name="ProductDescription" placeholder="Enter product description" rows="4" required></textarea>

        <label for="productPrice">Price</label>
        <input type="number" step="0.01" id="productPrice" name="ProductPrice" placeholder="Enter price" required />

        <label for="productStock">Stock Quantity</label>
        <input type="number" id="productStock" name="ProductStockQuantity" placeholder="Enter stock quantity" required />

        <label for="productSize">Size</label>
        <input type="text" id="productSize" name="ProductSize" placeholder="Enter size (e.g., S, M, L)" required />

        <label for="productImage">Upload Image</label>
        <input type="file" id="productImage" name="ProductImage" accept="image/*" />

        <button type="submit" class="btn-submit">Add Product</button>
      </form>
    </section>
  </main>

  <!-- Scripts -->
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
