<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">

</head>

<body>
<form action="editusers" method="post">
    Tên Người Dùng : <input required type="text" name="name" value="${user.name} "${user.role.description=="admin"?"":"readonly"}><br>
    Số Điện Thoại : <input  required type="text" name="phone" value="${user.phone}"><br>
    Tài Khoản :<input  required type="text" name="account_name" value="${user.accountname}" readonly><br>
    Mật Khẩu : <input required type="text" name ="password"><br>
    Role :<input required type="text" name="role" value="${user.role.description}" readonly><br>
    <input type="submit" value="Thay đổi">
    <a href="home">quay lại </a>
</form>

</form>

</body>

</html>



