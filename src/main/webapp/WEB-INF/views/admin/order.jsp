<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Đơn Hàng</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <script>
        function edit(id) {
            if (confirm("Bạn muốn xem thông tin đơn hàng " + id + "?") ) {
                window.location = "orderinfo?code=" + id;
            }
        }
    </script>
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
                    <h2>Quản Lý Đơn Hàng</h2>
                    <div class="bg-white p-3 rounded shadow-sm">
                        <form action="" method="get" class="row g-3 align-items-center">
                            <div class="col-auto">
                                <label for="code" class="col-form-label">Mã Đơn Hàng:</label>
                            </div>
                            <div class="col-auto">
                                <input type="text" id="code" name="code" class="form-control">
                            </div>
                            <div class="col-auto">
                                <label for="name" class="col-form-label">Tên Khách Hàng:</label>
                            </div>
                            <div class="col-auto">
                                <input type="text" id="name" name="name" class="form-control">
                            </div>
                            <div class="col-auto">
                                <input type="submit" value="Tìm" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Order Table -->
                <div class="table-responsive mt-4">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>Mã Đơn Hàng</th>
                                <th>Tên Khách Hàng</th>
                                <th>Ngày</th>
                                <th>Trạng Thái</th>
                                <th>Tổng Tiền</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="itemorder" items="${order}">
                                <tr>
                                    <td>${itemorder.code}</td>
                                    <td>${itemorder.customer}</td>
                                    <td>${itemorder.date}</td>
                                    <td>${itemorder.hinhThuc}</td>
                                    <td>${itemorder.total} VND</td>
                                    <td>
                                        <button class="btn btn-info btn-sm" onclick="edit('${itemorder.code}')">Xem Thông Tin</button>
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