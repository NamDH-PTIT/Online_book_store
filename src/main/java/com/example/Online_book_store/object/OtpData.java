package com.example.Online_book_store.object;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class OtpData {
    private String otp;
    private LocalDateTime date;

}
