<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhập Phiếu Nhập</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="container">
    <h1> Phiếu Nhập</h1>

    <!-- Form nhập phiếu nhập -->
    <form action="/admin/phieunhap" method="post">
        <h2>Thông Tin Phiếu Nhập</h2>



        nhà cung cấp
        <select name="ncc">
            <c:forEach var="nhacungcap" items="${ncc}">
                <option value="${nhacungcap.name}">${nhacungcap.name}</option>
            </c:forEach>
        </select>

        <hr>

        <!-- Chi tiết phiếu nhập -->
        <h2>Chi Tiết Phiếu Nhập</h2>
        <table id="chiTietPhieuNhap">
            <thead>
            <tr>
                <th>Tên Sách</th>
                <th>Số Lượng</th>
                <th>Tác Giả</th>
                <th>Thể loại</th>
                <th>Đơn Giá</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="text" name="chiTietPhieuNhapRequests[0].book" required></td>
                <td><input type="number" name="chiTietPhieuNhapRequests[0].quantity" required min="1"></td>
                <td><input type="text" name="chiTietPhieuNhapRequests[0].author" required ></td>
                <td><input type="text" name="chiTietPhieuNhapRequests[0].category" required ></td>
                <td><input type="number" name="chiTietPhieuNhapRequests[0].price" required min="0" step="0.01"></td>
                <td><button type="button" onclick="removeRow(this)">Xóa</button></td>
            </tr>
            </tbody>
        </table>
        <button type="button" onclick="addRow()">Thêm Sản Phẩm</button><br><br>

        <input type="submit" value="Lưu Phiếu Nhập" class="btn">
    </form>
</div>

<script>
    // Thêm dòng mới cho sản phẩm
    function addRow() {
        var table = document.getElementById("chiTietPhieuNhap").getElementsByTagName('tbody')[0];
        var newRow = table.insertRow(table.rows.length);

        var cell1 = newRow.insertCell(0);
        var cell2 = newRow.insertCell(1);
        var cell3 = newRow.insertCell(2);
        var cell4 = newRow.insertCell(3);
        var cell5 = newRow.insertCell(4);
        var cell6 = newRow.insertCell(5);

        cell1.innerHTML = '<input type="text" name="chiTietPhieuNhapRequests[' + (table.rows.length-1) + '].book" required>';
        cell2.innerHTML = '<input type="number" name="chiTietPhieuNhapRequests[' + (table.rows.length-1) + '].quantity" required min="1">';
        cell3.innerHTML = '<input type="text" name="chiTietPhieuNhapRequests[' + (table.rows.length-1) + '].author" required >';
        cell4.innerHTML = '<input type="text" name="chiTietPhieuNhapRequests[' + (table.rows.length-1) + '].category" required >';
        cell5.innerHTML = '<input type="number" name="chiTietPhieuNhapRequests[' + (table.rows.length-1) + '].price" required min="0" step="0.01">';
        cell6.innerHTML = '<button type="button" onclick="removeRow(this)">Xóa</button>';
    }

    // Xóa dòng sản phẩm
    function removeRow(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }
</script>

</body>
</html>
