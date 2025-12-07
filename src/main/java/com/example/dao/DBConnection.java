package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/inventorydb",
                "inventoryuser",
                "Medtl11"
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
