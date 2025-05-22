// File: src/main/java/com/Threads/controller/Admin/DeleteProductController.java
package com.Threads.controller.Admin;

import com.Threads.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/deleteProduct")
public class DeleteProductController extends HttpServlet {
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
        
        if (productId != null && !productId.isEmpty()) {
            boolean success = productService.deleteProduct(productId);
            
            if (success) {
                request.getSession().setAttribute("message", "Product deleted successfully!");
                request.getSession().setAttribute("messageType", "success");
            } else {
                request.getSession().setAttribute("message", "Failed to delete product.");
                request.getSession().setAttribute("messageType", "danger");
            }
        }
        
        response.sendRedirect("products");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}