<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Food</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="navbar">
    <div class="logo">🍔 FoodDelivery</div>
    <div class="nav-links">
        <a href="admin.jsp">Admin</a>
        <a href="menu.jsp">Menu</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="form-box">
<h2>Add Food Item</h2>

<form action="addFood" method="post">

    <input type="text" name="name" placeholder="Food Name" required>

    <input type="number" name="price" step="0.01" placeholder="Price" required>

    <input type="text" name="category" placeholder="Category" required>

    <input type="text" name="image" placeholder="image.jpg" required>

    <button type="submit" class="btn">Add Food</button>

</form>

</div>

<div class="footer">
© 2026 Food Delivery | Developed by Niveditha
</div>

</body>
</html>