<%@ page contentType="text/html;charset=UTF-8" %>
<html><body><h1>Products</h1>
<form method="post" action="products">
Name: <input name="name" required> Quantity: <input name="quantity" type="number" required>
Price: <input name="price" type="number" step="0.01" required>
<button type="submit">Add Product</button></form>
<ul><% for(Object p:(java.util.List)request.getAttribute("products")){ %>
<li><%= ((com.example.model.Product)p).getName() %> - <%= ((com.example.model.Product)p).getQuantity() %></li><% } %></ul>
<a href="dashboard">Back to Dashboard</a></body></html>
