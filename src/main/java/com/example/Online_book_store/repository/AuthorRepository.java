package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Author;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AuthorRepository extends JpaRepository<Author, Integer> {
    Optional<Author> findByName(String name);
}
