package com.example.dao;
import com.example.model.Product;
import java.util.ArrayList; import java.util.List;
public class ProductDAO {
    private static List<Product> products = new ArrayList<>();
    static { products.add(new Product(1,"Laptop",10,1200.0)); products.add(new Product(2,"Mouse",50,25.0)); }
    public List<Product> getAllProducts() { return products; }
    public void addProduct(Product p) { products.add(p); }
}
