<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.food.model.Food" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="navbar">
    <div class="logo">🍔 FoodDelivery</div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="orderHistory.jsp">Orders</a>
    </div>
</div>

<div class="container">

<h2>Search Results</h2>

<div class="food-grid">

<%
List<Food> list = (List<Food>) request.getAttribute("foodList");

if(list == null || list.isEmpty()){
%>
    <p class="empty">No food found 😢</p>
<%
}else{
    for(Food f : list){

        String img = f.getImage();
        if(img == null || img.trim().isEmpty()) img = "default.jpg";
%>

<div class="food-card">

<img src="<%=request.getContextPath()%>/images/<%=img%>"
     onerror="this.src='<%=request.getContextPath()%>/images/default.jpg'">

<h3><%=f.getName()%></h3>
<p class="price">₹ <%=f.getPrice()%></p>
<p><%=f.getCategory()%></p>

</div>

<%
    }
}
%>

</div>
</div>

</body>
</html>