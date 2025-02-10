<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="vi">
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
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
        .container {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            border-radius: 8px;
        }
        .menu {
            display: flex;
            justify-content: space-around;
            background: #007bff;
            padding: 10px;
            border-radius: 8px 8px 0 0;
        }
        .menu button {
            background: none;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .menu button:hover {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }
        .content {
            display: none;
            padding: 20px;
        }
        .active {
            display: block;
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

<div class="container">
    <!-- Menu -->
    <div class="menu">

        <button onclick="showTab('profile')">Thông tin cá nhân</button>
        <button onclick="showTab('edit')">Sửa thông tin</button>
        <button onclick="showTab('orders')">Đơn hàng</button>
        <button onclick="showHome()">Home</button>
        <button onclick="logout()">Đăng xuất</button>
    </div>

    <!-- Nội dung các tab -->
    <div id="profile" class="content active">
        <h2>Thông tin cá nhân</h2>
        <p><strong>Họ và tên:</strong> ${user.name}</p>
        <p><strong>Email:</strong> ${user.email}</p>
        <p><strong>Số điện thoại:</strong> ${user.phone}</p>
    </div>

    <div id="edit" class="content">
        <h2>Chỉnh sửa thông tin</h2>
        <form id="registrationForm" method="post" action="/update-info">

            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name"  value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value= "${user.phone}" required>
            </div>
            <div class="form-group">
                <label for="username">Tên tài khoản</label>
                <input type="text" id="username" name="accountname" value="${user.accountname}" required readonly>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Xác nhận mật khẩu</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <input type="number" name="id" value="${user.id}" style="display: none">
            <div id="error-message" class="error-message" style="display: none;">
                Mật khẩu và xác nhận mật khẩu không khớp!
            </div>
            <button type="submit">Sửa</button>
        </form>
    </div>

    <div id="orders" class="content">
        <h2>Lịch sử đơn hàng</h2>
        <c:forEach var="donhang" items="${user.orders}">
            <c:set var="total" value="0"/>
            <c:set var="count" value="0"/>
            <h4> Mã Đơn Hàng${donhang.id}</h4>
            <h5> Ngày :${donhang.date}</h5>
            <table>
                <thead>
                <th style="border: 1px solid black;">STT </th>
                <th style="border: 1px solid black;">Tên Sản Phẩm </th>
                <th style="border: 1px solid black;">Số Lượng</th>
                <th style="border: 1px solid black;">Tiền</th>
                </thead>
                <tbody>

                    <c:forEach var="sanpham" items="${donhang.orderDetailList}">
                    <tr>
                        <c:set var="count" value="${count+1}"/>
                        <c:set var="total" value="${total+sanpham.price}"/>
                        <td style="border: 1px solid black;">${count}</td>
                        <th style="border: 1px solid black;">${sanpham.book.title}</th>
                        <th style="border: 1px solid black;">${sanpham.quantity}</th>
                        <th style="border: 1px solid black;">${sanpham.price}</th>
                    </tr>
                    </c:forEach>

                </tbody>
            </table>
            <h5>Tổng tiền:${total}</h5>
            <br>
            <br>
            <hr>
        </c:forEach>
    </div>


</div>

<script>
    function showTab(tabId) {
        var contents = document.querySelectorAll('.content');
        contents.forEach(content => content.classList.remove('active'));

        document.getElementById(tabId).classList.add('active');
    }

    function logout() {
        if(confirm("Bạn có chắc muốn đăng xuất?"))
        {
            window.location.href="/logout";
        }
    }
    function showHome()
    {
        if(confirm("bạn muốn quay lại trang chủ"))
        {
            window.location.href="/";
        }
    }
    document.getElementById("registrationForm").addEventListener("submit", function (e) {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm-password").value;
        var errorMessage = document.getElementById("error-message");

        if (password !== confirmPassword) {
            e.preventDefault(); // Ngăn form gửi dữ liệu
            errorMessage.style.display = "block"; // Hiển thị lỗi
        } else {
            errorMessage.style.display = "none"; // Ẩn lỗi nếu đúng

            // Hiển thị hộp thoại xác nhận trước khi gửi form
            if (!confirm("Bạn có chắc chắn muốn sửa thông tin?")) {
                e.preventDefault(); // Ngăn gửi form nếu chọn "Hủy"
            }
        }
    });

</script>

</body>
</html>
