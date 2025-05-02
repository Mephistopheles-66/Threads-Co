package com.Threads.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Utility class for handling cookies.
 */
public class CookieUtil {

    /**
     * Adds a cookie to the response.
     *
     * @param response HttpServletResponse object
     * @param name     Cookie name
     * @param value    Cookie value
     * @param maxAge   Lifetime in seconds
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/"); // Accessible across the whole application
        cookie.setMaxAge(maxAge); // Lifetime of the cookie
        cookie.setHttpOnly(true); // Prevents JavaScript access (Security feature)
        cookie.setSecure(true); // Only send the cookie over HTTPS (Security feature)
        response.addCookie(cookie);
    }

    /**
     * Retrieves a cookie by name from the request.
     *
     * @param request HttpServletRequest object
     * @param name    Cookie name
     * @return Cookie value, or null if not found
     */
    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies(); // Get cookies from the request
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue(); // Correctly retrieve the cookie's value
                }
            }
        }
        return null; // Return null if cookie is not found
    }

    /**
     * Deletes a cookie by name.
     *
     * @param response HttpServletResponse object
     * @param name     Cookie name
     */
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null); // Set value to null to delete it
        cookie.setPath("/"); // Cookie will be deleted globally
        cookie.setMaxAge(0); // Set the max age to 0 to delete the cookie
        cookie.setHttpOnly(true); // Securely delete the cookie
        cookie.setSecure(true); // Securely delete the cookie over HTTPS
        response.addCookie(cookie);
    }
}
