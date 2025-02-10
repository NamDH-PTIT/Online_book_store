package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.NhaCungCap;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NhaCungCapRepository extends JpaRepository<NhaCungCap, Integer> {
    Optional<NhaCungCap> findByName(String name);
}
