<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .login-container a {
            text-decoration: none;
            color: #007BFF;
            font-size: 14px;
        }

        .login-container a:hover {
            text-decoration: underline;
        }

        .login-footer {
            margin-top: 20px;
            font-size: 14px;
        }

        .login-footer button {
            background-color: transparent;
            border: none;
            color: #007BFF;
            cursor: pointer;
            font-size: 14px;
            text-decoration: underline;
        }

        .login-footer button:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Quên Mật Khẩu</h2>
    <form action="/resetpassword" method="POST">
        <input type="text" placeholder="Mã OTP" name="otp" required><br>
        <input type="text" placeholder="password" name="password" required><br>

        <input type="submit" name="submit" value="Gửi">
    </form>


</div>

</body>
</html>