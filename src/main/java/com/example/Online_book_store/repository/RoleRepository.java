package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Roles, Integer> {
    Optional<Roles> findByDescription(String description);
}
