<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
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
            max-width: 700px;
            margin: auto;
            background: white;
            color: #1f2937;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.3);
        }

        h1 {
            text-align: center;
        }

        form {
            display: grid;
            gap: 12px;
            margin: 25px 0;
        }

        input, button {
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
        }

        button {
            background: #2563eb;
            color: white;
            font-weight: bold;
            border: none;
        }

        button:hover {
            background: #1d4ed8;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background: #f3f4f6;
            margin: 8px 0;
            padding: 10px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            color: #2563eb;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>📦 Products</h1>

    <form method="post" action="products">
        <input name="name" placeholder="Product Name" required>
        <input name="quantity" type="number" placeholder="Quantity" required>
        <input name="price" type="number" step="0.01" placeholder="Price" required>
        <button type="submit">Add Product</button>
    </form>

    <ul>
        <% for(Object p:(java.util.List)request.getAttribute("products")){ %>
        <li>
            <span><%= ((com.example.model.Product)p).getName() %></span>
            <strong><%= ((com.example.model.Product)p).getQuantity() %></strong>
        </li>
        <% } %>
    </ul>

    <a href="dashboard">⬅ Back to Dashboard</a>
</div>

</body>
</html>

