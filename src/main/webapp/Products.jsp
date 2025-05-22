<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Threads.model.Product" %>
<%@ page import="com.Threads.service.ProductService" %>
<%@ page import="com.Threads.config.Dbconfig" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Collection - Threads & Co.</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background-color: #f5f5f0;
            line-height: 1.6;
        }

        /* Header Styles */
        .header {
            background-color: #f5f5f0;
            padding: 20px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 600;
            color: #333;
            text-decoration: none;
        }

        .search-container {
            flex: 1;
            max-width: 500px;
            margin: 0 40px;
            position: relative;
        }

        .search-bar {
            width: 100%;
            padding: 12px 20px;
            border: none;
            border-radius: 25px;
            background-color: #e8e8e0;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        .search-bar:focus {
            background-color: #ddd;
            box-shadow: 0 0 0 3px rgba(0,0,0,0.1);
        }

        .search-bar::placeholder {
            color: #888;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .header-actions a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: color 0.3s ease;
        }

        .header-actions a:hover {
            color: #666;
        }

        /* Menu Bar */
        .menu-bar {
            background-color: #f5f5f0;
            padding: 15px 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .menu-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .menu-toggle {
            display: flex;
            align-items: center;
            gap: 10px;
            background: none;
            border: none;
            font-size: 1.1rem;
            font-weight: 500;
            color: #333;
            cursor: pointer;
            padding: 8px 0;
        }

        .menu-toggle:hover {
            color: #666;
        }

        /* Main Content */
        .main-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 400;
            color: #333;
            margin-bottom: 40px;
            text-align: left;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .product-image {
            width: 100%;
            height: 300px;
            overflow: hidden;
            position: relative;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.05);
        }

        .image-placeholder {
            color: #999;
            font-size: 3rem;
            opacity: 0.5;
        }

        .product-info {
            padding: 20px;
        }

        .product-name {
            font-size: 1.1rem;
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
            line-height: 1.3;
        }

        .product-price {
            font-size: 1rem;
            color: #666;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .product-category {
            font-size: 0.9rem;
            color: #888;
            margin-bottom: 15px;
            text-transform: capitalize;
        }

        .color-options {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .color-dot {
            width: 16px;
            height: 16px;
            border-radius: 50%;
            border: 2px solid transparent;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .color-dot:hover {
            transform: scale(1.2);
            border-color: #333;
        }

        .color-black { background-color: #333; }
        .color-white { background-color: #fff; border: 2px solid #ddd; }
        .color-beige { background-color: #f5f5dc; }
        .color-blue { background-color: #4169e1; }
        .color-pink { background-color: #ffc0cb; }
        .color-gray { background-color: #808080; }

        /* Stock Status */
        .stock-status {
            font-size: 0.85rem;
            padding: 4px 8px;
            border-radius: 4px;
            margin-bottom: 10px;
            display: inline-block;
        }

        .in-stock {
            background-color: #d4edda;
            color: #155724;
        }

        .low-stock {
            background-color: #fff3cd;
            color: #856404;
        }

        .out-of-stock {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* No Products / Error States */
        .no-products {
            text-align: center;
            padding: 80px 20px;
            color: #666;
            grid-column: 1 / -1;
        }

        .no-products h2 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #333;
            font-weight: 400;
        }

        .no-products p {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }

        .error-message {
            text-align: center;
            padding: 60px 20px;
            background: #fff;
            border-radius: 12px;
            border: 2px solid #f8d7da;
            grid-column: 1 / -1;
            margin: 20px 0;
        }

        .error-message h2 {
            color: #721c24;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .error-message p {
            color: #721c24;
        }

        /* Loading State */
        .loading-placeholder {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 20px;
            }

            .search-container {
                margin: 0;
                max-width: 100%;
            }

            .header-actions {
                gap: 20px;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }

            .page-title {
                font-size: 2rem;
            }

            .main-content {
                padding: 30px 15px;
            }
        }

        @media (max-width: 480px) {
            .products-grid {
                grid-template-columns: 1fr;
            }

            .logo {
                font-size: 1.5rem;
            }

            .header-actions {
                flex-wrap: wrap;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="home.jsp" class="logo">Threads & Co.</a>
            
            <div class="search-container">
                <input type="text" class="search-bar" placeholder="Search products..." id="searchInput">
            </div>
            
            <div class="header-actions">
                <a href="cart.jsp">
                    <i class="fas fa-shopping-cart"></i> Cart
                </a>
                <a href="login.jsp">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <a href="Register.jsp">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </div>
        </div>
    </header>

    <!-- Menu Bar -->
    <div class="menu-bar">
        <div class="menu-content">
            <button class="menu-toggle">
                <i class="fas fa-bars"></i>
                Menu
            </button>
        </div>
    </div>

    <!-- Main Content -->
    <main class="main-content">
        <h1 class="page-title">Our Collection</h1>

        <div class="products-grid">
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    conn = Dbconfig.getDbConnection();
                    String query = "SELECT ProductID, ProductName, ProductPrice, ProductDescription, ProductCategory, ProductStockQuantity, ProductSize, ProductImage FROM Product ORDER BY ProductID DESC";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();
                    
                    boolean hasProducts = false;
                    
                    while (rs.next()) {
                        hasProducts = true;
                        String productId = rs.getString("ProductID");
                        String productName = rs.getString("ProductName");
                        String productPrice = rs.getString("ProductPrice");
                        String productDescription = rs.getString("ProductDescription");
                        String productCategory = rs.getString("ProductCategory");
                        int stockQuantity = rs.getInt("ProductStockQuantity");
                        String productSize = rs.getString("ProductSize");
                        Blob productImageBlob = rs.getBlob("ProductImage");
                        
                        // Determine stock status
                        String stockStatus = "";
                        String stockClass = "";
                        if (stockQuantity == 0) {
                            stockStatus = "Out of Stock";
                            stockClass = "out-of-stock";
                        } else if (stockQuantity <= 5) {
                            stockStatus = "Low Stock (" + stockQuantity + " left)";
                            stockClass = "low-stock";
                        } else {
                            stockStatus = "In Stock";
                            stockClass = "in-stock";
                        }
            %>
            
            <div class="product-card" onclick="viewProduct('<%= productId %>')">
                <div class="product-image">
                    <%
                        // Check if product has an image blob
                        if (productImageBlob != null) {
                    %>
                        <img src="image?id=<%= productId %>" 
                             alt="<%= productName %>" 
                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                             loading="lazy">
                        <div class="image-placeholder" style="display: none;">
                            <i class="fas fa-tshirt"></i>
                        </div>
                    <%
                        } else {
                    %>
                        <div class="image-placeholder">
                            <i class="fas fa-tshirt"></i>
                        </div>
                    <%
                        }
                    %>
                </div>
                
                <div class="product-info">
                    <div class="product-category"><%= productCategory %></div>
                    <div class="product-name"><%= productName %></div>
                    <div class="product-price">$<%= productPrice %></div>
                    
                    <div class="stock-status <%= stockClass %>">
                        <%= stockStatus %>
                    </div>
                    
                    <% if (productSize != null && !productSize.trim().isEmpty()) { %>
                    <div style="font-size: 0.9rem; color: #666; margin-bottom: 10px;">
                        Size: <%= productSize %>
                    </div>
                    <% } %>
                    
                    <div class="color-options">
                        <div class="color-dot color-black"></div>
                        <div class="color-dot color-white"></div>
                        <div class="color-dot color-beige"></div>
                        <div class="color-dot color-blue"></div>
                    </div>
                </div>
            </div>
            
            <%
                    }
                    
                    if (!hasProducts) {
            %>
            
            <div class="no-products">
                <h2>No Products Available</h2>
                <p>We're currently updating our collection. Please check back soon for exciting new arrivals!</p>
                <button onclick="location.reload()" style="background: #333; color: white; border: none; padding: 12px 24px; border-radius: 6px; cursor: pointer; font-size: 1rem;">
                    Refresh Page
                </button>
            </div>
            
            <%
                    }
                    
                } catch (Exception e) {
            %>
            
            <div class="error-message">
                <h2>Unable to Load Products</h2>
                <p>Error: <%= e.getMessage() %></p>
                <button onclick="location.reload()" style="background: #721c24; color: white; border: none; padding: 12px 24px; border-radius: 6px; cursor: pointer; font-size: 1rem; margin-top: 15px;">
                    Try Again
                </button>
            </div>
            
            <%
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        System.err.println("Error closing resources: " + e.getMessage());
                    }
                }
            %>
        </div>
    </main>

    <script>
        function viewProduct(productId) {
            window.location.href = 'product_detail.jsp?id=' + productId;
        }

        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const productCards = document.querySelectorAll('.product-card');
            
            productCards.forEach(card => {
                const productName = card.querySelector('.product-name').textContent.toLowerCase();
                const productCategory = card.querySelector('.product-category').textContent.toLowerCase();
                
                if (productName.includes(searchTerm) || productCategory.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Show/hide no results message
            const visibleCards = document.querySelectorAll('.product-card[style*="display: block"], .product-card:not([style*="display: none"])');
            if (visibleCards.length === 0 && searchTerm.length > 0) {
                showNoResultsMessage();
            } else {
                hideNoResultsMessage();
            }
        });

        function showNoResultsMessage() {
            let existingMessage = document.querySelector('.no-results-message');
            if (!existingMessage) {
                const message = document.createElement('div');
                message.className = 'no-results-message no-products';
                message.innerHTML = `
                    <h2>No Products Found</h2>
                    <p>Sorry, we couldn't find any products matching your search.</p>
                `;
                document.querySelector('.products-grid').appendChild(message);
            }
        }

        function hideNoResultsMessage() {
            const message = document.querySelector('.no-results-message');
            if (message) {
                message.remove();
            }
        }

        // Color selection
        document.addEventListener('click', function(e) {
            if (e.target.classList.contains('color-dot')) {
                e.stopPropagation();
                
                // Remove active class from siblings
                const siblings = e.target.parentElement.querySelectorAll('.color-dot');
                siblings.forEach(dot => dot.style.borderColor = 'transparent');
                
                // Add active state
                e.target.style.borderColor = '#333';
                e.target.style.borderWidth = '3px';
            }
        });

        // Menu toggle (you can expand this for mobile menu)
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            // Add your menu toggle functionality here
            console.log('Menu clicked');
        });

        // Smooth animations on load
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.product-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });

        // Image loading error handling
        document.addEventListener('error', function(e) {
            if (e.target.tagName === 'IMG') {
                console.log('Image failed to load:', e.target.src);
            }
        }, true);
    </script>
</body>
</html>