// File: src/main/java/com/Threads/controller/Admin/EditProductController.java
package com.Threads.controller.Admin;

import com.Threads.model.Product;
import com.Threads.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/admin/editProduct")
@MultipartConfig(maxFileSize = 16177215)
public class EditProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productId = request.getParameter("id");
        
        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("products");
            return;
        }
        
        Product product = productService.getProductById(productId);
        
        if (product == null) {
            response.sendRedirect("products");
            return;
        }
        
        request.setAttribute("product", product);
        request.getRequestDispatcher("/WEB-INF/pages/Admin/editProductForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("ProductID");
        String name = request.getParameter("ProductName");
        String category = request.getParameter("ProductCategory");
        String description = request.getParameter("ProductDescription");
        double price = Double.parseDouble(request.getParameter("ProductPrice"));
        int stock = Integer.parseInt(request.getParameter("ProductStockQuantity"));

        // Handle multiple sizes
        String[] sizes = request.getParameterValues("ProductSize");
        StringBuilder sizeBuilder = new StringBuilder();
        if (sizes != null) {
            for (String s : sizes) {
                sizeBuilder.append(s).append(",");
            }
        }
        String size = sizeBuilder.toString().replaceAll(",$", "");

        // Handle image
        Part filePart = request.getPart("ProductImage");
        InputStream imageStream = null;
        if (filePart != null && filePart.getSize() > 0) {
            imageStream = filePart.getInputStream();
        }

        // Create Product object
        Product product = new Product(id, name, category, description, price, stock, size, imageStream);

        boolean success = productService.updateProduct(product);

        if (success) {
            request.setAttribute("message", "Product updated successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Failed to update product.");
            request.setAttribute("messageType", "danger");
        }

        // Redirect to product list
        response.sendRedirect("products");
    }
}