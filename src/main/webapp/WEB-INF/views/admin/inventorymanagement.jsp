<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">

</head>

<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-lightblue">
            <jsp:include page="basemenu.jsp" />
        </div>
        <div class="col py-3">


            <div>

            </div>
            <h2 style="text-align: center;">Quản lý Kho  </h2>
            <form method="get" action="phieunhap">
<%--                <select required name="ncc">--%>
<%--                    <c:forEach var="ncc" items="${nhcungCaps}">--%>
<%--                        <option value="${ncc.name}">${ncc.name}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
                <input type="submit" value="nhập thêm">
            </form>
            <div class="infor" style="text-align: center;">

                <table style="width: 100%; border: 1px solid black;">
                    <thead>
                    <tr>

                        <th style="border: 1px solid black;">Tên Sản Phẩm</th>
                        <th style="border: 1px solid black;">Số Lượng Nhập</th>

                        <th style="border: 1px solid black;">Nhà Cung Cấp </th>

                        <th style="border: 1px solid black;">Đơn giá Nhập</th>
                        <th style="border: 1px solid black;">Tổng tiền</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${ProductResponse}">
                        <tr>

                            <td style="border: 1px solid black">${product.name}</td>
                            <td style="border: 1px solid black">${product.quantity}</td>

                            <td style="border: 1px solid black">${product.nhaCungCap}</td>

                            <td style="border: 1px solid black">${product.giaNhap}</td>
                            <td style="border: 1px solid black">${product.giaNhap*product.quantity}</td>

                        </tr>
                    </c:forEach>


                    </tbody>
                </table>

            </div>

            <div class="infor" style="text-align: center ;width: 50%;">
                <h2 style="text-align: center;background-color:white ">Tổng Quan  </h2>
                <table style="width: 100%; border: 1px solid black;">
                    <thead>
                    <tr>

                        <th style="border: 1px solid black;">Tên Sản Phẩm</th>
                        <th style="border: 1px solid black;">Số Lượng Tồn</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>

                            <td style="border: 1px solid black">${book.title}</td>
                            <td style="border: 1px solid black">${book.soluongton}</td>



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



