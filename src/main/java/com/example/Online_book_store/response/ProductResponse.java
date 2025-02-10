package com.example.Online_book_store.response;

import lombok.*;
import lombok.experimental.FieldDefaults;
@Builder(toBuilder = true) // Cho phép sử dụng toBuilder()
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductResponse {
    String name;//
    int quantity;
    String nhaCungCap;
    Integer gia;//book
    Integer giaNhap;//ctpn
    Integer soLuongTon;//book
    Double giamGia;//

}
