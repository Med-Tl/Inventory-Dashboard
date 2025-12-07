package com.example.dao;

import com.example.model.User;
import java.sql.*;

public class UserDAO {

    public User login(String username, String password) {
        try {
            System.out.println("✅ UserDAO.login() START");

            Connection con = DBConnection.getConnection();

            if (con == null) {
                System.out.println("❌ DB CONNECTION IS NULL");
                return null;
            } else {
                System.out.println("✅ DB CONNECTION OK");
            }

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=?"
            );

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("✅ USER FOUND IN DB");

                String dbPassword = rs.getString("password");

                if (org.mindrot.jbcrypt.BCrypt.checkpw(password, dbPassword)) {
                    System.out.println("✅ PASSWORD MATCH");

                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setRole(rs.getString("role"));
                    return user;
                } else {
                    System.out.println("❌ PASSWORD DOES NOT MATCH");
                }
            } else {
                System.out.println("❌ USER NOT FOUND IN DB");
            }

        } catch (Exception e) {
            System.out.println("🔥 EXCEPTION IN LOGIN:");
            e.printStackTrace();
        }
        return null;
    }
}
