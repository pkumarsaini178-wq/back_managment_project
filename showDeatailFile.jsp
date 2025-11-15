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
        
    </style>
</head>
<body>
<div class="container">
    <h1>Account Holder Details</h1>

    <%
        request.setAttribute("message", "Successful check Details"); // set once outside loop
        String url = "jdbc:mysql://localhost:3306/bankdb";
        String user = "root";
        String password = "221579";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT account_no, name, email, mobile, address, pincode, aadhaar, pan, deposit_amount FROM accounts");
    %>

    <table>
        <tr>
            <th>Account_no.</th>
            <th>Account Holder Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Address</th>
            <th>PinCode</th>
            <th>Addhaar_no.</th>
            <th>Pan_no.</th>
            <th>Deposit Amount</th>
        </tr>

        <%
            while(rs.next()) {
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
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
        %>
        <tr>
            <td colspan="9" style="color:red;">Error: <%= e.getMessage() %></td>
        </tr>
        <%
        }
        %>
    </table>

    <a href="HomeFile.jsp" class="back-btn"> Back</a>
    <p><%= request.getAttribute("message") %></p>

</div>
</body>
</html>
