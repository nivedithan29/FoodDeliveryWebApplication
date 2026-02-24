package com.food.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // Method to create and return database connection
    public static Connection getConnection() {

        Connection con = null;  // connection object

        try {
            // 1. Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Create connection to database
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/food_delivery_db", // DB URL
                    "root",                                         // MySQL username
                    "root"                                 // MySQL password
            );

            // If connection successful
            System.out.println("Database Connected Successfully");

        } catch (Exception e) {
            // If any error occurs, print error
            e.printStackTrace();
        }

        // Return connection object
        return con;
    }
}
