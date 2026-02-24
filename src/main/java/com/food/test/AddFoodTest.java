package com.food.test;

import com.food.dao.FoodDAO;
import com.food.model.Food;

public class AddFoodTest {

    public static void main(String[] args) {

        // Create Food object
        Food food = new Food();

        // Set values
        food.setName("Burger");
        food.setPrice(120);
        food.setCategory("Fast Food");

        // Call DAO to insert into DB
        FoodDAO dao = new FoodDAO();
        dao.addFood(food);
    }
}
