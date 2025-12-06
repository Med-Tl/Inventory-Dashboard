package com.example.servlet;
import com.example.dao.ProductDAO; import com.example.dao.SaleDAO;
import javax.servlet.*; import javax.servlet.http.*; import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    ProductDAO productDAO = new ProductDAO(); SaleDAO saleDAO = new SaleDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", productDAO.getAllProducts());
        request.setAttribute("sales", saleDAO.getAllSales());
        request.getRequestDispatcher("/dashboard.jsp").forward(request,response);
    }
}
