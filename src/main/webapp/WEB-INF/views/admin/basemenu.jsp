<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin Menu</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
</head>

<body>

<div class="d-flex flex-column p-3 bg-dark text-white min-vh-100">
    <a href="#" class="d-flex align-items-center pb-3 mb-3 text-white text-decoration-none">
        <span class="fs-5 text-danger">Menu</span>
    </a>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item mb-2">
            <a href="home" class="nav-link text-white">
                Home
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="manageraccount" class="nav-link text-white">
                Quản lý tài khoản
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="order" class="nav-link text-white">
                Quản lý đơn hàng
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="warehouse" class="nav-link text-white">
                Quản lý Kho
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="product" class="nav-link text-white">
                Quản lý Sản Phẩm
            </a>
        </li>
        <li class="nav-item">
            <a href="/logout" class="nav-link text-white">
                Đăng Xuất
            </a>
        </li>
    </ul>
</div>

</body>
</html>
