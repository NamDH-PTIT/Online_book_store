package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
    @Query(value = "SELECT * FROM orders JOIN users ON users.id = orders.id_users WHERE users.name = ?1 AND orders.code = ?2", nativeQuery = true)
    Orders getOrder(String name, String code);
}
