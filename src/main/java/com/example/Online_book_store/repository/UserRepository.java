package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer> {
    Optional<List<Users>> findByName(String name);
    Optional<List<Users>> findByPhone(String phone);
    Optional<List<Users>> findByNameAndPhone(String name, String phone);
    Optional<Users> findByAccountname(String account_name);
}
