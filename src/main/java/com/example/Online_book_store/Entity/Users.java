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
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column(unique=true,nullable=false)
    String accountname;
    String password;
    String name ;
    String phone;
    String email;
    @ManyToOne
    @JoinColumn(name = "user_role")
    Roles role;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Orders> orders;


}
