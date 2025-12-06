<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            color: white;
            min-height: 100vh;
            padding: 40px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            color: #1f2937;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.3);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        h2 {
            border-bottom: 2px solid #2563eb;
            padding-bottom: 5px;
            margin-top: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background: #f3f4f6;
            margin: 10px 0;
            padding: 12px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
        }

        .links {
            text-align: center;
            margin-top: 40px;
        }

        a {
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 12px 26px;
            border-radius: 8px;
            font-weight: bold;
            margin: 10px;
            display: inline-block;
        }

        a:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>📊 Dashboard</h1>

    <h2>📦 Products</h2>
    <ul>
        <% for(Object p:(java.util.List)request.getAttribute("products")){ %>
        <li>
            <span><%= ((com.example.model.Product)p).getName() %></span>
            <strong><%= ((com.example.model.Product)p).getQuantity() %></strong>
        </li>
        <% } %>
    </ul>

    <h2>💰 Sales</h2>
    <ul>
        <% for(Object s:(java.util.List)request.getAttribute("sales")){ %>
        <li>
            <span>Product ID: <%= ((com.example.model.Sale)s).getProductId() %></span>
            <strong><%= ((com.example.model.Sale)s).getQuantity() %></strong>
        </li>
        <% } %>
    </ul>

    <div class="links">
        <a href="products">Manage Products</a>
        <a href="sales">Manage Sales</a>
    </div>
</div>

</body>
</html>

