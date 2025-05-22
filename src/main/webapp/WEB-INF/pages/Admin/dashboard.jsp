<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Threads & Co. Admin Dashboard</title>

  <!-- Stylesheets -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Admin.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet" />

  <!-- Chart.js CDN -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

  <!-- Header -->
  <header class="admin-header">
    <div class="header-left">Threads & Co.</div>
    <div class="header-center">Welcome to the Admin Dashboard</div>
    <div class="header-right">
  <i class="fas fa-bell notification-icon"></i>
  <a href="adminprofile.html" class="user-link">
    <i class="fas fa-user user-icon"></i>
  </a>
  <a href="?action=logout" class="user-link" title="Logout">
    <i class="fas fa-sign-out-alt"></i>
  </a>
</div>

  </header>

  <!-- Sidebar Navigation -->
  <nav class="sidebar">
    <ul>
      <li>
        <a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a>
      </li>
      <div id="menu-items" class="collapsed">
        <li><a href="AdminDashboard.html"><i class="fas fa-lightbulb"></i>Dashboard</a></li>
        <li><a href="adminProduclist.html"><i class="fas fa-box"></i> Products List</a></li>
        <li><a href="adminOrderlist.html"><i class="fas fa-ruler-combined"></i> Recent Orders</a></li>
        <li><a href="addProductForm"><i class="fas fa-shopping-cart"></i> Add New Product</a></li>
      </div>
    </ul>
  </nav>

  <!-- Main Dashboard Content -->
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
    </section>

    <!-- Sales Report with Line Chart -->
    <section class="table-section">
      <h2>Sales Report</h2>
      <canvas id="salesChart" width="600" height="300"></canvas>
    </section>
  </main>

  <!-- Scripts -->
  <script>
    // Sidebar menu toggle
    const menuToggle = document.getElementById("menu-toggle");
    const menuItems = document.getElementById("menu-items");

    menuToggle.addEventListener("click", (e) => {
      e.preventDefault();
      menuItems.classList.toggle("collapsed");
    });

    // Sales Line Chart using Chart.js
    const ctx = document.getElementById('salesChart').getContext('2d');
    const salesChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['January', 'February', 'March', 'April', 'May'],
        datasets: [{
          label: 'Total Sales (Rs)',
          data: [89000, 74500, 110200, 95000, 123000],
          borderColor: '#4CAF50',
          backgroundColor: 'rgba(76, 175, 80, 0.1)',
          borderWidth: 2,
          tension: 0.3,
          pointBackgroundColor: '#388E3C'
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: { display: true },
          tooltip: { enabled: true }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: 'Sales (Rs)'
            }
          },
          x: {
            title: {
              display: true,
              text: 'Month'
            }
          }
        }
      }
    });
  </script>
</body>
</html>
