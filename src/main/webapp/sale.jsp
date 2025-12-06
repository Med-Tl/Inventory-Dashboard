<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sales</title>
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
            background: #16a34a;
            color: white;
            font-weight: bold;
            border: none;
        }

        button:hover {
            background: #15803d;
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
    <h1>💰 Sales</h1>

    <form method="post" action="sales">
        <input name="productId" type="number" placeholder="Product ID" required>
        <input name="quantity" type="number" placeholder="Quantity" required>
        <button type="submit">Add Sale</button>
    </form>

    <ul>
        <% for(Object s:(java.util.List)request.getAttribute("sales")){ %>
        <li>
            <span>Product ID: <%= ((com.example.model.Sale)s).getProductId() %></span>
            <strong><%= ((com.example.model.Sale)s).getQuantity() %></strong>
        </li>
        <% } %>
    </ul>

    <a href="dashboard">⬅ Back to Dashboard</a>
</div>

</body>
</html>

