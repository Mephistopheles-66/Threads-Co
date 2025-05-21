package com.Threads.model;

/**
 * UserModel class
 * Represents a user in the system
 */
public class UserModel {
    private int userID;
    private String role;
    private String userName;
    private String userPassword;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String address;
    
    /**
     * Default constructor
     */
    public UserModel() {
    }
    
    /**
     * Parameterized constructor
     */
    public UserModel(String role, String userName, String userPassword, String firstName, 
                String lastName, String email, String phoneNumber, String address) {
        this.role = role;
        this.userName = userName;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
    
    /**
     * Full constructor with userID
     */
    public UserModel(int userID, String role, String userName, String userPassword, String firstName, 
                String lastName, String email, String phoneNumber, String address) {
        this.userID = userID;
        this.role = role;
        this.userName = userName;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
    
    // Getters and Setters
    
    public int getUserID() {
        return userID;
    }
    
    public void setUserID(int userID) {
        this.userID = userID;
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
    
    /**
     * Returns the full name of the user
     */
    public String getFullName() {
        return firstName + " " + lastName;
    }
    
    @Override
    public String toString() {
        return "User [userID=" + userID + ", userName=" + userName + ", firstName=" + firstName + 
               ", lastName=" + lastName + ", email=" + email + ", role=" + role + "]";
    }
}