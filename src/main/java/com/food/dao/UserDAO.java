package com.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.model.User;
import com.food.util.DBConnection;

public class UserDAO {

    // =========================
    // REGISTER USER (CREATE ACCOUNT)
    // =========================
    public boolean registerUser(User user) {

        try {
            // SQL query to insert user
            String sql = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";

            // Get database connection
            Connection con = DBConnection.getConnection();

            // Prepare statement
            PreparedStatement ps = con.prepareStatement(sql);

            // Set values
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            // Execute insert
            int rows = ps.executeUpdate();

            // If row inserted → success
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // LOGIN USER
    // =========================
    public User loginUser(String email, String password) {

        User user = null;

        try {
            // SQL query to check user
            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            // Get DB connection
            Connection con = DBConnection.getConnection();

            // Prepare statement
            PreparedStatement ps = con.prepareStatement(sql);

            // Set values
            ps.setString(1, email);
            ps.setString(2, password);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // If user found
            if (rs.next()) {
                user = new User();

                // Set user data from DB
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
