<%@page contentType="text/html;" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        #preview {
            max-width: 200px;
            max-height: 200px;
            display: block;
            margin-top: 10px;
        }
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Đưa nội dung vào giữa trang theo chiều dọc */
            margin: 0;
            background-color: #f9f9f9;
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
        form a {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        form a:hover {
            background-color: #0056b3;
        }
    </style>

</head>

<body>
<div>
    <h1>Sản Phẩm</h1>

        <form action="editbook" method="post" enctype="multipart/form-data">
            <label for="id"> Mã Sản Phẩm</label>
            <input type="text" id="id" name="id" value=" ${books.id}  " readonly><br>

            <label for="title"> Sản Phẩm:</label>
            <input type="text" id="title" name="title" value="${books.title}  " readonly><br>

            <label for="price">Giá:</label>
            <input type="text" id="price" name="price" value="${books.price}"><br>

            <label for="description">Mô Tả:</label>
            <input type="text" id="description" name="description" value="${books.description}"><br>

            <label for="file">Chọn file ảnh mới:</label>
            <input type="file" id="file" name="file" accept="image/*" required>
            <img id="preview" src="#" alt="Xem trước ảnh mới" style="display: none;">
            <br>
            <a href="product">quay lại</a>
            <input type="submit" value="thay đổi">
        </form>

</div>
<script>
    // Lấy thẻ input file và ảnh preview
    const fileInput = document.getElementById('file');
    const previewImage = document.getElementById('preview');

    // Lắng nghe sự kiện thay đổi file
    fileInput.addEventListener('change', function (event) {
        const file = event.target.files[0]; // Lấy file người dùng chọn
        if (file) {
            const reader = new FileReader(); // Đọc file
            reader.onload = function (e) {
                // Hiển thị ảnh preview
                previewImage.src = e.target.result;
                previewImage.style.display = 'block';
            };
            reader.readAsDataURL(file); // Đọc file dưới dạng URL
        }
    });
</script>
</body>

</html>



