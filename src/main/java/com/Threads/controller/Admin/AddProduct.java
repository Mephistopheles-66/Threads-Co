package com.Threads.controller.Admin;

import com.Threads.model.Product;
import com.Threads.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/AddProduct")
@MultipartConfig(maxFileSize = 16177215) // 16MB max
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        System.out.println("AddProduct servlet initialized");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Received product form submission");
        
        try {
            // Get form data
            String id = request.getParameter("ProductID");
            String name = request.getParameter("ProductName");
            String category = request.getParameter("ProductCategory");
            String description = request.getParameter("ProductDescription");
            
            // Parse numeric values with error handling
            double price = 0;
            try {
                price = Double.parseDouble(request.getParameter("ProductPrice"));
            } catch (NumberFormatException e) {
                System.err.println("Invalid price format: " + request.getParameter("ProductPrice"));
                throw new ServletException("Invalid price format", e);
            }
            
            int stock = 0;
            try {
                stock = Integer.parseInt(request.getParameter("ProductStockQuantity"));
            } catch (NumberFormatException e) {
                System.err.println("Invalid stock quantity format: " + request.getParameter("ProductStockQuantity"));
                throw new ServletException("Invalid stock quantity format", e);
            }

            // Handle multiple sizes
            String[] sizes = request.getParameterValues("ProductSize");
            StringBuilder sizeBuilder = new StringBuilder();
            if (sizes != null) {
                for (String s : sizes) {
                    sizeBuilder.append(s).append(",");
                }
                System.out.println("Sizes selected: " + sizeBuilder.toString());
            } else {
                System.out.println("No sizes selected");
            }
            String size = sizeBuilder.toString().replaceAll(",$", "");

            // Handle image
            Part filePart = request.getPart("ProductImage");
            InputStream imageStream = null;
            if (filePart != null && filePart.getSize() > 0) {
                imageStream = filePart.getInputStream();
                System.out.println("Image uploaded: " + filePart.getSubmittedFileName() + " (" + filePart.getSize() + " bytes)");
            } else {
                System.out.println("No image uploaded");
            }

            // Create Product object
            Product product = new Product(id, name, category, description, price, stock, size, imageStream);
            System.out.println("Product object created: " + product.getId() + " - " + product.getName());

            // Save to database
            boolean success = productService.addProduct(product);
            System.out.println("Product saved to database: " + success);

            if (success) {
                request.setAttribute("message", "Product added successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to add product.");
                request.setAttribute("messageType", "danger");
            }
        } catch (Exception e) {
            System.err.println("Error in AddProduct servlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("messageType", "danger");
        }

        // Forward back to the form
        request.getRequestDispatcher("/WEB-INF/pages/Admin/addProductForm.jsp").forward(request, response);
    }
}