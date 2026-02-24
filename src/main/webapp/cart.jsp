<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.User" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

List<Map<String, String>> cart =
    (List<Map<String, String>>) session.getAttribute("cart");

if (cart == null) cart = new ArrayList<>();

String removeIndex = request.getParameter("removeIndex");
if (removeIndex != null) {
    int index = Integer.parseInt(removeIndex);
    if (index >= 0 && index < cart.size()) {
        cart.remove(index);
    }
    session.setAttribute("cart", cart);
}

String action = request.getParameter("action");
String indexStr = request.getParameter("index");

if (action != null && indexStr != null) {
    int i = Integer.parseInt(indexStr);

    if (i >= 0 && i < cart.size()) {
        Map<String, String> item = cart.get(i);
        int qty = Integer.parseInt(item.get("qty"));

        if ("inc".equals(action)) qty++;
        else if ("dec".equals(action) && qty > 1) qty--;

        item.put("qty", String.valueOf(qty));
    }
    session.setAttribute("cart", cart);
}

if ("POST".equalsIgnoreCase(request.getMethod())
        && request.getParameter("name") != null
        && request.getParameter("removeIndex") == null
        && request.getParameter("action") == null) {

    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String category = request.getParameter("category");
    String qty = request.getParameter("qty");

    if (qty == null || qty.isEmpty()) qty = "1";

    Map<String, String> item = new HashMap<>();
    item.put("name", name);
    item.put("price", price);
    item.put("category", category);
    item.put("qty", qty);

    cart.add(item);
    session.setAttribute("cart", cart);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">🍔 FoodDelivery</div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="orderHistory.jsp">Orders</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="cart-box">

<h2 class="cart-title">🛒 Your Cart</h2>

<%
if (cart.isEmpty()) {
%>
<p class="empty-cart">Your cart is empty 😢</p>
<%
} else {

double total = 0;
%>

<table>
<tr>
    <th>Image</th>
    <th>Name</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Subtotal</th>
    <th>Remove</th>
</tr>

<%
for (int i = 0; i < cart.size(); i++) {
Map<String, String> item = cart.get(i);

double price = Double.parseDouble(item.get("price"));
int qty = Integer.parseInt(item.get("qty"));
double subtotal = price * qty;
total += subtotal;
%>

<tr>

<td>
<img src="images/<%= item.get("name").toLowerCase().replace(" ", "") %>.jpg"
     width="70" height="55"
     style="border-radius:6px;"
     onerror="this.src='images/default.jpg'">
</td>

<td><%= item.get("name") %></td>
<td>₹ <%= price %></td>

<td>

<form method="post" action="cart.jsp" style="display:inline;">
<input type="hidden" name="index" value="<%= i %>">
<input type="hidden" name="action" value="dec">
<button class="btn" style="padding:4px 10px;">-</button>
</form>

<b> <%= qty %> </b>

<form method="post" action="cart.jsp" style="display:inline;">
<input type="hidden" name="index" value="<%= i %>">
<input type="hidden" name="action" value="inc">
<button class="btn" style="padding:4px 10px;">+</button>
</form>

</td>

<td>₹ <%= subtotal %></td>

<td>
<form method="post" action="cart.jsp">
<input type="hidden" name="removeIndex" value="<%= i %>">
<button class="btn" style="background:red;">Remove</button>
</form>
</td>

</tr>

<%
}
%>

</table>

<h3 style="text-align:right; margin-top:20px;">
Total: ₹ <%= total %>
</h3>

<form action="orderSuccess.jsp" method="post" style="text-align:right;">
<button class="btn">Place Order</button>
</form>

<%
}
%>

</div>

<div class="footer">
© 2026 Food Delivery | Developed by Niveditha
</div>

</body>
</html>