package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.example.model.User;

public class AuthFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        String uri = request.getRequestURI();

        if (user == null && !uri.endsWith("index.jsp") && !uri.endsWith("login")) {
            response.sendRedirect("index.jsp");
            return;
        }

        if (uri.contains("sale") && user != null && !user.getRole().equals("ADMIN")) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

        chain.doFilter(req, res);
    }
}
