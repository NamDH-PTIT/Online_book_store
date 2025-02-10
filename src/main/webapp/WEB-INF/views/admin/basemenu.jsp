<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>admin</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
</head>


<body>

<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
    <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-5 d-none d-sm-inline text-danger">Menu</span>
    </a>
    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
        <li class="nav-item">
            <a href="home" class="nav-link align-middle px-0 ">
                <i class="fs-4 bi-house"></i> <span class="custom-text-white ms-1 d-none d-sm-inline ">Home</span>
            </a>
        </li>
        <li>
            <a href="manageraccount" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-speedometer2"></i> <span class="custom-text-white ms-1 d-none d-sm-inline">Quản lý tài khoản</span> </a>

        </li>
        <li>
            <a href="order" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline custom-text-white">Quản lý đơn hàng</span></a>
        </li>
        <li>
            <a href="warehouse" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline custom-text-white">Quản lý Kho</span></a>
        </li>
        <li>
            <a href="product" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline custom-text-white">Quản Lý Sản Phẩm</span> </a>

        </li>


        <li >
            <a href="/logout" class="nav-link px-0 align-middle"  >
                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline custom-text-white">Đăng Xuất</span> </a>
        </li>
    </ul>
    <hr>

</div>

</body>

</html>