package com.example.Online_book_store.response;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Builder(toBuilder = true) // Cho phép sử dụng toBuilder()
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)

public class OrderResponse {
    int code;
    String customer;
    String hinhThuc;
    String date;
    int total;
}
