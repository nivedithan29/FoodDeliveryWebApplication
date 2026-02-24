<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.food.dao.FoodDAO" %>
<%@ page import="com.food.model.Food" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">🍔 FoodDelivery Admin</div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">

<h2>Admin Panel</h2>

<br>
<a href="addFood.jsp" class="btn">+ Add Food</a>

<br><br>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Price</th>
<th>Category</th>
<th>Image</th>
<th>Action</th>
</tr>

<%
FoodDAO dao = new FoodDAO();
List<Food> list = dao.getAllFood();

for(Food f : list){
%>

<tr>
<td><%= f.getId() %></td>
<td><%= f.getName() %></td>
<td>₹ <%= f.getPrice() %></td>
<td><%= f.getCategory() %></td>

<td>
<img src="<%=request.getContextPath()%>/images/<%= f.getImage() %>"
     width="60" height="60"
     style="border-radius:6px;"
     onerror="this.src='images/default.jpg'">
</td>

<td>
<a href="deleteFood?id=<%= f.getId() %>">
<button class="btn" style="background:red;">Delete</button>
</a>
</td>

</tr>

<% } %>

</table>

</div>

<div class="footer">
© 2026 Food Delivery | Developed by Niveditha
</div>

</body>
</html>