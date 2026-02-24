<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ page import="com.food.model.User" %>
<%@ page import="com.food.util.DBConnection" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

String email = user.getEmail();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">📦 FoodDelivery</div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">

<h2>Your Order History</h2>

<div class="card">

<table>
<tr>
    <th>Food</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Date</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    String sql = "SELECT * FROM orders WHERE user_email=? ORDER BY order_date DESC";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, email);

    ResultSet rs = ps.executeQuery();
    boolean hasData = false;

    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");

    while (rs.next()) {
        hasData = true;
%>

<tr>
    <td><%= rs.getString("food_name") %></td>
    <td>₹ <%= rs.getDouble("price") %></td>
    <td><%= rs.getInt("quantity") %></td>
    <td><%= sdf.format(rs.getTimestamp("order_date")) %></td>
</tr>

<%
    }

    if (!hasData) {
%>
<tr>
    <td colspan="4" class="empty">No orders yet 😢</td>
</tr>
<%
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>

</table>

</div>

</div>

</body>
</html>