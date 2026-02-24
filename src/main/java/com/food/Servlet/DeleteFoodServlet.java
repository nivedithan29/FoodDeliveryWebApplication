package com.food.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.food.dao.FoodDAO;

@WebServlet("/deleteFood")
public class DeleteFoodServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            FoodDAO dao = new FoodDAO();
            dao.deleteFood(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // redirect back to admin page
        response.sendRedirect("admin.jsp");
    }
}