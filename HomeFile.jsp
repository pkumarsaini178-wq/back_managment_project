<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Public Bank - Transaction Management</title>
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

    header {
      background: #2c3e50;
      color: #fff;
      text-align: center;
      width: 100%;
      padding: 20px 0;
      font-size: 28px;
      font-weight: bold;
      letter-spacing: 2px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.3);
    }

    main {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 25px;
      padding: 30px;
    }

    .btn {
      display: inline-block;
      text-align: center;
      text-decoration: none;
      width: 260px;
      padding: 15px;
      border: none;
      border-radius: 12px;
      font-size: 18px;
      font-weight: bold;
      color: white;
      cursor: pointer;
      transition: 0.3s ease;
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }

    .btn:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 14px rgba(0,0,0,0.3);
    }

    .create { background: #27ae60; }
    .deposit { background: #2980b9; }
    .withdraw { background: #e67e22; }
    .search { background: #8e44ad; }
    .show { background: #16a085; }
    .delete { background: #c0392b; }

    footer {
      background: #2c3e50;
      color: #fff;
      text-align: center;
      padding: 15px;
      width: 100%;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <header>
    Public Bank - Transaction Management System
  </header>

  <main>
    <a href="CreateAccountFile.jsp" class="btn create"> Create Account</a>
    <a href="DipositFile.jsp" class="btn deposit"> Deposit Amount</a>
    <a href="WithdrowldFile.jsp" class="btn withdraw"> Withdraw Amount</a>
    <a href="SearchingFile.jsp" class="btn search"> Search Account</a>
    <a href="showDeatailFile.jsp" class="btn show"> Show Account Details</a>
    <a href="DeleteFile.jsp" class="btn delete"> Delete Account</a>
  </main>
  
   
  
  <footer>
    © 2025 Public Bank | Prototype UI Only
  </footer>
</body>
</html>
