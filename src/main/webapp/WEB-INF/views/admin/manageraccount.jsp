<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Khoản</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <script type="text/javascript">
        function edit(id) {
            if (confirm("Bạn muốn sửa thông tin khách hàng " + id + "?")) {
                window.location = "editusers?accountname=" + id;
            }
        }
    </script>

    <style>
        /* Đảm bảo chữ căn giữa và đồng nhất với file base */
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            font-size: 16px; /* Chỉnh cỡ chữ */
            padding: 12px; /* Khoảng cách đều nhau */
        }


        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }

        .sidebar {
            background-color: #343a40;
            color: white;
            padding: 20px;
            min-height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /* Tăng chiều rộng cột để chữ không bị chồng */
        .table td, .table th {
            white-space: nowrap; /* Không xuống dòng chữ */
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row flex-nowrap">
            <!-- Sidebar -->
            <div class="col-auto col-md-3 col-xl-2 bg-dark text-white p-3">
                <jsp:include page="basemenu.jsp" />
            </div>

            <!-- Main Content -->
            <div class="col py-3">
                <div class="text-center">
                    <h2>Quản Lý Tài Khoản</h2>
                </div>

                <!-- Form Tìm Kiếm -->
                <div class="form-container mb-4">
                    <form action="" method="get" class="row g-3">
                        <div class="col-md-5">
                            <label for="name" class="form-label">Tên người dùng:</label>
                            <input type="text" class="form-control" name="name" id="name">
                        </div>
                        <div class="col-md-5">
                            <label for="phone" class="form-label">Số điện thoại:</label>
                            <input type="text" class="form-control" name="phone" id="phone">
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">Tìm</button>
                        </div>
                    </form>
                </div>

                <!-- Bảng danh sách tài khoản -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th style="width: 15%;">Tên tài khoản</th>
                                <th style="width: 15%;">Số Điện Thoại</th>
                                <th style="width: 15%;">Tên Người dùng</th>
                                <th style="width: 10%;">Role</th>
                                <th style="width: 15%;">Password</th>
                                <th style="width: 15%;">Email</th>
                                <th style="width: 10%;">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${User}">
                                <tr>
                                    <td>${user.account_name}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.name}</td>
                                    <td>${user.role}</td>
                                    <td>${user.password}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm" onclick="edit('${user.account_name}')">Sửa</button>
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
