package com.example.Online_book_store.repository.impl;

import com.example.Online_book_store.Entity.Orders;
import com.example.Online_book_store.repository.CreatSQL;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.List;

@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class CreatSQLimpl implements CreatSQL {
    EntityManager entityManager;
    @Override
    public List<Orders> getOrder(String name, String code) {
        String sql="select * from orders join users on users.id = orders.id_users where users.name = ? and orders.code = ?";
        Query query = entityManager.createNativeQuery(sql, Orders.class);
        query.setParameter(1, name);
        query.setParameter(2, code);
        return query.getResultList();
    }
}
