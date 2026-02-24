package com.food.Servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.food.dao.FoodDAO;
import com.food.model.Food;

@WebServlet("/AddFoodServlet")
@MultipartConfig
public class AddFoodServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        String image = request.getParameter("images");

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // ===== Save image to /images folder =====
        String uploadPath = getServletContext().getRealPath("") + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        filePart.write(uploadPath + File.separator + fileName);

        // ===== Save into DB =====
        Food food = new Food();
        food.setName(name);
        food.setPrice(price);
        food.setCategory(category);
        food.setImage(fileName);   // ⭐ CORRECT LINE

        FoodDAO dao = new FoodDAO();
        dao.addFood(food);

        response.sendRedirect("admin.jsp");
    }
}