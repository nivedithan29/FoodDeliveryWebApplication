package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

import com.food.util.DBConnection;

public class OrderDAO {

    // ===== SAVE ORDER INTO DATABASE =====
    public void saveOrder(String userEmail, List<Map<String, String>> cart) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO orders (user_email, food_name, price, quantity) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            for (Map<String, String> item : cart) {

                ps.setString(1, userEmail);
                ps.setString(2, item.get("name"));
                ps.setDouble(3, Double.parseDouble(item.get("price")));
                ps.setInt(4, Integer.parseInt(item.get("qty")));

                ps.executeUpdate();
            }

            System.out.println("Order saved successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
