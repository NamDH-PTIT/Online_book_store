package com.example.Online_book_store.response;

import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.FieldDefaults;


@Setter
@Getter
@Builder

@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse {
    String role;
    String account_name;
    String password;
    String phone;
    String name;
    String email;


}
