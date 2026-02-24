package com.food.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.dao.FoodDAO;

@WebServlet("/EditFoodServlet")
public class EditFoodServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String category = request.getParameter("category");
            String image = request.getParameter("image");

            FoodDAO dao = new FoodDAO();
            dao.updateFood(id, name, price, category, image);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin.jsp");
    }
}