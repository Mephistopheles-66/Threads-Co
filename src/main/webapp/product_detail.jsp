<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Threads.model.Product" %>
<%@ page import="com.Threads.service.ProductService" %>
<%@ page import="com.Threads.config.Dbconfig" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
// Handle Add to Cart POST request
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String action = request.getParameter("action");
    
    if ("addToCart".equals(action)) {
        String productName = request.getParameter("productName");
        String priceStr = request.getParameter("productPrice");
        String quantityStr = request.getParameter("quantity");
        String selectedSize = request.getParameter("selectedSize");
        String selectedColor = request.getParameter("selectedColor");
        
        if (productName != null && priceStr != null && quantityStr != null) {
            try {
                double price = Double.parseDouble(priceStr);
                int quantity = Integer.parseInt(quantityStr);
                
                // Get or create cart
                List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                }
                
                // Check if item already exists in cart
                boolean itemExists = false;
                for (Map<String, Object> item : cart) {
                    if (productName.equals(item.get("name"))) {
                        // Update quantity
                        int existingQty = (int) item.get("quantity");
                        item.put("quantity", existingQty + quantity);
                        itemExists = true;
                        break;
                    }
                }
                
                // Add new item if it doesn't exist
                if (!itemExists) {
                    Map<String, Object> newItem = new HashMap<>();
                    newItem.put("name", productName + (selectedSize != null ? " (Size: " + selectedSize + ")" : ""));
                    newItem.put("price", price);
                    newItem.put("quantity", quantity);
                    newItem.put("size", selectedSize);
                    newItem.put("color", selectedColor);
                    cart.add(newItem);
                }
                
                // Save cart to session
                session.setAttribute("cart", cart);
                
                // Set success message
                session.setAttribute("cartMessage", "Item added to cart successfully!");
                
                // Redirect to prevent form resubmission
                response.sendRedirect(request.getRequestURI() + "?id=" + request.getParameter("id") + "&added=true");
                return;
                
            } catch (NumberFormatException e) {
                session.setAttribute("cartError", "Invalid price or quantity");
            }
        } else {
            session.setAttribute("cartError", "Missing product information");
        }
    }
}

