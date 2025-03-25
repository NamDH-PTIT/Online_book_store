<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Sản Phẩm </title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <script type="text/javascript">
        function edit(id, title) {
            if (confirm("Bạn muốn thay đổi thông tin sách " + title + "?")) {
                window.location = "editbook?id=" + id;
            }
        }
    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <!-- Sidebar -->
        <div class="col-auto col-md-3 col-xl-2 bg-dark text-white p-3">
            <jsp:include page="basemenu.jsp"/>
        </div>

        <div class="col py-3">
            <div class="text-center">
                <h2>Quản Lý Sản Phẩm</h2>

                <div class="mt-3 p-3 bg-white">
                    <table class="table table-bordered text-center">
                        <thead class="table-light">
                        <tr>
                            <th>Hình Ảnh</th>
                            <th>ID</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Giá</th>
                            <th>Giảm Giá (15%)</th>
                            <th>Mô Tả</th>
                            <th>Chỉnh Sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td><img src="${book.img}" height="100px"></td>
                                <td>${book.id}</td>
                                <td>${book.title}</td>
                                <td>${book.price}</td>
                                <td>${book.price * 0.15}</td>
                                <td>${book.description}</td>
                                <td>
                                    <a href="#" class="btn btn-warning btn-sm"
                                       onclick="edit('${book.id}','${book.title}')">Sửa</a>
                                </td>
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
