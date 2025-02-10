package com.example.Online_book_store.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {
    ERROR_CODE(1000,"lỗi");

    ErrorCode(int code, String msg) {
        this.code=code;
        this.msg=msg;
    }
    private final int code;
    private final String msg;
}
