<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">



<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <script type="text/javascript" >
        function edit(id)
        {
            if(confirm("bạn muốn sửa thông tin khách hàng "+id+"?"))
            {
                window.location="editusers?accountname="+id;

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
                    <div style="background-color: white;">
                        <form action="" method="get">
                            tên người dùng : <input type="text" name="name" >
                            số điện thoại :<input type="text" name="phone" >
                            <input type="submit" value="tìm">
                        </form>
                        <br>
                    </div>
                    <table style="width: 100%; border: 1px solid black;">
                        <thead>
                        <tr>
                            <th style="border: 1px solid black;">Tên tài khoản </th>
                            <th style="border: 1px solid black;">Số Điện Thoại</th>
                            <th style="border: 1px solid black;">Tên Người dùng</th>
                            <th style="border: 1px solid black;">Role</th>
                            <td style="border: 1px solid black;">Password</td>
                            <td style="border: 1px solid black;">Email</td>
                            <th style="border: 1px solid black;">edit</th>

                        </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="user" items="${User}">
                            <tr>
                                <td style="border: 1px solid black;">${user.account_name}</td>
                                <td style="border: 1px solid black;">${user.phone}</td>
                                <td style="border: 1px solid black;">${user.name}</td>
                                <td style="border: 1px solid black;">${user.role}</td>
                                <td style="border: 1px solid black;">${user.password}</td>
                                <td style="border: 1px solid black;">${user.email}</td>

                                <td style="border: 1px solid black;">
                                    <a href="#" onclick="edit('${user.account_name}')">sửa thông tin</a>
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



