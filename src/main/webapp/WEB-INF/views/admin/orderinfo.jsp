<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Sắp xếp các phần tử theo chiều dọc */
            height: 100vh; /* Chiều cao toàn màn hình */
            position: relative; /* Để sử dụng position cho các phần tử con */
        }
        .header {
            text-align: center;
            padding: 10px 0;
            background-color: #f4f4f4;
            font-size: 24px;
            font-weight: bold;
            border-bottom: 2px solid #ccc;
        }
        .content {
            flex: 1;
            display: flex; /* Sắp xếp nội dung ngang */
        }
        .left, .right {
            flex: 1;
            display: flex;
            align-items: center; /* Căn giữa theo trục dọc */
            justify-content: center; /* Căn giữa theo trục ngang */
            font-size: 24px;
        }
        .left {
            background-color: #f0f0f0; /* Màu nền cho bên trái */
        }
        .right {
            background-color: #d0e8f2; /* Màu nền cho bên phải */
        }
        .center-text {
            position: absolute;
            top: 50%; /* Đặt giữa trang theo chiều dọc */
            left: 50%; /* Đặt giữa trang theo chiều ngang */
            transform: translate(-50%, -50%); /* Dịch chuyển để căn giữa chính xác */
            font-size: 36px;
            font-weight: bold;
            color: #333;
        }
        h1 {
            margin-bottom: 20px;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left; /* Căn trái nội dung trong form */
            width: 300px; /* Định kích thước cho form */
        }
        form input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;

        }
    </style>
</head>
<body>
<div class="header">Đơn Hàng ${order.id} </div> <!-- Chữ ở đầu trang -->

<div class="content">
    <div class="left">
        <div>
            <h1></h1>


                <form>
                    <label for="id"> Tên Khách Hàng</label>
                    <input type="text" id="id" name="id" value=" ${order.user.name}  " readonly><br>

                    <label for="title"> Phone</label>
                    <input type="text" id="title" name="title" value="${order.user.phone}  " readonly><br>
                    <c:set var="n" value="0"/>

                    <c:set var="detail" value="${order.orderDetailList}"/>
                    <c:forEach var="orderdetail" items="${detail}">
                        <c:set var="n" value="${n+orderdetail.price*orderdetail.quantity}"/>

                    </c:forEach>
                    <label for="price">Tổng tiền:</label>
                    <input type="text" id="price" name="price" value="${n}"><br>

                </form>





        </div>
    </div> <!-- Nội dung bên trái -->
    <div class="right">
        <table>
            <thead><tr>
                <th style="border: 1px solid black;">Mã Sản Phẩm</th>
                <th style="border: 1px solid black;">Tên Sản Phẩm</th>
                <th style="border: 1px solid black;">Số Lượng</th>
                <th style="border: 1px solid black;">Đơn Giá</th>
                <th style="border: 1px solid black;">Thành Tiền </th>
            </tr></thead>
            <tbody>
            <c:forEach var="orderDetail" items="${order.orderDetailList}">

                <tr><td style="border: 1px solid black;">${orderDetail.book.id}</td>
                    <td style="border: 1px solid black;">${orderDetail.book.title}</td>
                    <td style="border: 1px solid black;">${orderDetail.quantity}</td>
                    <td style="border: 1px solid black;">${orderDetail.price}</td>
                    <td style="border: 1px solid black;">${orderDetail.quantity*orderDetail.price}</td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div> <!-- Nội dung bên phải -->
</div>
<div style="height: 30px; text-align: center;font-size: 30px;"><a href="order">quay lại</a></div>

</body>
</html>



