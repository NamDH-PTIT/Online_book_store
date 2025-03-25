<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        .header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 24px;
            font-weight: bold;
        }
        .form-control[readonly] {
            background-color: #e9ecef;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="header">Đơn Hàng #${order.id}</div>
        <div class="row p-4">
            <div class="col-md-4">
                <h5>Thông Tin Khách Hàng</h5>
                <form class="bg-light p-3 rounded">
                    <div class="mb-3">
                        <label class="form-label">Tên Khách Hàng:</label>
                        <input type="text" class="form-control" value="${order.user.name}" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số Điện Thoại:</label>
                        <input type="text" class="form-control" value="${order.user.phone}" readonly>
                    </div>
                    <c:set var="n" value="0"/>
                    <c:forEach var="orderdetail" items="${order.orderDetailList}">
                        <c:set var="n" value="${n + orderdetail.price * orderdetail.quantity}"/>
                    </c:forEach>
                    <div class="mb-3">
                        <label class="form-label">Tổng tiền:</label>
                        <input type="text" class="form-control fw-bold text-danger" value="${n} VNĐ" readonly>
                    </div>
                </form>
            </div>
            <div class="col-md-8">
                <h5>Chi Tiết Đơn Hàng</h5>
                <table class="table table-bordered table-hover bg-white">
                    <thead class="table-primary">
                        <tr>
                            <th>Mã Sản Phẩm</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Số Lượng</th>
                            <th>Đơn Giá</th>
                            <th>Thành Tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderDetail" items="${order.orderDetailList}">
                            <tr>
                                <td>${orderDetail.book.id}</td>
                                <td>${orderDetail.book.title}</td>
                                <td>${orderDetail.quantity}</td>
                                <td>${orderDetail.price} VNĐ</td>
                                <td class="fw-bold text-danger">${orderDetail.quantity * orderDetail.price} VNĐ</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-center p-3">
            <a href="order" class="btn btn-secondary">Quay Lại</a>
        </div>
    </div>
</div>

</body>
</html>
