package com.example.Online_book_store.repository;

import com.example.Online_book_store.Entity.Book;
import com.example.Online_book_store.Entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface BookRepository extends JpaRepository<Book, Integer> {

    Optional<Book> findByTitle(String title);
    @Query(value = "SELECT * FROM book WHERE title LIKE %?1%", nativeQuery = true)
    List<Book> findBooksByTitle(String title);
    @Query(value = "SELECT * FROM book WHERE soluongton < 20 ORDER BY soluongton ASC", nativeQuery = true)
    List<Book> getQuantityBook();
}
