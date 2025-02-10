package com.example.Online_book_store.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Setter
@Getter
@Builder

@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RegisterRequest
{
    String username;
    String name;
    String email;
    String password;
    String phone;

}

