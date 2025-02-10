<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <script type="text/javascript">
        function edit(id)
        {
            window.location="orderinfo?code="+id;
        }

    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-lightblue">
            <jsp:include page="basemenu.jsp" />
        </div>
        <div class="col py-3">
            <div style="text-align: center;">

                <h2>Quản Lý Đơn Hàng </h2>
                <div style="background-color: white;">
                    <form action="" method="get">
                        Mã Đơn Hàng : <input type="text" name="code" >
                        Tên Khách Hàng :<input type="text" name="name" >
                        <input type="submit" value="tìm">
                    </form>
                    <br>
                </div>
                <div class="infor" style="text-align: center;">

                    <table style="width: 100%; border: 1px solid black;">
                        <thead>
                        <tr>
                            <th style="border: 1px solid black;">Mã đơn hàng </th>
                            <th style="border: 1px solid black;">Tên khách hàng</th>
                            <th style="border: 1px solid black;">Ngày</th>
                            <th style="border: 1px solid black;">Trạng thái</th>
                            <th style="border: 1px solid black;">Tổng tiền</th>

                            <th style="border: 1px solid black;">Xem Thông Tin</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="itemorder" items="${order}">
                            <tr>
                                <td style="border:  1px solid black "> ${itemorder.code}</td>
                                <td style="border:  1px solid black "> ${itemorder.customer}</td>
                                <td style="border:  1px solid black "> ${itemorder.date}</td>
                                <td style="border:  1px solid black "> ${itemorder.hinhThuc}</td>
                                <td style="border:  1px solid black "> ${itemorder.total}</td>
                                <td style="border:  1px solid black "><a href="#" onclick="edit('${itemorder.code}')">thông tin </a></td>

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



