<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Threds & Co. Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/admindashboard.css">
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
    <header class="admin-header">
      <div class="header-left">Threads & Co.</div>
      <div class="header-center">Welcome to the Admin Dashboard</div>
      <div class="header-right-notification">
        <i class="fas fa-bell notification-icon"></i>
      </div>
      <div class="header-right-user">
        <a href="adminprofile.html" class="user-link">
          <i class="fas fa-user user-icon"></i
        ></a>
      </div>
    </header>

    <main class="dashboard">
      <!-- Cards Section -->
      <section class="cards">
        <div class="card">
          <i class="fas fa-rupee-sign"></i>
          <h3>Today's Sales</h3>
          <p>Rs 8,200</p>
        </div>
        <div class="card">
          <i class="fas fa-shopping-cart"></i>
          <h3>Orders</h3>
          <p>23</p>
        </div>
        <div class="card">
          <i class="fas fa-user"></i>
          <h3>New Customers</h3>
          <p>5</p>
        </div>
        <div class="card">
          <i class="fas fa-box"></i>
          <h3>Low Stock</h3>
          <p>4</p>
        </div>
      </section>

      <!-- Product List -->
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

      <!-- Recent Orders -->
      <section class="table-section">
        <h2>Recent Orders</h2>
        <table>
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Total</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>#1245</td>
              <td>Utsaha Karki</td>
              <td>Rs 1,250</td>
              <td><span class="badge shipped">Shipped</span></td>
            </tr>
            <tr>
              <td>#1244</td>
              <td>Rohit Shrestha</td>
              <td>Rs 2,100</td>
              <td><span class="badge delivered">Delivered</span></td>
            </tr>
            <tr>
              <td>#1243</td>
              <td>Kavya Pradhan</td>
              <td>Rs 980</td>
              <td><span class="badge pending">Pending</span></td>
            </tr>
            <tr>
              <td>#1242</td>
              <td>Saumya Singh</td>
              <td>Rs 2,100</td>
              <td><span class="badge delivered">Delivered</span></td>
            </tr>
          </tbody>
        </table>
      </section>

      <!-- Sales Report -->
      <section class="table-section">
        <h2>Sales Report</h2>
        <table>
          <thead>
            <tr>
              <th>Month</th>
              <th>Total Orders</th>
              <th>Total Sales</th>
              <th>Top Product</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>January</td>
              <td>120</td>
              <td>Rs 89,000</td>
              <td>Denim Jacket</td>
            </tr>
            <tr>
              <td>February</td>
              <td>95</td>
              <td>Rs 74,500</td>
              <td>Hoodie</td>
            </tr>
            <tr>
              <td>March</td>
              <td>150</td>
              <td>Rs 1,10,200</td>
              <td>Cotton Shirt</td>
            </tr>
          </tbody>
        </table>
      </section>

      <!-- Add Product Form -->
      <section class="add-product-section">
        <h2>Add New Product</h2>
        <form class="add-product-form">
          <label for="product-name">Product Name</label>
          <input
            type="text"
            id="product-name"
            placeholder="Enter product name"
            required
          />

          <label for="price">Price</label>
          <input type="number" id="price" placeholder="Enter price" required />

          <label for="stock">Stock</label>
          <input
            type="number"
            id="stock"
            placeholder="Enter stock quantity"
            required
          />

          <button type="submit" class="btn-submit">Add Product</button>
        </form>
      </section>
    </main>
  </body>
</html>