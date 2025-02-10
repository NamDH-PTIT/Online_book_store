<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <script type="text/javascript">
        function edit(id,title)
        {
            if(confirm("bạn muốn thay đổi thông tin sách "+title))
            {
                window.location="editbook?id="+id;
            }
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

                <h2>Quản Lý Tài Khoản </h2>
                <div class="infor" style="text-align: center;">

                    <table style="width: 100%; border: 1px solid black;">
                        <thead>
                        <tr>
                            <th style=" border: 1px solid black"></th>
                            <th style=" border: 1px solid black">id</th>
                            <th style="border: 1px solid black;">Tên Sản Phẩm </th>
                            <th style="border: 1px solid black;">Giá </th>
                            <th style="border: 1px solid black;">Giảm giá</th>
                            <th style="border: 1px solid black;">Mô tả</th>
<%--                            <th style="border: 1px solid black;">Nhà Cung Cấp</th>--%>
                            <th style="border: 1px solid black;">Edit</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td style="border: 1px solid black"><img src="${book.img}" height="100px"></td>
                                <td style="border: 1px solid black"> ${book.id}</td>
                                <td style="border: 1px solid black">${book.title}</td>
                                <td style="border: 1px solid black">${book.price}</td>
                                <td style="border: 1px solid black">${book.price*0.15}</td>
                                <th style="border: 1px solid black;">${book.description}</th>
                                <td style="border: 1px solid black"><a href="#" onclick="edit('${book.id}','${book.title}')"> edit</a></td>

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



