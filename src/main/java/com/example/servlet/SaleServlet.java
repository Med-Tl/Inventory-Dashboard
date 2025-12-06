package com.example.servlet;

import com.example.dao.SaleDAO;
import com.example.model.Sale;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/sale")
public class SaleServlet extends HttpServlet {

    private final SaleDAO dao = new SaleDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("sales", dao.getAllSales());
        req.getRequestDispatcher("sale.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String product = req.getParameter("product");
        int amount = Integer.parseInt(req.getParameter("amount"));

        dao.addSale(new Sale(product, amount));

        resp.sendRedirect("sale");
    }
}

