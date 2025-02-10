package com.example.Online_book_store.DTO;

import com.example.Online_book_store.Entity.*;
import com.example.Online_book_store.exception.AppException;
import com.example.Online_book_store.exception.ErrorCode;
import com.example.Online_book_store.repository.RoleRepository;
import com.example.Online_book_store.request.RegisterRequest;
import com.example.Online_book_store.response.OrderResponse;
import com.example.Online_book_store.response.ProductResponse;
import com.example.Online_book_store.response.UserResponse;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DTO {
    RoleRepository roleRepository;
    public static List<UserResponse> userResponse(List<Users> users) {
        List<UserResponse> userResponses = new ArrayList<>();
        for (Users user : users) {
            UserResponse userResponse= UserResponse.builder()
                    .name(user.getName())
                    .phone(user.getPhone())
                    .role(user.getRole().getDescription())
                    .password(user.getPassword())
                    .account_name(user.getAccountname())
                    .email(user.getEmail())
                    .build();
            userResponses.add(userResponse);
        }
        return userResponses;


    }
    public static List<ProductResponse> bookResponse(List<Book> books) {
        List<ProductResponse> bookResponses = new ArrayList<>();
        for(Book book : books) {
            List<ChiTietPhieuNhap> chiTietPhieuNhaps=book.getChiTietPhieuNhaps();
                int total=0;
                for(ChiTietPhieuNhap x : chiTietPhieuNhaps) {
                    ProductResponse productResponse=ProductResponse.builder()
                            .soLuongTon(book.getSoluongton())
                            .giaNhap(x.getPrice())
                            .name(book.getTitle())
                            .quantity(x.getQuantity())
                            .gia(book.getPrice())
                            .giamGia(Double.parseDouble(String.format(("%.0f"),(double)Math.round(0.15*(double) book.getPrice()))))
                            .nhaCungCap(x.getPhieuNhap().getNhaCungCap().getName())
                            .build();
                    bookResponses.add(productResponse);
                }



        }
        return bookResponses;
    }

    //code
    public static List<OrderResponse> codeToOrderResponse(Orders orders) {
        List<OrderResponse> orderResponses = new ArrayList<>();
        List<OrderDetail> orderDetails = orders.getOrderDetailList();
        int total=0;
        for(OrderDetail orderDetail : orderDetails) {
            total+=orderDetail.getPrice()*orderDetail.getQuantity();
        }
        orderResponses.add(OrderResponse.builder()
                .code(orders.getId())
                .customer(orders.getUser().getName())
                .date(orders.getDate())
                .total(total)
                .hinhThuc("Thanh toán trực tiếp")
                .build());
        return orderResponses;


    }
    //name
    public static List<OrderResponse> nameToOrderResponse(List<Users> users) {
        List<OrderResponse> orderResponses = new ArrayList<>();
        for(Users user : users) {
            List<Orders> orders=user.getOrders();
            for(Orders order : orders) {
                List<OrderDetail> orderDetails = order.getOrderDetailList();
                int total=0;
                for(OrderDetail orderDetail : orderDetails) {
                    total+=orderDetail.getPrice()*orderDetail.getQuantity();
                }
                orderResponses.add(OrderResponse.builder()
                        .code(order.getId())
                        .date(order.getDate())
                        .customer(user.getName())
                        .total(total)
                        .hinhThuc("Thanh Toán Trực Tiếp").build());
            }
        }
        return orderResponses;
    }
    public static Users toUser(RegisterRequest registerRequest,Roles roles)
    {
        return Users.builder()
                .password(registerRequest.getPassword())
                .email(registerRequest.getEmail())
                .accountname(registerRequest.getUsername())
                .phone(registerRequest.getPhone())
                .name(registerRequest.getName())
                .role(roles)
                .build();
    }


}
