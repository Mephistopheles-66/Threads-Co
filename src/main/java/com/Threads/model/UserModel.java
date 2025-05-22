package com.Threads.model;

public class UserModel {
    private int userId;
    private String role;
    private String userName;
    private String userPassword;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String address;

    // Default constructor
    public UserModel() {
    }

    // Constructor with all fields except userId (for registration)
    public UserModel(String role, String userName, String userPassword, 
                     String firstName, String lastName, String email, 
                     String phoneNumber, String address) {
        this.role = role;
        this.userName = userName;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    // Constructor with all fields including userId (for database retrieval)
    public UserModel(int userId, String role, String userName, String userPassword, 
                     String firstName, String lastName, String email, 
                     String phoneNumber, String address) {
        this.userId = userId;
        this.role = role;
        this.userName = userName;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    // ✅ Getters and Setters
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getFirstName() {
        return firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    // Helper method to get full name
    public String getFullName() {
        return (firstName != null ? firstName : "") + " " + (lastName != null ? lastName : "");
    }

    // Validation methods
    public boolean isValidForRegistration() {
        return userName != null && !userName.trim().isEmpty() &&
               userPassword != null && !userPassword.trim().isEmpty() &&
               firstName != null && !firstName.trim().isEmpty() &&
               lastName != null && !lastName.trim().isEmpty() &&
               email != null && !email.trim().isEmpty() &&
               phoneNumber != null && !phoneNumber.trim().isEmpty() &&
               role != null && !role.trim().isEmpty() &&
               address != null && !address.trim().isEmpty();
    }

    @Override
    public String toString() {
        return "UserModel{" +
                "userId=" + userId +
                ", role='" + role + '\'' +
                ", userName='" + userName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        
        UserModel userModel = (UserModel) obj;
        return userId == userModel.userId &&
               userName != null ? userName.equals(userModel.userName) : userModel.userName == null;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        return result;
    }
}