<%@ page contentType="text/html;charset=UTF-8" %>
<html><body><h1>Sales</h1>
<form method="post" action="sales">
Product ID: <input name="productId" type="number" required>
Quantity: <input name="quantity" type="number" required>
<button type="submit">Add Sale</button></form>
<ul><% for(Object s:(java.util.List)request.getAttribute("sales")){ %>
<li>Product ID: <%= ((com.example.model.Sale)s).getProductId() %> - Quantity: <%= ((com.example.model.Sale)s).getQuantity() %></li><% } %></ul>
<a href="dashboard">Back to Dashboard</a></body></html>
