package com.Threads.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * Utility class for session management
 */
public class SessionUtil {
    
    /**
     * Get a session attribute
     * 
     * @param request The HttpServletRequest
     * @param name The attribute name
     * @return The attribute value or null if not found
     */
    public static Object getAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(name);
        }
        return null;
    }
    
    /**
     * Set a session attribute
     * 
     * @param request The HttpServletRequest
     * @param name The attribute name
     * @param value The attribute value
     */
    public static void setAttribute(HttpServletRequest request, String name, Object value) {
        HttpSession session = request.getSession(true);
        session.setAttribute(name, value);
    }
    
    /**
     * Remove a session attribute
     * 
     * @param request The HttpServletRequest
     * @param name The attribute name
     */
    public static void removeAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(name);
        }
    }
    
    /**
     * Check if a session attribute exists
     * 
     * @param request The HttpServletRequest
     * @param name The attribute name
     * @return true if exists, false otherwise
     */
    public static boolean hasAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(name) != null;
        }
        return false;
    }
    
    /**
     * Invalidate the current session
     * 
     * @param request The HttpServletRequest
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}