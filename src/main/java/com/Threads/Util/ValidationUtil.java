package com.Threads.Util;

import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;

import jakarta.servlet.http.Part;

public class ValidationUtil {

    /**
     * Checks if a string is null or empty after trimming.
     */
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Validates if a string contains only letters (A-Z, a-z).
     */
    public static boolean isAlphabetic(String value) {
        return value != null && value.matches("^[a-zA-Z]+$");
    }

    /**
     * Validates if a string starts with a letter and contains only alphanumeric characters.
     */
    public static boolean isAlphanumericStartingWithLetter(String value) {
        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
    }

    /**
     * Validates basic gender input: "male" or "female" (case insensitive).
     */
    public static boolean isValidGender(String value) {
        return value != null && (value.equalsIgnoreCase("male") || value.equalsIgnoreCase("female"));
    }

    /**
     * Validates if an email is in proper format.
     */
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w.-]+@([\\w-]+\\.)+[a-zA-Z]{2,}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    /**
     * Validates Nepalese-style mobile number starting with "98" followed by 8 digits.
     */
    public static boolean isValidPhoneNumber(String number) {
        return number != null && number.matches("^98\\d{8}$");
    }

    /**
     * Validates password format:
     * - At least 8 characters
     * - At least one uppercase letter
     * - At least one digit
     * - At least one special character
     */
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password != null && password.matches(passwordRegex);
    }

    /**
     * Validates if uploaded file has a valid image extension.
     */
    public static boolean isValidImageExtension(Part imagePart) {
        if (imagePart == null || isNullOrEmpty(imagePart.getSubmittedFileName())) {
            return false;
        }
        String fileName = imagePart.getSubmittedFileName().toLowerCase();
        return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")
                || fileName.endsWith(".png") || fileName.endsWith(".gif");
    }

    /**
     * Validates whether two passwords match exactly.
     */
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }

    /**
     * Checks if the user is at least 16 years old based on their date of birth.
     */
    public static boolean isAgeAtLeast16(LocalDate dob) {
        if (dob == null) return false;
        return Period.between(dob, LocalDate.now()).getYears() >= 16;
    }
}
