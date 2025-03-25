<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Kho</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

</head>

<body>
<div class="container-fluid" >
        <div class="row flex-nowrap">
            <!-- Sidebar -->
            <div class="col-auto col-md-3 col-xl-2 bg-dark text-white p-3">
                <jsp:include page="basemenu.jsp" />
            </div>
        <div class="col py-3">
            <div style="text-align: center;">
                <h2>Quản Lý Kho</h2>
                <div style="background-color: white; padding: 10px;">
                    <form method="get" action="phieunhap">
                        <input type="submit" value="Nhập Thêm" class="btn btn-primary">
                    </form>
                </div>
                <br>
                <div class="infor" style="text-align: center;">
                    <h4>Danh Sách Nhập Kho</h4>
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng Nhập</th>
                                <th>Nhà Cung Cấp</th>
                                <th>Đơn Giá Nhập</th>
                                <th>Tổng Tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${ProductResponse}">
                                <tr>
                                    <td>${product.name}</td>
                                    <td>${product.quantity}</td>
                                    <td>${product.nhaCungCap}</td>
                                    <td>${product.giaNhap}</td>
                                    <td>${product.giaNhap * product.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br>
                <div class="infor" style="text-align: center; width: 50%; margin: auto;">
                    <h4>Tổng Quan Kho Hàng</h4>
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng Tồn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}">
                                <tr>
                                    <td>${book.title}</td>
                                    <td>${book.soluongton}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
