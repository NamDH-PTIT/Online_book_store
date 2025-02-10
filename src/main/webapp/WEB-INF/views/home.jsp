<%@ page import="com.example.Online_book_store.Entity.Users" %>
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
            width: 500px;
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
            display: flex;
            flex-wrap: wrap; /* Cho phép các phần tử xuống dòng nếu không đủ không gian */
            justify-content: space-around;
            background-color: beige;
            margin-top: 20px;
        }



        ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        li {
            width: 22%; /* Đảm bảo các phần tử không quá nhỏ, nhưng vẫn căn giữa tốt */
            text-align: center;
            border: 2px solid lightblue;
            border-radius: 20px;
            margin: 25px;
            height: auto; /* Thay vì cố định chiều cao, làm cho nó linh động */
            background-color: white;
            padding: 20px 0; /* Khoảng cách trong mỗi sản phẩm */
        }
        p{
            margin: 5px;
            color: blue;


        }
        .old {
            text-decoration: line-through;
            color: red;
        }

        li img {
            width: 80%; /* Hình ảnh chiếm phần lớn diện tích */
            max-height: 200px; /* Hạn chế chiều cao tối đa của ảnh */
            object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
            margin-bottom: 10px; /* Khoảng cách dưới hình ảnh */
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



        /* CSS cho nút "Mua" */
        #buyButton {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-top: 10px; /* Khoảng cách giữa giá và nút */
            display: block; /* Đảm bảo nút nằm đúng dưới tên sản phẩm */
            width: 80%; /* Giảm chiều rộng nút để căn chỉnh hợp lý */
            margin-left: auto; /* Căn giữa nút */
            margin-right: auto;
        }

        /* Nút "Mua" hover */
        #buyButton:hover {
            background-color: #45a049;
        }

        #nomore {
            padding: 10px 20px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-top: 10px; /* Khoảng cách giữa giá và nút */
            display: block; /* Đảm bảo nút nằm đúng dưới tên sản phẩm */
            width: 80%; /* Giảm chiều rộng nút để căn chỉnh hợp lý */
            margin-left: auto; /* Căn giữa nút */
            margin-right: auto;
        }
        /* CSS cho thông báo giỏ hàng */
        .cart-message {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            border-radius: 25px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.5s, visibility 0.5s;
            font-size: 16px;
            z-index: 1000;
        }

        .cart-message.show {
            opacity: 1;
            visibility: visible;
        }
        @keyframes blink {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.1);
                opacity: 0.7;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .blink {
            animation: blink 1s ease-in-out;
        }
    </style>
</head>


<body>
<div class="navbar">
    <div class="navbar-left">
        <a href="#">
            <img src="/img/fahasa-logo.webp" alt="Logo" class="navbar-logo">
        </a>


    </div>
    <div class="navbar-center" style="display: flex;">
        <form   >
            <label for="category">Chọn thể loại:</label>
            <select id="category" name="category">
                <option disabled selected>-- Vui lòng chọn --</option>
                <option value="0">tất cả</option>
                <c:forEach var="category" items="${categorys}">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>

            </select>
            <br>
            <label for="author">tác giả:</label>
            <select id="author" name="author">
                <option disabled selected>-- Vui lòng chọn --</option>
                <option value="0">tất cả</option>
                <c:forEach var="author" items="${authors}">
                    <option value="${author.id}">${author.name}</option>
                </c:forEach>

            </select>
        </form>
        <form class="search-bar">

            <input type="text" placeholder="Tìm kiếm..." class="search-input">
            <button type="submit" class="search-btn">🔍</button>

        </form>

    </div>
    <%
        HttpSession sessionUser = request.getSession();
        Users username = sessionUser.getAttribute("user")==null?null:(Users) sessionUser.getAttribute("user");
    %>
    <div class="navbar-right">
        <a href="/cart" class="navbar-icon"><i class="fas fa-shopping-cart" style="font-size: 24px; color: black;"></i></a>
        <a href="<%= (username == null) ? "/account/login" : "/account/profile" %>" class="navbar-icon">
            <i class="fas fa-user-circle" style="font-size: 24px; color: black;"></i>
            <% if (username == null) { %>
            <span>Đăng nhập / Đăng ký</span>
            <% } else { %>
            <span><%= username.getName() %></span>
            <a href="/logout" class="navbar-icon">
                <i class="fas fa-sign-out-alt" style="font-size: 24px; color: black;"></i>
                Đăng xuất
            </a>
            <% } %>
        </a>    </div>
</div>

<div style="margin: 0 0 0 70px;">
    <div id=" wrapper">

        <ul>

            <c:forEach var="book" items="${books}">
                <li>
                    <form action="" method="post" class="myForm">
                        <img src="${book.img}" alt="" width="60%">
                        <p>${book.title}</p>
                        <p>giá gốc <span class="old"> ${book.price}</span></p>
                        <p>giá :${book.price*85/100}</p>
                        <input type="text" name="title" value="${book.title}" style="display: none;">
                        <c:if test="${book.soluongton>0}">
                            <input type="submit" value="Thêm vào giỏ hàng" class="buyButton" id="buyButton">
                        </c:if>
                        <c:if test="${book.soluongton<=0}">
                            <input type="text" value="Hết Hàng" readonly id="nomore" style="text-align: center;">
                        </c:if>
                        <div id="cartMessage" class="cart-message">
                            <span>Sản phẩm ${book.title} đã được thêm vào giỏ hàng!</span>
                        </div>
                    </form>

                </li>
            </c:forEach>

        </ul>
    </div>

</div>
</body>


<script>
    let buyButtons = document.querySelectorAll('#buyButton');
    let cartMessages = document.querySelectorAll('.cart-message');

    // Thêm sự kiện cho từng nút "Mua"
    buyButtons.forEach(function(buyButton, index) {
        buyButton.addEventListener('click', function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của nút

            // Thêm hiệu ứng nhấp nháy vào nút
            buyButton.classList.add('blink');

            // Hiển thị thông báo "Đã thêm vào giỏ hàng"
            cartMessages[index].classList.add('show');

            // Ẩn thông báo sau 3 giây
            setTimeout(function() {
                cartMessages[index].classList.remove('show');
            }, 3000);

            // Loại bỏ hiệu ứng nhấp nháy sau 0.3 giây
            setTimeout(function() {
                buyButton.classList.remove('blink');
            }, 300);

            // Gửi form sau 3 giây
            setTimeout(function() {
                let form = buyButton.closest('form'); // Tìm form chứa nút bấm
                if (form) {
                    form.submit(); // Gửi form
                }
            }, 450);
        });
    });




    // Thêm sự kiện cho từng nút "Mua"


    // Lắng nghe sự kiện thay đổi (change) trên thẻ <select>
    document.getElementById('category').addEventListener('change', function() {
        // Lấy giá trị đã chọn từ thẻ <select>
        const selectedFruit = this.value;

        // Điều hướng người dùng tới URL mới
        window.location.href = `/book-category?id=`+encodeURIComponent(selectedFruit);
    });
    document.getElementById('author').addEventListener('change', function() {
        // Lấy giá trị đã chọn từ thẻ <select>
        const selectedFruit = this.value;

        // Điều hướng người dùng tới URL mới
        window.location.href = `/book-author?id=`+encodeURIComponent(selectedFruit);
    });
</script>

</html>