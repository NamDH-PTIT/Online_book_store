package com.example.Online_book_store.Entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Setter
@Getter
@Builder(toBuilder = true) // Cho phép sử dụng toBuilder()
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String title;
    String description;
    int soluongton;
    int price;
    String img;
    @ManyToOne
    @JoinColumn(name ="id_tacgia")
    Author author;
    @ManyToOne
    @JoinColumn(name="id_theloai")
    Category category;

    @OneToMany(mappedBy = "book",cascade = CascadeType.ALL)
    List<ChiTietPhieuNhap> chiTietPhieuNhaps;


}
