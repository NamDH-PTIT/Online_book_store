package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Orders;

import java.util.List;

public interface CreatSQL {
    List<Orders> getOrder(String name, String code);
}
