<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank Signup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            position: relative;
            background: rgba(255, 255, 255, 0.2); /* transparent background */
            padding: 40px;
            width: 380px;
            border-radius: 20px;
            backdrop-filter: blur(10px); /* glass effect */
            box-shadow: 0 8px 30px rgba(0,0,0,0.3);
            text-align: center;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.3);
        }

        /* Optional subtle animated overlay for decoration */
        .container::before {
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

        .signup-container h2 {
            margin-bottom: 25px;
            color: #fff; /* changed to white for visibility on transparent background */
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
            padding: 10px;
            border-radius: 8px;
            border: 1px solid rgba(255,255,255,0.4); 
            background: rgba(255,255,255,0.15); 
            font-size: 14px;
            outline: none;
            color: #fff;
            transition: 0.3s;
        }

        .input-group input::placeholder {
            color: rgba(255,255,255,0.7);
        }

        .input-group input:focus {
            border-color: #ee0979;
            box-shadow: 0 0 8px rgba(238,9,121,0.5);
            background: rgba(255,255,255,0.25);
        }

        .btn-signup {
            width: 100%;
            background: rgba(238,9,121,0.8);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(238,9,121,0.4);
        }

        .btn-signup:hover {
            background: rgba(238,9,121,1);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(238,9,121,0.6);
        }

        .extra-links {
            margin-top: 20px;
            font-size: 14px;
            color: #fff;
        }

        .extra-links a {
            color: #ee0979;
            text-decoration: none;
            margin: 0 5px;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Create Your Bank Account</h2>
    <form action="SignServelet" method="post">
        <div class="input-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
        </div>
        <div class="input-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="input-group">
            <label for="confirm">Confirm Password</label>
            <input type="password" id="confirm" name="confirm" placeholder="Re-enter your password" required>
        </div>
        
        <button type="submit" class="btn-signup">Sign Up</button>
    </form>

    <div class="extra-links">
        <p>Already have an account? <a href="LoginFile.jsp">Login</a></p>
    </div>
</div>

</body>
</html>
