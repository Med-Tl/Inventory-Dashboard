<%@ page contentType="text/html;charset=UTF-8" %>
<html><body><h1>Dashboard</h1>
<h2>Products</h2><ul><% for(Object p:(java.util.List)request.getAttribute("products")){ %>
<li><%= ((com.example.model.Product)p).getName() %> - <%= ((com.example.model.Product)p).getQuantity() %></li><% } %></ul>
<h2>Sales</h2><ul><% for(Object s:(java.util.List)request.getAttribute("sales")){ %>
<li>Product ID: <%= ((com.example.model.Sale)s).getProductId() %> - Quantity: <%= ((com.example.model.Sale)s).getQuantity() %></li><% } %></ul>
<a href="products">Manage Products</a> | <a href="sales">Manage Sales</a>
</body></html>
