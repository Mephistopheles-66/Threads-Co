<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Account - Threads & Co.</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/UserProfile.css">
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
    <header class="account-header">
      <h1>My Account</h1>
      <a href="Home.html" class="home-link" title="Go to Homepage">
        <i class="fas fa-home"></i>
      </a>
    </header>

    <div class="account-container">
      <nav class="sidebar" aria-label="Account Navigation">
        <ul>
          <li class="active">
            <a href="UserProfile.html"><i class="fas fa-user"></i> Profile</a>
          </li>
          <li>
            <a href=""><i class="fas fa-shopping-bag"></i> Orders</a>
          </li>
          <li>
            <a href=""
              ><i class="fas fa-map-marker-alt"></i> Address</a
            >
          </li>
          <li>
            <a href=""
              ><i class="fas fa-cog"></i> Account Details</a
            >
          </li>
          <li>
            <a href="login.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
          </li>
        </ul>
      </nav>

      <main class="account-content">
        <div class="welcome-box">
          <h2>Welcome, Utsaha Karki</h2>
          <p>Here's a quick overview of your account.</p>
        </div>

        <div class="info-boxes">
          <a href="" class="box-link">
            <div class="box">
              <h3>Orders</h3>
              <p>5 total</p>
            </div>
          </a>
          <a href="" class="box-link">
            <div class="box">
              <h3>Wishlist</h3>
              <p>3 items</p>
            </div>
          </a>
          <a href="profile.html" class="box-link">
            <div class="box">
              <h3>Account Age</h3>
              <p>1 year</p>
            </div>
          </a>
        </div>

        <div class="recent-orders">
          <h3>Recent Orders</h3>
          <table>
            <thead>
              <tr>
                <th>#Order ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>#12345</td>
                <td>2024-04-10</td>
                <td><span class="badge delivered">Delivered</span></td>
                <td>Rs. 2,500</td>
              </tr>
              <tr>
                <td>#12312</td>
                <td>2024-03-18</td>
                <td><span class="badge shipped">Shipped</span></td>
                <td>Rs. 1,800</td>
              </tr>
              <tr>
                <td>#12289</td>
                <td>2024-02-25</td>
                <td><span class="badge pending">Pending</span></td>
                <td>Rs. 3,200</td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </body>
</html>
