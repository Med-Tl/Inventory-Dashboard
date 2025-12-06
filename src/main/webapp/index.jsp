<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DevOps Inventory</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            color: white;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            color: #1f2937;
            padding: 50px;
            border-radius: 12px;
            text-align: center;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        h1 {
            margin-bottom: 15px;
        }

        p {
            color: #6b7280;
            margin-bottom: 30px;
        }

        a {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        a:hover {
            background: #1d4ed8;
            transform: scale(1.05);
        }

        .footer {
            margin-top: 25px;
            font-size: 13px;
            color: #9ca3af;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>🚀 DevOps Inventory App</h1>
    <p>CI/CD Powered • Secure • Monitored • Automated</p>

    <a href="${pageContext.request.contextPath}/dashboard">
        Go to Dashboard
    </a>

    <div class="footer">
        Built with Jenkins, SonarQube, OWASP ZAP, Prometheus & Grafana
    </div>
</div>

</body>
</html>

