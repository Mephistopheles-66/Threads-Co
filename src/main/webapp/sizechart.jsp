<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Size Guide | Threads & Co.</title>
  <style>
    .size-guide-container {
      max-width: 900px;
      margin: 120px auto;
      padding: 40px;
      background-color: #f5f5f5;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .size-guide-container h2 {
      text-align: center;
      margin-bottom: 30px;
      font-family: "Playfair Display", serif;
      font-size: 28px;
    }

    table.size-guide {
      width: 100%;
      border-collapse: collapse;
      background: white;
    }

    .size-guide th,
    .size-guide td {
      padding: 12px 16px;
      border: 1px solid #ddd;
      text-align: center;
    }

    .size-guide th {
      background-color: #d3e4cd;
      font-weight: 600;
    }

    @media (max-width: 768px) {
      .size-guide-container {
        padding: 20px;
      }

      table.size-guide {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <div class="size-guide-container">
    <h2>Size Guide</h2>
    <table class="size-guide">
      <thead>
        <tr>
          <th>Size</th>
          <th>Chest (inches)</th>
          <th>Waist (inches)</th>
          <th>Length (inches)</th>
          <th>Sleeve (inches)</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>S</td>
          <td>36</td>
          <td>30</td>
          <td>26</td>
          <td>8</td>
        </tr>
        <tr>
          <td>M</td>
          <td>38</td>
          <td>32</td>
          <td>27</td>
          <td>8.5</td>
        </tr>
        <tr>
          <td>L</td>
          <td>40</td>
          <td>34</td>
          <td>28</td>
          <td>9</td>
        </tr>
        <tr>
          <td>XL</td>
          <td>42</td>
          <td>36</td>
          <td>29</td>
          <td>9.5</td>
        </tr>
        <tr>
          <td>XXL</td>
          <td>44</td>
          <td>38</td>
          <td>30</td>
          <td>10</td>
        </tr>
      </tbody>
    </table>
  </div>

<%@ include file="footer.jsp" %>
</body>
</html>
