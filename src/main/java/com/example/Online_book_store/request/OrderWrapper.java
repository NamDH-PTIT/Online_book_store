package com.example.Online_book_store.request;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Setter
@Getter
public class OrderWrapper {
    List<OrderDetailRequest> product;
}
