package com.example.model;
import java.time.LocalDate;
public class Sale {
    private int id; private int productId; private int quantity; private LocalDate date;
    public Sale() {}
    public Sale(int id, int productId, int quantity, LocalDate date) {
        this.id = id; this.productId = productId; this.quantity = quantity; this.date = date;
    }
    public int getId() { return id; } public void setId(int id) { this.id = id; }
    public int getProductId() { return productId; } public void setProductId(int productId) { this.productId = productId; }
    public int getQuantity() { return quantity; } public void setQuantity(int quantity) { this.quantity = quantity; }
    public LocalDate getDate() { return date; } public void setDate(LocalDate date) { this.date = date; }
}