// Check for success message
String cartMessage = (String) session.getAttribute("cartMessage");
String cartError = (String) session.getAttribute("cartError");
if (cartMessage != null) {
    session.removeAttribute("cartMessage");
}
if (cartError != null) {
    session.removeAttribute("cartError");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - Threads & Co.</title>
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
        }

        .search-bar {
            width: 100%;
            padding: 12px 20px;
            border: none;
            border-radius: 25px;
            background-color: #e8e8e0;
            font-size: 1rem;
            outline: none;
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

        /* Main Content */
        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .breadcrumb {
            margin-bottom: 30px;
            color: #666;
        }

        .breadcrumb a {
            color: #666;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .product-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .product-image-section {
            position: relative;
        }

        .product-main-image {
            width: 100%;
            height: 500px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .product-main-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
        }

        .image-placeholder {
            color: #999;
            font-size: 4rem;
            opacity: 0.5;
        }

        .product-thumbnails {
            display: flex;
            gap: 10px;
            overflow-x: auto;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            background: #f0f0f0;
            border-radius: 6px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.3s ease;
        }

        .thumbnail:hover, .thumbnail.active {
            opacity: 1;
        }

        .product-info {
            padding-left: 20px;
        }

        .product-title {
            font-size: 2rem;
            font-weight: 500;
            color: #333;
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 1.5rem;
            color: #333;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .product-description {
            color: #666;
            font-size: 1rem;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .product-options {
            margin-bottom: 30px;
        }

        .option-group {
            margin-bottom: 25px;
        }

        .option-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
            display: block;
        }

        .size-options {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .size-option {
            padding: 10px 16px;
            border: 2px solid #ddd;
            border-radius: 6px;
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .size-option:hover, .size-option.selected {
            border-color: #333;
            background: #333;
            color: white;
        }

        .color-options {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .color-option {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            border: 3px solid transparent;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .color-option:hover, .color-option.selected {
            border-color: #333;
            transform: scale(1.1);
        }

        .color-black { background-color: #333; }
        .color-white { background-color: #fff; border: 3px solid #ddd; }
        .color-beige { background-color: #f5f5dc; }
        .color-blue { background-color: #4169e1; }

        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            border: 2px solid #ddd;
            border-radius: 6px;
        }

        .quantity-btn {
            background: none;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1.2rem;
            color: #666;
        }

        .quantity-btn:hover {
            background: #f5f5f5;
        }

        .quantity-input {
            border: none;
            width: 60px;
            text-align: center;
            padding: 10px 5px;
            font-size: 1rem;
        }

        .add-to-cart-btn {
            width: 100%;
            background: #333;
            color: white;
            border: none;
            padding: 16px 24px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .add-to-cart-btn:hover {
            background: #555;
            transform: translateY(-2px);
        }

        .add-to-cart-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        /* Success/Error Messages */
        .message {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .cart-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        .cart-link:hover {
            text-decoration: underline;
        }

        .wishlist-btn {
            width: 100%;
            background: none;
            color: #333;
            border: 2px solid #333;
            padding: 16px 24px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .wishlist-btn:hover {
            background: #333;
            color: white;
        }

        .product-details {
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #eee;
        }

        .detail-item {
            display: flex;
            margin-bottom: 15px;
        }

        .detail-label {
            font-weight: 600;
            color: #333;
            min-width: 120px;
        }

        .detail-value {
            color: #666;
        }

        /* Error/No Product States */
        .error-container {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .error-container h2 {
            color: #e74c3c;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .error-container p {
            color: #666;
            margin-bottom: 30px;
        }

        .back-btn {
            background: #333;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: #555;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .product-container {
                grid-template-columns: 1fr;
                gap: 30px;
                padding: 30px 20px;
            }

            .product-info {
                padding-left: 0;
            }

            .product-title {
                font-size: 1.5rem;
            }

            .header-content {
                flex-direction: column;
                gap: 20px;
            }

            .search-container {
                margin: 0;
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="Products.jsp" class="logo">Threads & Co.</a>
            
            <div class="search-container">
                <input type="text" class="search-bar" placeholder="Search products...">
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
        <div class="breadcrumb">
            <a href="Products.jsp">Products</a> / Product Details
        </div>

        <%
            String productId = request.getParameter("id");
            
            if (productId == null || productId.trim().isEmpty()) {
        %>
            <div class="error-container">
                <h2>Invalid Product</h2>
                <p>No product ID provided. Please select a product from our collection.</p>
                <a href="Products.jsp" class="back-btn">Back to Products</a>
            </div>
        <%
            } else {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    conn = Dbconfig.getDbConnection();
                    String query = "SELECT * FROM Product WHERE ProductID = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, productId);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        String productName = rs.getString("ProductName");
                        String productPrice = rs.getString("ProductPrice");
                        String productDescription = rs.getString("ProductDescription");
                        String productCategory = rs.getString("ProductCategory");
                        String productSize = rs.getString("ProductSize");
                        String stockQuantity = rs.getString("ProductStockQuantity");
        %>

        <div class="product-container">
            <!-- Product Images -->
            <div class="product-image-section">
                <div class="product-main-image">
                    <div class="image-placeholder">
                        <i class="fas fa-tshirt"></i>
                    </div>
                </div>
                
                <div class="product-thumbnails">
                    <div class="thumbnail active"></div>
                    <div class="thumbnail"></div>
                    <div class="thumbnail"></div>
                    <div class="thumbnail"></div>
                </div>
            </div>

            <!-- Product Info -->
            <div class="product-info">
                <h1 class="product-title"><%= productName %></h1>
                <div class="product-price">$<%= productPrice %></div>
                
                <div class="product-description">
                    <%= productDescription != null && !productDescription.trim().isEmpty() ? 
                        productDescription : "No description available for this product." %>
                </div>

                <div class="product-options">
                    <!-- Size Selection -->
                    <% if (productSize != null && !productSize.trim().isEmpty()) { %>
                    <div class="option-group">
                        <label class="option-label">Size</label>
                        <div class="size-options">
                            <%
                                String[] sizes = productSize.split(";");
                                for (String size : sizes) {
                                    if (size != null && !size.trim().isEmpty()) {
                            %>
                                <div class="size-option" onclick="selectSize(this)"><%= size.trim() %></div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <% } %>

                    <!-- Color Selection -->
                    <div class="option-group">
                        <label class="option-label">Color</label>
                        <div class="color-options">
                            <div class="color-option color-black" onclick="selectColor(this)"></div>
                            <div class="color-option color-white" onclick="selectColor(this)"></div>
                            <div class="color-option color-beige" onclick="selectColor(this)"></div>
                            <div class="color-option color-blue" onclick="selectColor(this)"></div>
                        </div>
                    </div>
                </div>

                <!-- Quantity Selector -->
                <div class="quantity-selector">
                    <label class="option-label">Quantity</label>
                    <div class="quantity-controls">
                        <button class="quantity-btn" onclick="changeQuantity(-1)">-</button>
                        <input type="number" class="quantity-input" value="1" min="1" max="<%= stockQuantity %>" id="quantity">
                        <button class="quantity-btn" onclick="changeQuantity(1)">+</button>
                    </div>
                </div>

                <!-- Action Buttons -->
                <form method="post" id="addToCartForm">
                    <input type="hidden" name="action" value="addToCart">
                    <input type="hidden" name="productName" value="<%= productName %>">
                    <input type="hidden" name="productPrice" value="<%= productPrice %>">
                    <input type="hidden" name="quantity" id="hiddenQuantity" value="1">
                    <input type="hidden" name="selectedSize" id="hiddenSize" value="">
                    <input type="hidden" name="selectedColor" id="hiddenColor" value="">
                    
                    <button type="submit" class="add-to-cart-btn" id="addToCartBtn">
                        <i class="fas fa-shopping-cart"></i> Add to Cart
                    </button>
                </form>
                
                <button class="wishlist-btn" onclick="addToWishlist()">
                    <i class="far fa-heart"></i> Add to Wishlist
                </button>

                <!-- Product Details -->
                <div class="product-details">
                    <div class="detail-item">
                        <span class="detail-label">Product ID:</span>
                        <span class="detail-value"><%= productId %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Category:</span>
                        <span class="detail-value"><%= productCategory != null ? productCategory : "N/A" %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Stock:</span>
                        <span class="detail-value"><%= stockQuantity != null ? stockQuantity + " items" : "In Stock" %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">SKU:</span>
                        <span class="detail-value">TC-<%= productId %></span>
                    </div>
                </div>
            </div>
        </div>

        <%
                    } else {
        %>
            <div class="error-container">
                <h2>Product Not Found</h2>
                <p>The product with ID "<%= productId %>" could not be found in our collection.</p>
                <a href="Products.jsp" class="back-btn">Back to Products</a>
            </div>
        <%
                    }
                } catch (Exception e) {
        %>
            <div class="error-container">
                <h2>Error Loading Product</h2>
                <p>An error occurred while loading the product details: <%= e.getMessage() %></p>
                <a href="Products.jsp" class="back-btn">Back to Products</a>
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
            }
        %>
    </main>

    <script>
        let selectedSize = '';
        let selectedColor = '';

        function selectSize(element) {
            // Remove selected class from all size options
            document.querySelectorAll('.size-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to clicked option
            element.classList.add('selected');
            selectedSize = element.textContent.trim();
            document.getElementById('hiddenSize').value = selectedSize;
            
            updateAddToCartButton();
        }

        function selectColor(element) {
            // Remove selected class from all color options
            document.querySelectorAll('.color-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to clicked option
            element.classList.add('selected');
            
            // Get color from class name
            if (element.classList.contains('color-black')) selectedColor = 'Black';
            else if (element.classList.contains('color-white')) selectedColor = 'White';
            else if (element.classList.contains('color-beige')) selectedColor = 'Beige';
            else if (element.classList.contains('color-blue')) selectedColor = 'Blue';
            
            document.getElementById('hiddenColor').value = selectedColor;
            updateAddToCartButton();
        }

        function changeQuantity(change) {
            const quantityInput = document.getElementById('quantity');
            const hiddenQuantity = document.getElementById('hiddenQuantity');
            let currentValue = parseInt(quantityInput.value);
            let newValue = currentValue + change;
            
            if (newValue >= 1 && newValue <= parseInt(quantityInput.max)) {
                quantityInput.value = newValue;
                hiddenQuantity.value = newValue;
            }
        }

        function updateAddToCartButton() {
            const addToCartBtn = document.getElementById('addToCartBtn');
            const hasSize = document.querySelector('.size-option') ? selectedSize !== '' : true;
            const hasColor = selectedColor !== '';
            
            if (hasSize && hasColor) {
                addToCartBtn.disabled = false;
                addToCartBtn.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
            } else {
                addToCartBtn.disabled = true;
                if (!hasSize && !hasColor) {
                    addToCartBtn.innerHTML = '<i class="fas fa-exclamation-circle"></i> Select Size & Color';
                } else if (!hasSize) {
                    addToCartBtn.innerHTML = '<i class="fas fa-exclamation-circle"></i> Select Size';
                } else if (!hasColor) {
                    addToCartBtn.innerHTML = '<i class="fas fa-exclamation-circle"></i> Select Color';
                }
            }
        }

        function addToWishlist() {
            // Add to wishlist logic here
            alert('Added to wishlist! (Feature coming soon)');
        }

        // Form submission with validation
        document.getElementById('addToCartForm').addEventListener('submit', function(e) {
            const hasSize = document.querySelector('.size-option') ? selectedSize !== '' : true;
            const hasColor = selectedColor !== '';
            
            if (!hasSize || !hasColor) {
                e.preventDefault();
                alert('Please select all required options before adding to cart.');
                return false;
            }
            
            // Show loading state
            const btn = document.getElementById('addToCartBtn');
            btn.disabled = true;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Adding to Cart...';
        });

        // Quantity input change handler
        document.getElementById('quantity').addEventListener('change', function() {
            document.getElementById('hiddenQuantity').value = this.value;
        });

        // Auto-select first available options and initialize
        document.addEventListener('DOMContentLoaded', function() {
            const firstSize = document.querySelector('.size-option');
            const firstColor = document.querySelector('.color-option');
            
            if (firstSize) {
                firstSize.classList.add('selected');
                selectedSize = firstSize.textContent.trim();
                document.getElementById('hiddenSize').value = selectedSize;
            }
            
            if (firstColor) {
                firstColor.classList.add('selected');
                if (firstColor.classList.contains('color-black')) selectedColor = 'Black';
                else if (firstColor.classList.contains('color-white')) selectedColor = 'White';
                else if (firstColor.classList.contains('color-beige')) selectedColor = 'Beige';
                else if (firstColor.classList.contains('color-blue')) selectedColor = 'Blue';
                document.getElementById('hiddenColor').value = selectedColor;
            }
            
            updateAddToCartButton();
            
            // Auto-hide success message after 5 seconds
            const successMessage = document.querySelector('.message.success');
            if (successMessage) {
                setTimeout(() => {
                    successMessage.style.opacity = '0';
                    setTimeout(() => {
                        successMessage.remove();
                    }, 300);
                }, 5000);
            }
        });
    </script>
</body>
</html>