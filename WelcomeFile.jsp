<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome - My Bank</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
            justify-content: space-between; 
        }
        .welcome-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 50px;
            margin-top: 20px;
            width: 600px;
            text-align: center;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            backdrop-filter: blur(8px);
        }
        .welcome-container h1 {
            font-size: 40px;
            margin-bottom: 20px;
            color: #f8f9fa;
        }
        .welcome-container p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #dfe6f1;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }
        .btn-primary {
            background: #ff6a00;
            color: white;
        }
        .btn-primary:hover {
            background: #e65c00;
        }
        .btn-secondary {
            background: #0dcaf0;
            color: #fff;
        }
        .btn-secondary:hover {
            background: #0bb2d6;
        }
        footer {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 16px;
            padding: 15px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            text-align: center;
            margin-bottom: 20px; /* space from bottom */
        }
    </style>
</head>
<body>

<div class="welcome-container">
    <h1>🏦 Welcome to My Public Bank</h1>
    <p>Hello, <b><%= request.getParameter("username") != null ? request.getParameter("username") : "Valued Customer" %></b>!<br>
       You have successfully logged into your online banking account. Our platform ensures safe, fast, and convenient banking services. Explore account management, transfers, and financial tools designed to simplify your banking experience efficiently and securely.</p>

    <a href="LoginFile.jsp" class="btn btn-primary">Login</a>
    <a href="SingeFile.jsp" class="btn btn-secondary">Sign Up</a>
    
    <footer>
    &copy; 2025 My Public Bank. All rights reserved.
</footer>
</div>



</body>
</html>
