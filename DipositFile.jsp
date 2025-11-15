<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deposit Money</title>
    <style>
        /* Page Background */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Card */
        .container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            max-width: 400px;
            width: 100%;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 26px;
        }

        /* Labels & Inputs */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 12px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
        }

        /* Button */
        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(90deg, #36D1DC 0%, #5B86E5 100%);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: linear-gradient(90deg, #5B86E5 0%, #36D1DC 100%);
            transform: translateY(-3px);
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #7f8c8d;
        }
             .back-btn {
    display: inline-block;
    text-decoration: none;
    background: #3498db;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    transition: background 0.3s ease;
}
.back-btn:hover {
    background: #2980b9;
}
    </style>
</head>
<body>

<div class="container">
    <form action="DipostiSeverlet" method="post">
        <h2>Deposit Money</h2>

        <label for="account_no">Account Number</label>
        <input type="text" id="account_no" name="account_no" placeholder="Enter Account Number" required>

        <label for="name">Account Holder Name</label>
        <input type="text" id="name" name="name" placeholder="Enter Name" required>

        <label for="deposit_amount">Deposit Amount</label>
        <input type="number" id="deposit_amount" name="deposit_amount" placeholder="Enter Deposit Amount" required>

        <button type="submit">Submit Deposit</button>
    </form>

    <div class="footer">
        &copy; 2025 MyBank. All rights reserved.
    </div>
     <a href="HomeFile.jsp" class="back-btn"> Back</a>
</div>

</body>
</html>
