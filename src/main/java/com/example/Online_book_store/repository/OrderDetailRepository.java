package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailRepository extends JpaRepository<OrderDetail,Integer> {
}
