package com.food.dao;

import java.sql.*;              // For DB connection, PreparedStatement, ResultSet
import java.util.*;             // For List, ArrayList

import com.food.model.Food;     // Food model class
import com.food.util.DBConnection;  // Your DB connection class

public class FoodDAO {

    // =====================================================
    // ADD NEW FOOD INTO DATABASE
    // =====================================================
    public void addFood(Food food) {
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO food_items(name,price,category,image) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, food.getName());
            ps.setDouble(2, food.getPrice());
            ps.setString(3, food.getCategory());
            ps.setString(4, food.getImage());

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // =====================================================
    // GET ALL FOOD ITEMS
    // =====================================================
    public List<Food> getAllFood() {

        List<Food> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM food_items";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Food f = new Food();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setPrice(rs.getDouble("price"));
                f.setCategory(rs.getString("category"));
                f.setImage(rs.getString("image"));

                list.add(f);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // =====================================================
    // GET FOOD BY CATEGORY (FILTER)
    // =====================================================
    public List<Food> getFoodByCategory(String category) {

        List<Food> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM food_items WHERE category=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Food f = new Food();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setPrice(rs.getDouble("price"));
                f.setCategory(rs.getString("category"));
                f.setImage(rs.getString("image"));

                list.add(f);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // =====================================================
    // SEARCH FOOD BY NAME + CATEGORY
    // =====================================================
    public List<Food> searchFood(String keyword, String category) {

        List<Food> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql;

            // If category selected
            if(category != null && !category.equals("All")) {
                sql = "SELECT * FROM food_items WHERE name LIKE ? AND category=?";
            } else {
                sql = "SELECT * FROM food_items WHERE name LIKE ?";
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            if(category != null && !category.equals("All")) {
                ps.setString(2, category);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Food f = new Food();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setPrice(rs.getDouble("price"));
                f.setCategory(rs.getString("category"));
                f.setImage(rs.getString("image"));

                list.add(f);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    // =====================================================
    // UPDATE FOOD (ADMIN EDIT)
    // =====================================================
    public void updateFood(int id, String name, double price, String category, String image) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE food_items SET name=?,price=?,category=?,image=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, category);
            ps.setString(4, image);
            ps.setInt(5, id);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // =====================================================
    // DELETE FOOD (ADMIN DELETE)
    // =====================================================
    public void deleteFood(int id) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM food_items WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // =====================================================
    // GET ALL CATEGORIES (FOR MENU FILTER)
    // =====================================================
    public List<String> getAllCategories() {

        List<String> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT DISTINCT category FROM food_items";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                list.add(rs.getString("category"));
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}