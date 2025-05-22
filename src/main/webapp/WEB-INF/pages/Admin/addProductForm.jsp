<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Threads & Co. | Add Product</title>

    <!-- Font Awesome and Google Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet" />
    
    <!-- Internal CSS -->
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
            
            .main-content {
                margin-left: 70px;
            }
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

        /* Main Content Styles */
        .main-content {
            margin-left: 230px;
            padding: 90px 20px 20px;
            min-height: 100vh;
        }

        /* Add Product Form Styles */
        .add-product-section {
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .add-product-section h2 {
            color: #4414a4;
            margin-bottom: 25px;
            font-family: 'Playfair Display', serif;
        }

        .add-product-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 992px) {
            .add-product-form {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border 0.3s;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #4414a4;
            outline: none;
        }

        .price-input {
            position: relative;
            display: flex;
            align-items: center;
        }

        .currency-symbol {
            position: absolute;
            left: 12px;
            font-weight: 500;
            color: #555;
        }

        .price-input input {
            padding-left: 25px !important;
        }

        .size-options {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .size-option {
            display: flex;
            align-items: center;
            background: #f5f5f5;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .size-option:hover {
            background: #e0e0e0;
        }

        .size-option input {
            margin-right: 5px;
        }

        .file-upload {
            border: 2px dashed #ddd;
            padding: 20px;
            border-radius: 4px;
            text-align: center;
            transition: all 0.3s;
        }

        .file-upload:hover {
            border-color: #4414a4;
        }

        .file-preview {
            margin-top: 15px;
            min-height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .file-preview img {
            max-width: 100%;
            max-height: 200px;
            border-radius: 4px;
        }

        .form-actions {
            grid-column: 1 / -1;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }

        .btn-reset,
        .btn-submit {
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-reset {
            background-color: #f5f5f5;
            color: #555;
        }

        .btn-submit {
            background-color: #4414a4;
            color: white;
        }

        .btn-reset:hover {
            background-color: #e0e0e0;
        }

        .btn-submit:hover {
            background-color: #350c80;
        }

        /* Alert Messages */
        .alert {
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            font-size: 14px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .admin-header {
                left: 70px;
            }
            
            .header-center {
                display: none;
            }
        }

        @media (max-width: 576px) {
            .form-actions {
                flex-direction: column;
            }
            
            .btn-reset, 
            .btn-submit {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <nav class="sidebar">
        <ul>
            <li><a href="#" id="menu-toggle"><i class="fas fa-bars"></i> Menu</a></li>
            <div id="menu-items" class="collapsed">
                <li><a href="${pageContext.request.contextPath}/adminDashboard"><i class="fas fa-lightbulb"></i> Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/viewProductList"><i class="fas fa-box"></i> Products List</a></li>
                <li><a href="${pageContext.request.contextPath}/showOrders"><i class="fas fa-ruler-combined"></i> Recent Orders</a></li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/addProductForm"><i class="fas fa-shopping-cart"></i> Add New Product</a>
                </li>
            </div>
        </ul>
    </nav>

    <!-- Header -->
    <header class="admin-header">
        <div class="header-left">Threads & Co.</div>
        <div class="header-center">Add New Product</div>
        <div class="header-right-notification"><i class="fas fa-bell notification-icon"></i></div>
        <div class="header-right-user">
            <a href="${pageContext.request.contextPath}/adminLogout" class="user-link"><i class="fas fa-user user-icon"></i></a>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <section class="add-product-section">
            <h2>Add New Product</h2>
            
            <!-- Success/Error Messages -->
            <% if(request.getAttribute("message") != null) { %>
                <div class="alert <%= request.getAttribute("messageType").equals("success") ? "alert-success" : "alert-danger" %>">
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>
            
            <form class="add-product-form"
                action="${pageContext.request.contextPath}/AddProduct"
                method="post"
                enctype="multipart/form-data">

                <div class="form-group">
                    <label for="productId">Product ID</label>
                    <input type="text" id="productId" name="ProductID" placeholder="Enter product ID" required />
                </div>

                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" id="productName" name="ProductName" placeholder="Enter product name" required />
                </div>

                <div class="form-group">
                    <label for="productCategory">Category</label>
                    <select id="productCategory" name="ProductCategory" required>
                        <option value="">Select category</option>
                        <option value="Men">Men</option>
                        <option value="Women">Women</option>
                        <option value="Kids">Kids</option>
                        <option value="Accessories">Accessories</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="productDescription">Description</label>
                    <textarea id="productDescription" name="ProductDescription" placeholder="Enter product description" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="productPrice">Price</label>
                    <div class="price-input">
                        <span class="currency-symbol">$</span>
                        <input type="number" step="0.01" id="productPrice" name="ProductPrice" placeholder="Enter price" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="productStock">Stock Quantity</label>
                    <input type="number" id="productStock" name="ProductStockQuantity" placeholder="Enter stock quantity" required />
                </div>

                <div class="form-group">
                    <label>Size</label>
                    <div class="size-options">
                        <label class="size-option">
                            <input type="checkbox" name="ProductSize" value="XS"> XS
                        </label>
                        <label class="size-option">
                            <input type="checkbox" name="ProductSize" value="S"> S
                        </label>
                        <label class="size-option">
                            <input type="checkbox" name="ProductSize" value="M"> M
                        </label>
                        <label class="size-option">
                            <input type="checkbox" name="ProductSize" value="L"> L
                        </label>
                        <label class="size-option">
                            <input type="checkbox" name="ProductSize" value="XL"> XL
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productImage">Upload Image</label>
                    <div class="file-upload">
                        <input type="file" id="productImage" name="ProductImage" accept="image/*" />
                        <div class="file-preview" id="imagePreview">
                            <p>No image selected</p>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="reset" class="btn-reset">Reset</button>
                    <button type="submit" class="btn-submit">Add Product</button>
                </div>
            </form>
        </section>
    </main>

    <!-- Scripts -->
    <script>
        // Menu toggle functionality
        const menuToggle = document.getElementById("menu-toggle");
        const menuItems = document.getElementById("menu-items");

        menuToggle.addEventListener("click", (e) => {
            e.preventDefault();
            menuItems.classList.toggle("collapsed");
        });
        
        // Image preview functionality
        const imageInput = document.getElementById('productImage');
        const imagePreview = document.getElementById('imagePreview');
        
        imageInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.innerHTML = `<img src="${e.target.result}" alt="Preview">`;
                }
                reader.readAsDataURL(file);
            } else {
                imagePreview.innerHTML = `<p>No image selected</p>`;
            }
        });
    </script>

</body>
</html>