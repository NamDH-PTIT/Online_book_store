package com.example.Online_book_store.request;

public class ChiTietPhieuNhapRequest {
    private String book;
    private int quantity;
    private String author;
    private String category;
    private double price;





    public String getBook() {
        return book;
    }

    public void setBook(String name) {
        this.book = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
