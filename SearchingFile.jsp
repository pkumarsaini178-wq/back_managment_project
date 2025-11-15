<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Holder Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            padding: 25px;
            overflow-x: auto;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background: #3498db;
            color: white;
        }
        tr:nth-child(even) {
            background: #f8f9fa;
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
        input[type="text"], button {
            display: block;
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #e74c3c;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Account Holder Details</h1>

    
      <form method="post">
    <h2>Search Account</h2>
    <label for="account_no">Account Number</label>
    <input type="text" id="account_no" name="account_no" placeholder="Enter Account Number" required>

    <label for="name">Account Holder Name</label>
    <input type="text" id="name" name="name" placeholder="Enter Name" required>

    <button type="submit">Search Account</button>
</form>
    

    <%
        // ✅ JDBC Connection Setup
        String url = "jdbc:mysql://localhost:3306/bankdb";
        String user = "root";
        String password = "221579";

        // ✅ Get Parameters from Form
        String acc_no = request.getParameter("account_no");
        String name = request.getParameter("name");

        if (acc_no != null && name != null) {
            try {
                double accno = Double.parseDouble(acc_no); // 🔍 Convert account number to double

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, password);

                // ✅ Use PreparedStatement for safety
                String query = "SELECT account_no, name, email, mobile, address, pincode, aadhaar, pan, deposit_amount FROM accounts WHERE account_no = ? AND name = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setDouble(1, accno);
                ps.setString(2, name);

                ResultSet rs = ps.executeQuery();
    %>

    <!-- ✅ Display Table -->
    <table>
        <tr>
            <th>Account_no.</th>
            <th>Account Holder Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Address</th>
            <th>PinCode</th>
            <th>Aadhaar_no.</th>
            <th>Pan_no.</th>
            <th>Deposit Amount</th>
        </tr>

        <%
            boolean found = false;
            while (rs.next()) {
                found = true;
        %>
        <tr>
            <td><%= String.format("%010d", rs.getLong("account_no")) %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("pincode") %></td>
            <td><%= rs.getString("aadhaar") %></td>
            <td><%= rs.getString("pan") %></td>
            <td><%= rs.getBigDecimal("deposit_amount") %></td>
        </tr>
        <%
            }
            if (!found) {
        %>
        <tr>
            <td colspan="9" style="color:red;">No matching account found.</td>
        </tr>
        <%
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
        %>
        <tr>
            <td colspan="9" style="color:red;">Error: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        }
    %>
    </table>

    <a href="HomeFile.jsp" class="back-btn">Back</a>
</div>
</body>
</html>
