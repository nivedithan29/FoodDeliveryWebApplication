<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home</title>

<style>
/* ===== BODY ===== */
body{
    margin:0;
    font-family:Segoe UI, Arial;
    background:#f2f2f2;

    display:flex;
    flex-direction:column;
    min-height:100vh;
}

/* ===== NAVBAR ===== */
.navbar{
    background:#ff7a18;
    color:white;
    padding:15px 45px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-weight:500;
}

/* ===== HERO ===== */
.hero{
    background:white;
    text-align:center;
    padding:60px 20px 45px;
}

.hero h1{
    margin:0;
}

.hero p{
    color:gray;
    margin:10px 0 18px;
}

.btn{
    background:#ff7a18;
    color:white;
    border:none;
    padding:10px 22px;
    border-radius:25px;
    cursor:pointer;
}

.btn:hover{
    background:#e5670f;
}

/* ===== CONTAINER ===== */
.container{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== CARDS ===== */
.cards{
    width:900px;
    display:flex;
    justify-content:space-between;
    gap:30px;
}

.card{
    flex:1;
    background:white;
    padding:25px;
    border-radius:10px;
    text-align:center;
    box-shadow:0 3px 10px rgba(0,0,0,0.08);
}

.card h3{
    margin-bottom:5px;
}

.card p{
    color:gray;
    margin-bottom:15px;
}

/* ===== FOOTER ===== */
.footer{
    background:#ff7a18;
    color:white;
    text-align:center;
    padding:14px;
}
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
  <div><b>🍔 FoodDelivery</b></div>

  <div>
    <a href="home.jsp">Home</a>
    <a href="menu.jsp">Menu</a>
    <a href="cart.jsp">Cart</a>
    <a href="orderHistory.jsp">Orders</a>
    <a href="logout.jsp">Logout</a>
  </div>
</div>

<!-- ===== HERO ===== -->
<div class="hero">
    <h1>Welcome, <%= user.getName() %> 👋</h1>
    <p>Ready to order something delicious today</p>
    <a href="menu.jsp"><button class="btn">Explore Menu</button></a>
</div>

<!-- ===== CENTER CARDS ===== -->
<div class="container">
<div class="cards">

<div class="card">
<h3>🍔 Menu</h3>
<p>Browse all delicious foods</p>
<a href="menu.jsp"><button class="btn">Open Menu</button></a>
</div>

<div class="card">
<h3>🛒 Cart</h3>
<p>View your selected items</p>
<a href="cart.jsp"><button class="btn">View Cart</button></a>
</div>

<div class="card">
<h3>📦 Orders</h3>
<p>Check your order history</p>
<a href="orderHistory.jsp"><button class="btn">View Orders</button></a>
</div>

</div>
</div>

<!-- ===== FOOTER ===== -->
<div class="footer">
© 2026 FoodDelivery | Developed by <b>Niveditha</b>
</div>

</body>
</html>