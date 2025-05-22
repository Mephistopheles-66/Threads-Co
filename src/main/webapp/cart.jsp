<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.DecimalFormat" %>

<%
// Handle POST actions first (before any HTML output)
if ("POST".equalsIgnoreCase(request.getMethod())) {
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    
    String action = request.getParameter("action");
    String productName = request.getParameter("productName");
    String quantityStr = request.getParameter("quantity");
    
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }
    
    if ("remove".equals(action) && productName != null) {
        // Remove item from cart
        Iterator<Map<String, Object>> iterator = cart.iterator();
        while (iterator.hasNext()) {
            Map<String, Object> item = iterator.next();
            if (productName.equals(item.get("name"))) {
                iterator.remove();
                break;
            }
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
        return;
    }
    
    if ("update".equals(action) && productName != null && quantityStr != null) {
        // Update quantity
        try {
            int newQuantity = Integer.parseInt(quantityStr);
            if (newQuantity > 0) {
                for (Map<String, Object> item : cart) {
                    if (productName.equals(item.get("name"))) {
                        item.put("quantity", newQuantity);
                        break;
                    }
                }
            }
        } catch (NumberFormatException e) {
            // Invalid quantity, ignore
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
        return;
    }
    
    if ("clear".equals(action)) {
        // Clear entire cart
        cart.clear();
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
        return;
    }
}

// Get cart data for display
List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
DecimalFormat df = new DecimalFormat("#0.00");
double grandTotal = 0;
int totalItems = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Threads & Co.</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .cart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e0e0e0;
        }

        .cart-title {
            font-size: 2.5rem;
            font-weight: 500;
            color: #333;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .cart-count {
            background: #333;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 1rem;
            font-weight: 600;
        }

        .clear-cart-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .clear-cart-btn:hover {
            background: #c0392b;
            transform: translateY(-2px);
        }

        .cart-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .cart-items {
            padding: 0;
        }

        .cart-item {
            display: grid;
            grid-template-columns: 100px 1fr 120px 150px 120px 80px;
            gap: 20px;
            align-items: center;
            padding: 25px;
            border-bottom: 1px solid #f0f0f0;
            transition: background-color 0.3s ease;
        }

        .cart-item:hover {
            background-color: #fafafa;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-image {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
            font-size: 1.5rem;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .item-description {
            color: #666;
            font-size: 0.9rem;
        }

        .item-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            text-align: center;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #e9ecef;
        }

        .qty-btn {
            background: none;
            border: none;
            padding: 10px 12px;
            cursor: pointer;
            font-size: 1.2rem;
            color: #666;
            transition: all 0.3s ease;
        }

        .qty-btn:hover {
            background: #e9ecef;
            color: #333;
        }

        .qty-input {
            border: none;
            background: none;
            width: 50px;
            text-align: center;
            padding: 10px 5px;
            font-size: 1rem;
            font-weight: 600;
            color: #333;
        }

        .item-total {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            text-align: center;
        }

        .remove-btn {
            background: none;
            border: none;
            color: #e74c3c;
            cursor: pointer;
            padding: 10px;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-size: 1.2rem;
        }

        .remove-btn:hover {
            background: #fee;
            color: #c0392b;
        }

        .cart-summary {
            background: #f8f9fa;
            padding: 30px;
            border-top: 1px solid #e9ecef;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .summary-row:last-child {
            margin-bottom: 0;
            padding-top: 15px;
            border-top: 2px solid #dee2e6;
        }

        .summary-label {
            font-size: 1rem;
            color: #666;
        }

        .summary-value {
            font-size: 1rem;
            font-weight: 600;
            color: #333;
        }

        .grand-total .summary-label,
        .grand-total .summary-value {
            font-size: 1.3rem;
            font-weight: 700;
            color: #333;
        }

        .cart-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 25px;
        }

        .continue-shopping-btn {
            background: none;
            color: #333;
            border: 2px solid #333;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .continue-shopping-btn:hover {
            background: #333;
            color: white;
        }

        .checkout-btn {
            background: #27ae60;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .checkout-btn:hover {
            background: #229954;
            transform: translateY(-2px);
        }

        /* Empty Cart State */
        .empty-cart {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .empty-cart i {
            font-size: 4rem;
            color: #bdc3c7;
            margin-bottom: 20px;
        }

        .empty-cart h3 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .empty-cart p {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1rem;
        }

        .shop-now-btn {
            background: #333;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
        }

        .shop-now-btn:hover {
            background: #555;
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .cart-item {
                grid-template-columns: 1fr;
                gap: 15px;
                text-align: center;
            }

            .cart-header {
                flex-direction: column;
                gap: 20px;
            }

            .cart-title {
                font-size: 2rem;
            }

            .cart-actions {
                flex-direction: column;
            }

            .continue-shopping-btn,
            .checkout-btn {
                justify-content: center;
            }

            .main-content {
                padding: 20px 15px;
            }
        }

        @media (max-width: 480px) {
            .quantity-controls {
                justify-content: center;
            }

            .cart-summary {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <%@ include file="header.jsp" %>

    <main class="main-content">
        <%
        if (cart != null && !cart.isEmpty()) {
            for (Map<String, Object> item : cart) {
                int qty = (int) item.get("quantity");
                totalItems += qty;
                double price = (double) item.get("price");
                grandTotal += price * qty;
            }
        }
        %>

        <div class="cart-header">
            <h1 class="cart-title">
                <i class="fas fa-shopping-cart"></i>
                Shopping Cart
                <% if (totalItems > 0) { %>
                    <span class="cart-count"><%= totalItems %> items</span>
                <% } %>
            </h1>
            
            <% if (cart != null && !cart.isEmpty()) { %>
                <form method="post" style="display: inline;">
                    <input type="hidden" name="action" value="clear">
                    <button type="submit" class="clear-cart-btn" onclick="return confirm('Are you sure you want to clear your cart?')">
                        <i class="fas fa-trash"></i>
                        Clear Cart
                    </button>
                </form>
            <% } %>
        </div>

        <% if (cart == null || cart.isEmpty()) { %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p>Looks like you haven't added any items to your cart yet. Start shopping to fill it up!</p>
                <a href="Products.jsp" class="shop-now-btn">
                    <i class="fas fa-arrow-right"></i>
                    Start Shopping
                </a>
            </div>
        <% } else { %>
            <div class="cart-container">
                <div class="cart-items">
                    <%
                    int index = 1;
                    for (Map<String, Object> item : cart) {
                        String name = (String) item.get("name");
                        double price = (double) item.get("price");
                        int qty = (int) item.get("quantity");
                        double itemTotal = price * qty;
                    %>
                    <div class="cart-item">
                        <div class="item-image">
                            <i class="fas fa-tshirt"></i>
                        </div>
                        
                        <div class="item-details">
                            <div class="item-name"><%= name %></div>
                            <div class="item-description">Premium quality product</div>
                        </div>
                        
                        <div class="item-price">
                            $<%= df.format(price) %>
                        </div>
                        
                        <div class="quantity-controls">
                            <form method="post" style="display: inline;">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="productName" value="<%= name %>">
                                <button type="submit" name="quantity" value="<%= qty - 1 %>" class="qty-btn" <%= qty <= 1 ? "disabled" : "" %>>-</button>
                            </form>
                            <input type="number" class="qty-input" value="<%= qty %>" min="1" readonly>
                            <form method="post" style="display: inline;">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="productName" value="<%= name %>">
                                <button type="submit" name="quantity" value="<%= qty + 1 %>" class="qty-btn">+</button>
                            </form>
                        </div>
                        
                        <div class="item-total">
                            $<%= df.format(itemTotal) %>
                        </div>
                        
                        <form method="post" style="display: inline;">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productName" value="<%= name %>">
                            <button type="submit" class="remove-btn" onclick="return confirm('Remove this item from cart?')" title="Remove item">
                                <i class="fas fa-times"></i>
                            </button>
                        </form>
                    </div>
                    <% } %>
                </div>

                <div class="cart-summary">
                    <div class="summary-row">
                        <span class="summary-label">Subtotal (<%= totalItems %> items):</span>
                        <span class="summary-value">$<%= df.format(grandTotal) %></span>
                    </div>
                    <div class="summary-row">
                        <span class="summary-label">Shipping:</span>
                        <span class="summary-value">Free</span>
                    </div>
                    <div class="summary-row">
                        <span class="summary-label">Tax:</span>
                        <span class="summary-value">$<%= df.format(grandTotal * 0.1) %></span>
                    </div>
                    <div class="summary-row grand-total">
                        <span class="summary-label">Total:</span>
                        <span class="summary-value">$<%= df.format(grandTotal + (grandTotal * 0.1)) %></span>
                    </div>

                    <div class="cart-actions">
                        <a href="Products.jsp" class="continue-shopping-btn">
                            <i class="fas fa-arrow-left"></i>
                            Continue Shopping
                        </a>
                        
                        <button class="checkout-btn" onclick="proceedToCheckout()">
                            <i class="fas fa-credit-card"></i>
                            Proceed to Checkout
                        </button>
                    </div>
                </div>
            </div>
        <% } %>
    </main>

    <!-- Include Footer -->
    <%@ include file="footer.jsp" %>

    <script>
        function proceedToCheckout() {
            // Add checkout logic here
            alert('Proceeding to checkout...\nTotal: $<%= df.format(grandTotal + (grandTotal * 0.1)) %>');
            // window.location.href = 'checkout.jsp';
        }

        // Auto-refresh functionality for quantity updates
        function updateQuantity(productName, newQuantity) {
            if (newQuantity < 1) return;
            
            const form = document.createElement('form');
            form.method = 'post';
            form.innerHTML = `
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="productName" value="${productName}">
                <input type="hidden" name="quantity" value="${newQuantity}">
            `;
            document.body.appendChild(form);
            form.submit();
        }

        // Add smooth animations
        document.addEventListener('DOMContentLoaded', function() {
            const cartItems = document.querySelectorAll('.cart-item');
            cartItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>