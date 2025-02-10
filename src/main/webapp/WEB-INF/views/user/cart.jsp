    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h2 {
                text-align: center;
                margin-top: 30px;
                font-size: 28px;
                color: #333;
            }

            #cartForm {
                max-width: 800px;
                margin: 30px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .product {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
            }

            .product img {
                width: 50px;
                height: 50px;
                margin-right: 15px;
                border-radius: 5px;
            }

            .product button {
                background-color: #f44336;
                color: #fff;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .product button:hover {
                background-color: #d32f2f;
            }

            .product input {
                width: 50px;
                text-align: center;
                padding: 5px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .price {
                font-size: 18px;
                font-weight: bold;
                color: #4caf50;
            }

            h3 {
                font-size: 22px;
                color: #333;
                text-align: right;
                margin-top: 20px;
            }

            #totalPrice {
                color: #d32f2f;
            }

            button[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #4caf50;
                color: white;
                font-size: 18px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 30px;
                transition: background-color 0.3s;
            }


            button[type="submit"]:hover {
                background-color: #388e3c;
            }
            .back:hover{
                background-color: #388e3c;
            }
            .back{
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #4caf50;
                color: white;
                font-size: 18px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 30px;
                transition: background-color 0.3s;
            }
            /* Responsive Design */
            @media (max-width: 768px) {
                .product {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .product img {
                    margin-bottom: 10px;
                }

                .product button {
                    width: 100%;
                    margin-bottom: 5px;
                }

                .product input {
                    width: 80px;
                    margin-bottom: 10px;
                }

                h3 {
                    font-size: 20px;
                }
            }

        </style>

        <script>
            // Hàm cập nhật giá khi thay đổi số lượng sản phẩm
            function changeQuantity(productId, amount) {
                let quantityInput = document.getElementById('product' + productId);
                let maxQuantity = parseInt(quantityInput.getAttribute('max')); // Lấy số lượng tồn kho từ `max`
                let quantity = parseInt(quantityInput.value) + amount;

                // Đảm bảo số lượng không nhỏ hơn 1 và không lớn hơn số lượng tồn kho
                if (quantity < 1) {
                    quantity = 1;
                } else if (quantity > maxQuantity) {
                    quantity = maxQuantity;
                }

                quantityInput.value = quantity;
                updatePrice();
            }

            function updatePrice() {
                let total = 0;

                document.querySelectorAll('.product').forEach(product => {
                    let productId = product.dataset.productId;
                    let quantity = parseInt(document.getElementById('product' + productId).value);
                    let price = parseFloat(document.getElementById('price' + productId).dataset.unitPrice);

                    let totalPrice = price * quantity;
                    document.getElementById('price' + productId).innerText = totalPrice.toLocaleString('vi-VN');

                    total += totalPrice;
                });

                document.getElementById('totalPrice').innerText = total.toLocaleString('vi-VN');
            }

            function removeProduct(productId) {
                let productElement = document.querySelector('.product[data-product-id="' + productId + '"]');
                if (productElement) {
                    productElement.remove();
                    updatePrice();
                }
            }


                function submitForm() {
                var form = document.getElementById('cartForm');
                // Thay đổi action tùy vào hành động
                form.action = "/update-cart" ;
                form.submit();  // Gửi form
            }
            function validateQuantity(productId) {
                let quantityInput = document.getElementById('product' + productId);
                let quantity = parseInt(quantityInput.value);
                let maxQuantity = parseInt(quantityInput.getAttribute('max'));

                // Kiểm tra nếu số lượng vượt quá số lượng tồn kho hoặc nhỏ hơn 1
                if (quantity < 1) {
                    alert("Số lượng không thể nhỏ hơn 1.");
                    quantityInput.value = 1; // Đặt lại số lượng về 1
                } else if (quantity > maxQuantity) {
                    alert("hết hàng vui lòng xóa");
                    quantityInput.value = maxQuantity; // Đặt lại số lượng về max
                } else if (quantity === 0) {
                    alert("Số lượng sản phẩm không thể bằng 0.");
                    quantityInput.value = 1; // Đặt lại số lượng về 1
                }
                updatePrice();
            }

        window.onload = updatePrice;

        </script>

    </head>
    <body>
    <c:set var="id" value="0"/>

    <h2>Giỏ hàng</h2>
    <form id="cartForm" action="checkout" method="post">


        <c:forEach var="book" items="${books}">
            <div class="product" data-product-id="${book.id}" style="display: flex; align-items: center;">
                <img src="${book.img}" alt="${book.title}" style="width: 50px; height: 50px; margin-right: 10px;">
                <button type="button" onclick="changeQuantity(${book.id}, -1)">-</button>
                <input type="number" id="product${book.id}" name="product[${id}].quantity" value="1" min="1" max="${book.soluongton}" onchange="validateQuantity(${book.id})">
                <button type="button" onclick="changeQuantity(${book.id}, 1)">+</button>
                <span class="price" id="price${book.id}" data-unit-price="${book.price * 85 / 100}" >
                        ${(book.price * 85 / 100)}
                </span> VND
                <input type="number" value="${book.id}" style="display: none"  name="product[${id}].id">
<%--                <input type="number" value="${book.soluongton}" style="display: none" class="max" >--%>

                <input type="number" value="${(book.price*85/100)}" style="display: none"  name="product[${id}].price">
                <button type="button"  onclick="removeProduct(${book.id})">Xóa</button>
            </div>
            <c:set var="id" value="${id+1}"/>
        </c:forEach>

        <h3>Tổng tiền: <span id="totalPrice">0</span> VND</h3>

        <button type="submit">Thanh toán</button>
        <button type="button"class="back" onclick="submitForm()">Mua thêm</button>
    </form>

    </body>
    </html>
