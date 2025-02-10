<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đăng Ký</h2>
    <form id="registrationForm" method="post" action="">

        <div class="form-group">
            <label for="name">Họ và tên</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="username">Tên tài khoản</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">Xác nhận mật khẩu</label>
            <input type="password" id="confirm-password" name="confirm-password" required>
        </div>
        <div id="error-message" class="error-message" style="display: none;">
            Mật khẩu và xác nhận mật khẩu không khớp!
        </div>
        <button type="submit">Đăng Ký</button>
    </form>
</div>

<script>
    const form = document.getElementById('registrationForm');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirm-password');
    const errorMessage = document.getElementById('error-message');

    form.addEventListener('submit', function (e) {
        if (password.value !== confirmPassword.value) {
            e.preventDefault(); // Ngăn form gửi dữ liệu
            errorMessage.style.display = 'block'; // Hiển thị lỗi
        } else {
            errorMessage.style.display = 'none'; // Ẩn lỗi
        }
    });
</script>
</body>
</html>




