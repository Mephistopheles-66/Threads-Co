package com.Threads.service;

import com.Threads.model.Product;
import com.Threads.config.Dbconfig;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductService {

    private Connection getConnection() throws SQLException {
        return Dbconfig.getConnection();
    }

    public boolean addProduct(Product product) {
        String sql = "INSERT INTO Product (ProductID, ProductName, ProductCategory, ProductDescription, ProductPrice, ProductStockQuantity, ProductSize, ProductImage)"
        		+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection()) {
            System.out.println("Connected to database: " + !conn.isClosed());

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                System.out.println("Adding product: " + product.getId() + " - " + product.getName());

                stmt.setString(1, product.getId());
                stmt.setString(2, product.getName());
                stmt.setString(3, product.getCategory());
                stmt.setString(4, product.getDescription());
                stmt.setDouble(5, product.getPrice());
                stmt.setInt(6, product.getStock());
                stmt.setString(7, product.getSize());

                if (product.getImage() != null) {
                    stmt.setBlob(8, product.getImage());
                    System.out.println("Image included in product");
                } else {
                    stmt.setNull(8, Types.BLOB);
                    System.out.println("No image for product");
                }

                int rowsAffected = stmt.executeUpdate();
                System.out.println("Rows affected by insert: " + rowsAffected);
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            System.err.println("SQL ERROR in addProduct: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("GENERAL ERROR in addProduct: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getAllproduct() {
        List<Product> product = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                product.add(extractProductFromResultSet(rs));
            }

            System.out.println("Retrieved " + product.size() + " product from database");

        } catch (SQLException e) {
            System.err.println("SQL ERROR in getAllproduct: " + e.getMessage());
            e.printStackTrace();
        }

        return product;
    }

    public Product getProductById(String id) {
        String sql = "SELECT * FROM product WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Product product = extractProductFromResultSet(rs);
                    System.out.println("Retrieved product: " + product.getId());
                    return product;
                }
            }

        } catch (SQLException e) {
            System.err.println("SQL ERROR in getProductById: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("No product found with ID: " + id);
        return null;
    }

    public List<Product> getproductByCategory(String category) {
        List<Product> product = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, category);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    product.add(extractProductFromResultSet(rs));
                }
            }

            System.out.println("Retrieved " + product.size() + " product in category: " + category);

        } catch (SQLException e) {
            System.err.println("SQL ERROR in getproductByCategory: " + e.getMessage());
            e.printStackTrace();
        }

        return product;
    }

    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String name = rs.getString("name");
        String category = rs.getString("category");
        String description = rs.getString("description");
        double price = rs.getDouble("price");
        int stock = rs.getInt("stock");
        String size = rs.getString("size");

        // Handle image retrieval
        Blob blob = rs.getBlob("image");
        InputStream imageStream = null;
        if (blob != null) {
            imageStream = blob.getBinaryStream();
        }

        return new Product(id, name, category, description, price, stock, size, imageStream);
    }
}
