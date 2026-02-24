package com.food.test;

import com.food.util.DBConnection;
import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        // Call DBConnection class to get database connection
        Connection con = DBConnection.getConnection();

        // Check if connection is successful
        if (con != null) {
            System.out.println("Connection test SUCCESS");
        } else {
            System.out.println("Connection FAILED");
        }
    }
}
