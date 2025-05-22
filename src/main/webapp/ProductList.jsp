<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Threds & Co. | Product List</title>

  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Admin.css">
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
  <link
    href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap"
    rel="stylesheet"
  />
</head>
<body>

  <!-- Sidebar -->
  <nav class="sidebar">
    <ul>
      <li>
        <a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a>
      </li>
      <div id="menu-items" class="collapsed">
        <li><a href="AdminDashboard.html"><i class="fas fa-lightbulb"></i>Dashboard</a></li>
        <li><a href="adminProduclist.html"><i class="fas fa-box"></i> Products List</a></li>
        <li><a href="adminOrderlist.html"><i class="fas fa-ruler-combined"></i> Recent Orders</a></li>
        <li><a href="addnewproduct.html"><i class="fas fa-shopping-cart"></i> Add New Product</a></li>
      </div>
    </ul>
  </nav>

  <!-- Header -->
  <header class="admin-header">
    <div class="header-left">Threds & Co.</div>
    <div class="header-center">Product List</div>
    <div class="header-right-notification">
      <i class="fas fa-bell notification-icon"></i>
    </div>
    <div class="header-right-user">
      <a href="#" class="user-link"><i class="fas fa-user user-icon"></i></a>
    </div>
  </header>

  <!-- Main Content -->
  <main style="margin-left: 230px; padding: 20px;">
    <section class="product-section">
      <h2>Product List</h2>
      <table>
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Stock</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>#101</td>
            <td>Cotton T-shirt</td>
            <td>Rs 2,500</td>
            <td>50</td>
          </tr>
          <tr>
            <td>#102</td>
            <td>Line Pants</td>
            <td>Rs 1,800</td>
            <td>30</td>
          </tr>
          <tr>
            <td>#103</td>
            <td>Summer Dress</td>
            <td>Rs 2,500</td>
            <td>50</td>
          </tr>
          <tr>
            <td>#104</td>
            <td>Classic Denim Jacket</td>
            <td>Rs 1,800</td>
            <td>30</td>
          </tr>
          <tr>
            <td>#105</td>
            <td>Silk Scarf</td>
            <td>Rs 2,500</td>
            <td>50</td>
          </tr>
          <tr>
            <td>#106</td>
            <td>Wool Sweater</td>
            <td>Rs 1,800</td>
            <td>30</td>
          </tr>
        </tbody>
      </table>
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
