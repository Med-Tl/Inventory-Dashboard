package com.example.servlet;
import com.example.dao.SaleDAO; import com.example.model.Sale;
import jakarta.servlet.*; import jakarta.servlet.http.*; import jakarta.servlet.annotation.*;
import java.io.IOException; import java.time.LocalDate;
@WebServlet("/sales")
public class SaleServlet extends HttpServlet {
    SaleDAO saleDAO = new SaleDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("sales", saleDAO.getAllSales());
        request.getRequestDispatcher("/sale.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId=Integer.parseInt(request.getParameter("productId"));
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        saleDAO.addSale(new Sale(0,productId,quantity,LocalDate.now()));
        response.sendRedirect("sales");
    }
}

