<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Threads.model.Product" %>
<%@ page import="com.Threads.service.ProductService" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Threads & Co. | Product List</title>

  <style>
    /* General Reset and Base Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f5f5f5;
      color: #333;
      line-height: 1.6;
    }

    /* Sidebar Styles */
    .sidebar {
      width: 230px;
      height: 100vh;
      background-color: #fff;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 100;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }

    .sidebar ul {
      list-style: none;
      padding: 20px 0;
    }

    .sidebar li {
      padding: 0;
      transition: background-color 0.3s;
    }

    .sidebar li a {
      display: block;
      padding: 15px 20px;
      text-decoration: none;
      color: #555;
      font-size: 14px;
      transition: all 0.3s;
    }

    .sidebar li a i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
    }

    .sidebar li:hover {
      background-color: #f0f0f0;
    }

    .sidebar li.active {
      background-color: #4414a4;
    }

    .sidebar li.active a {
      color: white;
    }

    #menu-toggle {
      cursor: pointer;
      font-weight: bold;
    }

    #menu-items.collapsed {
      display: none;
    }

    /* Header Styles */
    .admin-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 70px;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      padding: 0 20px;
      position: fixed;
      top: 0;
      right: 0;
      left: 230px;
      z-index: 99;
    }

    .header-left {
      font-family: 'Playfair Display', serif;
      font-size: 24px;
      color: #4414a4;
    }

    .header-center {
      font-size: 18px;
      font-weight: 500;
    }

    .header-right-notification,
    .header-right-user {
      font-size: 18px;
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      background-color: #f5f5f5;
      cursor: pointer;
      transition: all 0.3s;
    }

    .header-right-notification:hover,
    .header-right-user:hover {
      background-color: #e0e0e0;
    }

    .user-link {
      color: #333;
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      width: 100%;
      height: 100%;
    }

    /* Main Content */
    main {
      margin-left: 230px;
      padding: 90px 20px 20px;
    }

    /* Table Styles */
    .product-section {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 25px;
    }

    .product-section h2 {
      font-family: 'Playfair Display', serif;
      color: #4414a4;
      margin-bottom: 25px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th, table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }

    table th {
      background-color: #f9f9f9;
      font-weight: 600;
      color: #555;
    }

    table tr:hover {
      background-color: #f5f5f5;
    }

    .actions {
      display: flex;
      gap: 10px;
    }

    .btn-edit, .btn-delete {
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      transition: all 0.3s;
    }

    .btn-edit {
      background-color: #4414a4;
      color: white;
    }

    .btn-delete {
      background-color: #f44336;
      color: white;
    }

    .btn-edit:hover {
      background-color: #350c80;
    }

    .btn-delete:hover {
      background-color: #d32f2f;
    }

    /* Search and Add Product */
    .action-bar {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .search-product {
      display: flex;
      gap: 10px;
      width: 60%;
    }

    .search-product input {
      flex: 1;
      padding: 10px 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
    }

    .search-product button, .add-new-btn {
      padding: 10px 15px;
      background-color: #4414a4;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 14px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .search-product button:hover, .add-new-btn:hover {
      background-color: #350c80;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .sidebar {
        width: 70px;
      }
      
      .sidebar li a span {
        display: none;
      }
      
      .sidebar li a i {
        margin-right: 0;
        font-size: 18px;
      }
      
      .admin-header {
        left: 70px;
      }
      
      .header-center {
        display: none;
      }
      
      main {
        margin-left: 70px;
      }
      
      .action-bar {
        flex-direction: column;
        gap: 10px;
      }
      
      .search-product {
        width: 100%;
      }
    }
  </style>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet" />
</head>
<body>

  <!-- Sidebar -->
  <nav class="sidebar">
    <ul>
      <li>
        <a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a>
      </li>
      <div id="menu-items" class="collapsed">
        <li><a href="${pageContext.request.contextPath}/adminDashboard"><i class="fas fa-lightbulb"></i> Dashboard</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/viewProductList"><i class="fas fa-box"></i> Products List</a></li>
        <li><a href="${pageContext.request.contextPath}/showOrders"><i class="fas fa-ruler-combined"></i> Recent Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/addProductForm"><i class="fas fa-shopping-cart"></i> Add New Product</a></li>
      </div>
    </ul>
  </nav>

  <!-- Header -->
  <header class="admin-header">
    <div class="header-left">Threads & Co.</div>
    <div class="header-center">Product List</div>
    <div class="header-right-notification">
      <i class="fas fa-bell notification-icon"></i>
    </div>
    <div class="header-right-user">
      <a href="${pageContext.request.contextPath}/adminLogout" class="user-link"><i class="fas fa-user user-icon"></i></a>
    </div>
  </header>

  <!-- Main Content -->
  <main>
    <section class="product-section">
      <div class="action-bar">
        <form class="search-product" action="${pageContext.request.contextPath}/viewProductList" method="get">
          <input type="text" name="search" placeholder="Search products..." 
                 value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" />
          <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
        <a href="${pageContext.request.contextPath}/addProductForm" class="add-new-btn"><i class="fas fa-plus"></i> Add New Product</a>
      </div>
      
      <h2>Product List</h2>
      <table>
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
          // Create an instance of the product service
          ProductService productService = new ProductService();
          List<Product> products = null;
          
          // Check if a search query is applied
          if (request.getParameter("search") != null && !request.getParameter("search").trim().isEmpty()) {
              products = productService.searchProducts(request.getParameter("search"));
          } 
          // Otherwise, get all products
          else {
              products = productService.getAllProducts();
          }
          
          // Display products
          if (products != null && !products.isEmpty()) {
              for (Product product : products) {
          %>
          <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getCategory() %></td>
            <td>$<%= String.format("%.2f", product.getPrice()) %></td>
            <td><%= product.getStock() %></td>
            <td class="actions">
              <a href="${pageContext.request.contextPath}/editProduct?id=<%= product.getId() %>" class="btn-edit"><i class="fas fa-edit"></i></a>
              <a href="${pageContext.request.contextPath}/deleteProduct?id=<%= product.getId() %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this product?')"><i class="fas fa-trash"></i></a>
            </td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="6" style="text-align: center;">No products found.</td>
          </tr>
          <%
          }
          %>
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