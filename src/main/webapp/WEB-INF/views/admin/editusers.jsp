<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa người dùng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="d-flex justify-content-center align-items-center vh-100 bg-light">

    <div class="card shadow-lg p-4 rounded" style="max-width: 400px; width: 100%;">
        <h3 class="text-center mb-4">Chỉnh sửa người dùng</h3>
        <form action="editusers" method="post">

            <div class="mb-3">
                <label class="form-label">Tên Người Dùng:</label>
                <input required type="text" name="name" class="form-control"
                       value="${user.name}" ${user.role.description=="admin"?"":"readonly"}>
            </div>

            <div class="mb-3">
                <label class="form-label">Số Điện Thoại:</label>
                <input required type="text" name="phone" class="form-control" value="${user.phone}">
            </div>

            <div class="mb-3">
                <label class="form-label">Tài Khoản:</label>
                <input required type="text" name="account_name" class="form-control" value="${user.accountname}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Mật Khẩu:</label>
                <input required type="password" name="password" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Role:</label>
                <input required type="text" name="role" class="form-control" value="${user.role.description}" readonly>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Thay đổi</button>
                <a href="home" class="btn btn-outline-secondary">Quay lại</a>
            </div>

        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>
