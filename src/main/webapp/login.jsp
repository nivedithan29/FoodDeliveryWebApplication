<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.dao.UserDAO" %>
<%@ page import="com.food.model.User" %>

<%
String error = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    UserDAO dao = new UserDAO();
    User user = dao.loginUser(email, password);

    if (user != null) {
        session.setAttribute("user", user);
        response.sendRedirect("home.jsp");
        return;
    } else {
        error = "Invalid Email or Password ❌";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="style.css">

<style>

body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#fff7f0;
    font-family:Segoe UI, Arial;
}

/* CARD */
.login-card{
    width:90%;
    max-width:360px;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 8px 25px rgba(0,0,0,0.15);
    text-align:center;
}

/* TEXT */
.login-card h2{
    color:#ff7a18;
}

.login-card p{
    color:gray;
}

/* INPUT */
.login-card input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid #ddd;
    border-radius:6px;
}

/* BUTTON */
.btn{
    width:100%;
    background:#ff7a18;
    color:white;
    border:none;
    padding:12px;
    border-radius:25px;
    cursor:pointer;
}

/* MOBILE IMPROVEMENT */
@media (max-width:480px){
    .login-card{
        padding:22px;
        border-radius:10px;
    }
}
</style>

</head>

<body>

<div class="login-card">

<h2>🍔 FoodDelivery</h2>
<p>Login to continue</p>

<% if(error != null){ %>
    <div class="error"><%= error %></div>
<% } %>

<form method="post">

<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Password" required>

<button class="btn" type="submit">Login</button>

</form>

<br>
<a href="register.jsp">Create Account</a>

</div>

</body>
</html>