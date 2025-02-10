package com.example.Online_book_store.request;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Setter
@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDetailRequest {
    int id;
    double price;
    int quantity;

}
