package com.example.Online_book_store.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Setter
@Getter
@Builder

@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class EditUserRequest
{
    String role;
    String account_name;
    String password;
    String phone;
    String name;

}

