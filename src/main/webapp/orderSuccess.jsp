<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.food.model.User, com.food.dao.OrderDAO" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

List<Map<String, String>> cart =
        (List<Map<String, String>>) session.getAttribute("cart");

Boolean orderSaved = (Boolean) session.getAttribute("orderSaved");

/* ===== SAVE ORDER ONLY ONCE ===== */
if (cart != null && !cart.isEmpty() && (orderSaved == null || !orderSaved)) {

    OrderDAO orderDAO = new OrderDAO();
    orderDAO.saveOrder(user.getEmail(), cart);

    session.removeAttribute("cart");
    session.setAttribute("orderSaved", true);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<link rel="stylesheet" href="style.css">

<style>
.success-container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:80vh;
}

.success-card{
    background:white;
    padding:50px;
    border-radius:16px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
    max-width:450px;
}

.success-icon{
    font-size:60px;
    margin-bottom:15px;
}

.success-card h2{
    color:#2563eb;
    margin-bottom:10px;
}

.success-card p{
    color:#555;
    margin-bottom:20px;
}

.btn-group{
    margin-top:20px;
}

.btn-group .btn{
    margin:8px;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">🍔 FoodDelivery</div>
    <div class="nav-links">
        <a href="menu.jsp">Menu</a>
        <a href="orderHistory.jsp">Orders</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="success-container">
<div class="success-card">

<div class="success-icon">✅</div>

<h2>Order Placed Successfully!</h2>
<p>Thank you, <b><%= user.getName() %></b></p>
<p>Your delicious food is on the way 🚀</p>

<div class="btn-group">
    <a href="menu.jsp">
        <button class="btn">Order More 🍔</button>
    </a>

    <a href="orderHistory.jsp">
        <button class="btn">View Orders 📦</button>
    </a>
</div>

</div>
</div>

</body>
</html>