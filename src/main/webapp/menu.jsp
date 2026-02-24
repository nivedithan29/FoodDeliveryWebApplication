<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.food.dao.FoodDAO" %>
<%@ page import="com.food.model.Food" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

String category = request.getParameter("category");
String keyword = request.getParameter("keyword");

if (category == null) category = "All";

FoodDAO dao = new FoodDAO();
List<Food> foodList = null;

try {
    if (keyword != null && !keyword.trim().isEmpty()) {
        foodList = dao.searchFood(keyword, category);
    } 
    else if (!"All".equals(category)) {
        foodList = dao.getFoodByCategory(category);
    } 
    else {
        foodList = dao.getAllFood();
    }
} catch (Exception e) {
    e.printStackTrace();
}

List<String> categories = dao.getAllCategories();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Menu</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">🍔 FoodDelivery</div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="orderHistory.jsp">Orders</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">

<h2>Food Menu</h2>

<!-- SEARCH -->
<div class="search-box">
<form action="menu.jsp" method="get">

<input type="text" name="keyword"
       placeholder="Search food..."
       value="<%= keyword != null ? keyword : "" %>">

<input type="hidden" name="category" value="<%= category %>">

<button class="btn" type="submit">🔍 Search</button>

</form>
</div>

<!-- CATEGORY FILTER -->
<div style="text-align:center; margin-bottom:20px;">

<a href="menu.jsp?category=All"
   class="cat-btn <%= "All".equals(category) ? "active-cat" : "" %>">
   All
</a>

<%
if(categories != null){
for(String cat : categories){
%>

<a href="menu.jsp?category=<%= cat %>"
   class="cat-btn <%= cat.equals(category) ? "active-cat" : "" %>">
   <%= cat %>
</a>

<%
}}
%>

</div>

<!-- FOOD GRID -->
<div class="food-grid">

<%
if (foodList != null && !foodList.isEmpty()) {
for (Food f : foodList) {

String img = f.getImage();
if(img == null || img.trim().isEmpty()) img = "default.jpg";
%>

<div class="food-card">

<img src="<%=request.getContextPath()%>/images/<%= img %>"
     onerror="this.src='<%=request.getContextPath()%>/images/default.jpg'">

<h3><%= f.getName() %></h3>
<p class="price">₹ <%= f.getPrice() %></p>

<div class="category-badge"><%= f.getCategory() %></div>

<form action="cart.jsp" method="post">
<input type="hidden" name="name" value="<%= f.getName() %>">
<input type="hidden" name="price" value="<%= f.getPrice() %>">
<input type="hidden" name="category" value="<%= f.getCategory() %>">
<input type="hidden" name="qty" value="1">

<button class="btn">Add to Cart 🛒</button>
</form>

</div>

<%
}
} else {
%>

<p class="empty">No food found 😢</p>

<%
}
%>

</div>
</div>

</body>
</html>