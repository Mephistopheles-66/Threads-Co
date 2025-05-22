<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shipping Charges | Threads & Co.</title>
  <style>
    .shipping-container {
      max-width: 900px;
      margin: 120px auto;
      padding: 40px;
      background-color: #fdfdfd;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .shipping-container h2 {
      text-align: center;
      margin-bottom: 30px;
      font-family: "Playfair Display", serif;
      font-size: 28px;
    }

    table.shipping-table {
      width: 100%;
      border-collapse: collapse;
      background: white;
    }

    .shipping-table th, .shipping-table td {
      padding: 12px 16px;
      border: 1px solid #ddd;
      text-align: center;
    }

    .shipping-table th {
      background-color: #e0e8d8;
      font-weight: 600;
    }

    .note {
      margin-top: 20px;
      font-size: 14px;
      color: #555;
      text-align: center;
    }

    @media (max-width: 768px) {
      .shipping-container {
        padding: 20px;
      }

      .shipping-table {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <div class="shipping-container">
    <h2>Shipping Charges</h2>
    <table class="shipping-table">
      <thead>
        <tr>
          <th>Location</th>
          <th>Delivery Time</th>
          <th>Charge (NPR)</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Inside Kathmandu Valley</td>
          <td>1-2 Days</td>
          <td>100</td>
        </tr>
        <tr>
          <td>Major Cities (Pokhara, Biratnagar, etc.)</td>
          <td>2-4 Days</td>
          <td>150</td>
        </tr>
        <tr>
          <td>Other Districts</td>
          <td>3-6 Days</td>
          <td>200</td>
        </tr>
        <tr>
          <td>Remote Areas</td>
          <td>5-10 Days</td>
          <td>250</td>
        </tr>
      </tbody>
    </table>

    <p class="note">*Free shipping on orders above NPR 3000!</p>
  </div>

<%@ include file="footer.jsp" %>
</body>
</html>
