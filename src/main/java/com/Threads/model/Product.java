package com.Threads.model;

import java.io.InputStream;

public class Product {
    private String id;
    private String name;
    private String category;
    private String description;
    private double price;
    private int stock;
    private String size;
    private InputStream image;

    // Constructor with all fields
    public Product(String id, String name, String category, String description,
                   double price, int stock, String size, InputStream image) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.size = size;
        this.image = image;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }
    public int getStock() { return stock; }
    public String getSize() { return size; }
    public InputStream getImage() { return image; }
}