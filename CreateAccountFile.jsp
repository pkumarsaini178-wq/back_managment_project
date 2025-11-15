<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Public Bank - Create Account</title>
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
      background: rgba(44, 62, 80, 0.8); /* semi-transparent */
      color: #fff;
      text-align: center;
      width: 100%;
      padding: 20px 0;
      font-size: 26px;
      font-weight: bold;
      letter-spacing: 2px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.3);
      backdrop-filter: blur(5px);
    }

    main {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 30px;
      width: 100%;
    }

    .container {
      position: relative;
      background: rgba(255, 255, 255, 0.2); /* transparent */
      backdrop-filter: blur(10px);
      padding: 30px 40px;
      border-radius: 20px;
      box-shadow: 0px 8px 30px rgba(0,0,0,0.3);
      width: 420px;
      overflow: hidden;
      border: 1px solid rgba(255,255,255,0.3);
    }

    /* Subtle animated overlay for decoration */
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

    .container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #fff;
      font-size: 22px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
      color: #f0f0f0; /* white for visibility */
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      border-radius: 10px;
      border: 1px solid rgba(255,255,255,0.4);
      background: rgba(255,255,255,0.15); /* transparent input */
      font-size: 15px;
      outline: none;
      color: #fff;
      transition: border-color 0.3s ease, background 0.3s ease;
    }

    input::placeholder, textarea::placeholder {
      color: rgba(255,255,255,0.7);
    }

    input:focus, textarea:focus {
      border-color: #27ae60;
      background: rgba(255,255,255,0.25);
      box-shadow: 0 0 8px rgba(39,174,96,0.5);
    }

    textarea {
      resize: none;
    }

    .btn {
      width: 100%;
      padding: 12px;
      background: rgba(39, 174, 96, 0.8);
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      margin-top: 10px;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(39,174,96,0.4);
    }

    .btn:hover {
      background: rgba(39,174,96,1);
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(39,174,96,0.6);
    }

    footer {
      background: rgba(44,62,80,0.8);
      color: #fff;
      text-align: center;
      padding: 15px;
      width: 100%;
      font-size: 14px;
      backdrop-filter: blur(5px);
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
  <header>Public Bank - Create Account</header>
  <main>
    <div class="container">
      <h2>Account Registration</h2>
      <form action="bank" method="Post">
        <div class="form-group">
          <label for="name">Account Holder Name</label>
          <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
          <label for="email">Account Holder Email</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="mobile">Mobile Number</label>
          <input type="tel" id="mobile" name="mobile" required>
        </div>
        <div class="form-group">
          <label for="address">Address</label>
          <textarea id="address" name="address" rows="3" required></textarea>
        </div>
        <div class="form-group">
          <label for="pincode">Pincode</label>
          <input type="text" id="pincode" name="pincode" required>
        </div>
        <div class="form-group">
          <label for="aadhaar">Aadhaar Number</label>
          <input type="text" id="aadhaar" name="aadhaar" required>
        </div>
        <div class="form-group">
          <label for="pan">PAN Card Number</label>
          <input type="text" id="pan" name="pan" required>
         
         
        </div>
         <div class="form-group">
          <label for="Diposit_Amount">Diposit_Amount</label>
          <input type="text" id="Diposit_Amount" name="Diposit_Amount" required>
         
         
        </div>
        <button type="submit" class="btn">Create Account</button>
      </form>
    </div>
  </main>
   <a href="HomeFile.jsp" class="back-btn"> Back</a>
  <footer>© 2025 Public Bank</footer>
</body>
</html>
