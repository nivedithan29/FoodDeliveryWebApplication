package com.food.Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.dao.FoodDAO;
import com.food.model.Food;

@WebServlet("/SearchFoodServlet")
public class SearchFoodServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");

        if (category == null) category = "All";

        if (keyword == null || keyword.trim().isEmpty()) {
            response.sendRedirect("menu.jsp");
            return;
        }

        FoodDAO dao = new FoodDAO();
        List<Food> foodList = dao.searchFood(keyword, category);

        request.setAttribute("foodList", foodList);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}