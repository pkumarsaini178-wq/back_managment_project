<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            position: relative;
            background: rgba(255, 255, 255, 0.2); /* transparent background */
            padding: 40px 35px;
            width: 380px;
            border-radius: 20px;
            backdrop-filter: blur(10px); /* blur effect for glassmorphism */
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            text-align: center;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.3); /* subtle border */
        }

        /* Animated gradient overlay decoration */
        .login-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(60deg, rgba(255,255,255,0.15), rgba(255,255,255,0) 70%);
            transform: rotate(45deg);
            pointer-events: none;
            animation: rotateBG 10s linear infinite;
        }

        @keyframes rotateBG {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #fff;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #f0f0f0;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid rgba(255,255,255,0.4);
            background: rgba(255,255,255,0.15); /* transparent input */
            font-size: 14px;
            color: #fff;
            outline: none;
            transition: 0.3s;
        }

        .input-group input::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .input-group input:focus {
            border-color: #fff;
            box-shadow: 0 0 10px rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.25);
        }

        .btn-login {
            width: 100%;
            background: rgba(37,117,252,0.8);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(37,117,252,0.4);
        }

        .btn-login:hover {
            background: rgba(37,117,252,1);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37,117,252,0.6);
        }

        .forgot-link {
            display: block;
            margin-top: 15px;
            font-size: 13px;
            color: #cce0ff;
            text-decoration: none;
            transition: 0.3s;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }
        .error-message {
    background-color: rgba(255, 0, 0, 0.2);
    color: #ff0000;
    padding: 10px;
    border-radius: 8px;
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
}
        
    </style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <div class="input-group">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn-login">Login</button>
        <a href="#" class="forgot-link">Forgot password?</a>
        <%
    String loginError = (String) session.getAttribute("loginError");
    if (loginError != null) {
%>
    <div style="color: red; margin-bottom: 15px; text-align:center; font-weight: bold;">
        <%= loginError %>
    </div>
<%
        session.removeAttribute("loginError"); 
    }
%>
        
    </form>
</div>

</body>
</html>
