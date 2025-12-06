package com.example.dao;
import com.example.model.Sale;
import java.time.LocalDate;
import java.util.ArrayList; import java.util.List;
public class SaleDAO {
    private static List<Sale> sales = new ArrayList<>();
    static { sales.add(new Sale(1,1,2,LocalDate.now())); }
    public List<Sale> getAllSales() { return sales; }
    public void addSale(Sale s) { sales.add(s); }
}
