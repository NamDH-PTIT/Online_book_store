<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <title>trang chủ</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        /* Tổng thể navbar */
        body {
            margin: 0;
            padding: 0;
        }

        .navbar {
            height: 8vh;
            /* Chiều cao navbar */
            background-color: #f1f1f1;
            /* Màu nền */
            display: flex;
            /* Sử dụng Flexbox */
            align-items: center;
            /* Căn giữa chiều dọc */
            justify-content: space-between;
            /* Tách các phần */
            padding: 0 16px;
            /* Khoảng cách hai bên */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            /* Hiệu ứng đổ bóng */
            position: sticky;
            /* Dính trên cùng */
            top: 0;
            z-index: 1000;
            /* Luôn ở trên cùng */
        }

        /* Logo */
        .navbar-logo {
            height: 6vh;
            /* Tự động căn chỉnh với navbar */
        }

        /* Thanh tìm kiếm */
        .search-bar {
            display: flex;
            align-items: center;
            width: 1000px;
            /* Chiều rộng thanh tìm kiếm */
            background-color: white;
            border: 1px solid #ccc;
            /* Viền */
            border-radius: 20px;
            /* Bo góc */
            overflow: hidden;
        }

        .search-input {
            flex: 1;
            /* Mở rộng toàn bộ chiều ngang */
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            outline: none;
            /* Xóa viền mặc định */
        }

        .search-btn {
            background-color: #ccc;
            /* Màu nền nút */
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        .search-btn:hover {
            background-color: #bbb;
            /* Hiệu ứng hover */
        }

        /* Biểu tượng bên phải */
        .navbar-right {
            display: flex;
            gap: 16px;
            /* Khoảng cách giữa các icon */
        }

        .navbar-icon {
            font-size: 20px;
            color: black;
            text-decoration: none;
        }

        .navbar-icon:hover {
            color: #007bff;
            /* Đổi màu khi hover */
        }




        #wrapper {
            display:flex;
            justify-content: space-around;
            background-color: beige;

        }



        ul{
            list-style: none;
        }
        li {
            width: 25%;
            text-align: center;
            border: 2px solid lightblue;
            border-radius: 20px;
            float: left;
            margin:25px;
            width: 10vw;
            height: 30vh;
        }
        p{
            margin: 5px;
            color: blue;


        }
        .old{
            text-decoration: line-through;
            color: red;
        }





        /*li img{*/
        /*    width: 7vw;*/

        /*}*/
        li a{
            text-decoration: none;
        }
        li:hover{
            background: bisque;
        }
    </style>
</head>
<body>

</body>