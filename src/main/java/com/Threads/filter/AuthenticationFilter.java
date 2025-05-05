package com.Threads.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.Threads.Util.CookieUtil;
import com.Threads.Util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";
    private static final String DASHBOARD = "/Dashboard";
    private static final String ADD_NEW_PRODUCT = "/addnewProduct";
    private static final String PRODUCT_LIST = "/ProductList";
    private static final String RECENT_ORDERS = "/RecentOrders";
    private static final String ABOUT_US = "/aboutus";
    private static final String CONTACT_US = "/contactus";
    private static final String FOUNDATION = "/foundation";
    private static final String PRODUCT_DETAILS = "/ProductDetails";
    private static final String PRODUCTS = "/Products";
    private static final String TERMS = "/terms";
    private static final String USER_PROFILE = "/userprofile";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        
        // Allow access to resources like images, CSS, JS, etc.
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css") || uri.endsWith(".js")) {
            chain.doFilter(request, response);
            return;
        }

        // Retrieve session data and cookie for role
        String sessionUsername = (String) SessionUtil.getAttribute(req, "username");
        String userRole = CookieUtil.getCookie(req, "role"); // Get the user role from cookie

        if (sessionUsername != null) {
            // User is logged in, based on role, we proceed accordingly.
            if ("admin".equals(userRole)) {
                // Admin is logged in
                if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                    res.sendRedirect(req.getContextPath() + DASHBOARD); // Redirect to Dashboard
                } else if (uri.endsWith(DASHBOARD) || uri.endsWith(ADD_NEW_PRODUCT) || uri.endsWith(PRODUCT_LIST)
                        || uri.endsWith(RECENT_ORDERS) || uri.endsWith(PRODUCT_DETAILS) || uri.endsWith(PRODUCTS)) {
                    chain.doFilter(request, response); // Allow access to admin pages
                } else if (uri.endsWith(ABOUT_US) || uri.endsWith(CONTACT_US) || uri.endsWith(FOUNDATION)
                        || uri.endsWith(TERMS)) {
                    chain.doFilter(request, response); // Admin can access public pages
                } else {
                    res.sendRedirect(req.getContextPath() + DASHBOARD); // Redirect any unknown pages to dashboard
                }
            } else if ("user".equals(userRole)) {
                // User is logged in
                if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                    res.sendRedirect(req.getContextPath() + HOME); // Redirect to home page if already logged in
                } else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(ABOUT_US) || uri.endsWith(CONTACT_US)
                        || uri.endsWith(FOUNDATION) || uri.endsWith(PRODUCTS) || uri.endsWith(PRODUCT_DETAILS)) {
                    chain.doFilter(request, response); // Allow access to public user pages
                } else if (uri.endsWith(USER_PROFILE)) {
                    chain.doFilter(request, response); // Allow access to user profile page
                } else {
                    res.sendRedirect(req.getContextPath() + HOME); // Redirect unknown pages to home
                }
            } else {
                // Invalid role or session
                res.sendRedirect(req.getContextPath() + LOGIN); // Redirect to login if session role is invalid
            }
        } else {
        	// Not logged in
        	if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)
        	    || uri.endsWith(ABOUT_US) || uri.endsWith(CONTACT_US) || uri.endsWith(FOUNDATION)
        	    || uri.endsWith(TERMS) || uri.endsWith(PRODUCTS) || uri.endsWith(PRODUCT_DETAILS)) {
        	    chain.doFilter(request, response); // Allow access to public pages
        	} else {
        	    res.sendRedirect(req.getContextPath() + LOGIN); // Redirect to login page if accessing protected routes
        	}
        }
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}
