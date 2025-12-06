package com.example.servlet;
import com.example.dao.ProductDAO; import com.example.model.Product;
import jakarta.servlet.*; import jakarta.servlet.http.*; import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", productDAO.getAllProducts());
        request.getRequestDispatcher("/product.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        double price=Double.parseDouble(request.getParameter("price"));
        productDAO.addProduct(new Product(0,name,quantity,price));
        response.sendRedirect("products");
    }
}
