package com.Threads.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * Utility class for managing session attributes.
 */
public class SessionUtil {

    /**
     * Sets an attribute in the session.
     *
     * @param request the HttpServletRequest object
     * @param key     the attribute key
     * @param value   the attribute value
     */
    public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        session.setAttribute(key, value);
    }

    /**
     * Gets an attribute from the session.
     *
     * @param request the HttpServletRequest object
     * @param key     the attribute key
     * @return the attribute value, or null if not found
     */
    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(key) : null;
    }

    /**
     * Removes an attribute from the session.
     *
     * @param request the HttpServletRequest object
     * @param key     the attribute key
     */
    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(key);
        }
    }

    /**
     * Invalidates the session.
     *
     * @param request the HttpServletRequest object
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}
