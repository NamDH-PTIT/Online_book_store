package com.example.Online_book_store.Entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Setter
@Getter
@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class PhieuNhap {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @ManyToOne
    @JoinColumn(name = "id_ncc")
    NhaCungCap nhaCungCap;
    String date;
    @OneToMany(mappedBy = "phieuNhap",cascade = CascadeType.ALL)
    List<ChiTietPhieuNhap> chiTietPhieuNhaps;
}
