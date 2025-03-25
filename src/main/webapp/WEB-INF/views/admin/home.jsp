<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <script>
        function edit(id) {
            if (confirm("Bạn muốn sửa thông tin khách hàng " + id + "?")) {
                window.location = "editusers?accountname=" + id;
            }
        }
    </script>

    <style>
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        .admin-img {
            width: 120px;
            height: auto;
        }
        .product-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }
        .sidebar {
            background-color: #343a40;
            color: white;
            padding: 20px;
        }
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            height: 100vh;
        }

        .row {
            min-height: 100vh;
        }

        .sidebar {
            background-color: #343a40;
            color: white;
            padding: 20px;
            min-height: 100vh;
        }
    </style>
</head>

<body>
    <div class="container-fluid" style="padding-top :0px;">
        <div class="row flex-nowrap">
            <!-- Sidebar -->
<div class="col-auto col-md-3 col-xl-2 bg-dark text-white p-3">
     <jsp:include page="basemenu.jsp" />
</div>

            <!-- Main Content -->
            <div class="col py-3">                <!-- Admin Info -->
                <div class="text-center">
                    <img src="/img/images.png" alt="Admin Logo" class="admin-img mb-3">
                    <h2>Thông tin Admin</h2>
                </div>

                <!-- User Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>Tên Người Dùng</th>
                                <th>Số Điện Thoại</th>
                                <th>Role</th>
                                <th>Tên Tài Khoản</th>
                                <th>Mật Khẩu</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${User}">
                                <tr>
                                    <td>${user.name}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.role}</td>
                                    <td>${user.account_name}</td>
                                    <td>${user.password}</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm" onclick="edit('${user.account_name}')">Sửa</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Sản phẩm sắp hết -->
                <div class="text-center mt-4">
                    <h2>Sản phẩm sắp hết</h2>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-danger">
                            <tr>
                                <th>Hình Ảnh</th>
                                <th>Sản Phẩm</th>
                                <th>Mô Tả</th>
                                <th>Số Lượng Tồn</th>
                                <th>Giá</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}">
                                <tr>
                                    <td>
                                        <img src="${book.img}" alt="Sản phẩm" class="product-img">
                                    </td>
                                    <td>${book.title}</td>
                                    <td>${book.description}</td>
                                    <td>${book.soluongton}</td>
                                    <td>${book.price} VND</td>
                                    <td>
                                        <button class="btn btn-success btn-sm" onclick="edit('${book.id}')">Thêm sách</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
