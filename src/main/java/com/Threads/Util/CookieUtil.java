package com.Threads.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Utility class for cookie management
 */
public class CookieUtil {
    
    /**
     * Add a cookie
     * 
     * @param response The HttpServletResponse
     * @param name The cookie name
     * @param value The cookie value
     * @param maxAge The cookie max age in seconds (0 for session cookie)
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        cookie.setMaxAge(maxAge * 24 * 60 * 60); // Convert days to seconds
        response.addCookie(cookie);
    }
    
    /**
     * Get a cookie value
     * 
     * @param request The HttpServletRequest
     * @param name The cookie name
     * @return The cookie value or null if not found
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    
    /**
     * Get a cookie
     * 
     * @param request The HttpServletRequest
     * @param name The cookie name
     * @return The cookie or null if not found
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }
    
    /**
     * Update a cookie value
     * 
     * @param request The HttpServletRequest
     * @param response The HttpServletResponse
     * @param name The cookie name
     * @param value The new value
     * @param maxAge The max age in seconds
     * @return true if updated, false if cookie not found
     */
    public static boolean updateCookie(HttpServletRequest request, HttpServletResponse response, 
                                    String name, String value, int maxAge) {
        Cookie cookie = getCookie(request, name);
        if (cookie != null) {
            cookie.setValue(value);
            cookie.setPath("/");
            cookie.setMaxAge(maxAge * 24 * 60 * 60); // Convert days to seconds
            response.addCookie(cookie);
            return true;
        }
        return false;
    }
    
    /**
     * Delete a cookie
     * 
     * @param request The HttpServletRequest
     * @param response The HttpServletResponse
     * @param name The cookie name
     */
    public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String name) {
        Cookie cookie = getCookie(request, name);
        if (cookie != null) {
            cookie.setValue("");
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
}