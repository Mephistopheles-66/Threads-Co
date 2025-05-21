package com.Threads.model;

public class Product {
	private String productId;
	private String productName;
	private String productPrice;
	private String productBrand;
	private String productImage;

	public Product(String productId, String productName, String productPrice, String productBrand,
			String productImage) {
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productBrand = productBrand;
		this.productImage = productImage;
	}	
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
}
