package com.example.servlet;

import com.example.dao.UserDAO;
import com.example.model.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ LoginServlet CALLED");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("➡ Username received: " + username);
        System.out.println("➡ Password received: " + password);

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {
            System.out.println("✅ LOGIN SUCCESS | Role = " + user.getRole());
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // ✅ Redirect to servlet URL, not JSP
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            System.out.println("❌ LOGIN FAILED (User = null)");
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=true");
        }
    }
}
