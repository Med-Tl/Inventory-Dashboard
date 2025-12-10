<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Inventory Dashboard</title>

    <!-- BOOTSTRAP -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- ICONS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- CHART.JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body { background: #f6f7fb; }
        .sidebar {
            height: 100vh;
            background: #1e1e2d;
            color: white;
        }
        .sidebar a {
            color: #c8c8d4;
            text-decoration: none;
            display: block;
            padding: 12px 20px;
        }
        .sidebar a:hover {
            background: #3b3b55;
            color: white;
        }
        .dashboard-card {
            border-radius: 14px;
            padding: 25px;
            box-shadow: 0px 4px 14px rgba(0,0,0,0.06);
            background: white;
        }
        .table-card {
            border-radius: 14px;
            box-shadow: 0px 4px 14px rgba(0,0,0,0.05);
            padding: 20px;
            background: white;
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">

        <!-- SIDEBAR -->
        <div class="col-2 sidebar">
            <h3 class="text-center mt-4">Inventory</h3>
            <hr style="border-color:#4b4b61">

            <a href="#"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a>
            <a href="#"><i class="bi bi-box-seam me-2"></i> Products</a>
            <a href="#"><i class="bi bi-tags me-2"></i> Categories</a>
            <a href="#"><i class="bi bi-people me-2"></i> Users</a>

            <hr style="border-color:#4b4b61">
            <a href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i> Logout</a>
        </div>

        <!-- MAIN CONTENT -->
        <div class="col-10 p-4">
            <h2 class="fw-bold mb-4">Welcome, ${username}</h2>

            <!-- SUMMARY CARDS -->
            <div class="row mb-4">

                <div class="col-md-4 mb-3">
                    <div class="dashboard-card">
                        <h4><i class="bi bi-box-seam text-primary"></i> Total Products</h4>
                        <h2 class="fw-bold">${totalProducts}</h2>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="dashboard-card">
                        <h4><i class="bi bi-exclamation-circle text-warning"></i> Low Stock</h4>
                        <h2 class="fw-bold">${lowStock}</h2>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="dashboard-card">
                        <h4><i class="bi bi-tags text-success"></i> Categories</h4>
                        <h2 class="fw-bold">${totalCategories}</h2>
                    </div>
                </div>
            </div>

            <!-- CHART SECTION -->
            <div class="dashboard-card mb-4">
                <h5 class="fw-bold mb-3">Products Overview</h5>
                <canvas id="inventoryChart" height="100"></canvas>
            </div>

            <!-- TABLE SECTION -->
            <div class="table-card">
                <h5 class="fw-bold mb-3">Latest Products</h5>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Qty</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${products}">
                            <tr>
                                <td>${p.name}</td>
                                <td>${p.quantity}</td>
                                <td>${p.category}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<!-- CHART JS SCRIPT -->
<script>
    const ctx = document.getElementById('inventoryChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Products', 'Low Stock', 'Categories'],
            datasets: [{
                label: 'Inventory Stats',
                data: [${totalProducts}, ${lowStock}, ${totalCategories}],
                borderWidth: 1
            }]
        },
        options: { responsive: true }
    });
</script>

</body>
</html>
