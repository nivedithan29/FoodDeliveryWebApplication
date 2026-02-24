<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.dao.UserDAO" %>
<%@ page import="com.food.model.User" %>

<%
String message = null;
String messageColor = "red";

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    User user = new User();
    user.setName(name);
    user.setEmail(email);
    user.setPassword(password);

    UserDAO dao = new UserDAO();
    boolean status = dao.registerUser(user);

    if (status) {
        message = "Registration Successful ✔ Please Login";
        messageColor = "green";
    } else {
        message = "Registration Failed ❌ Email may already exist";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
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

.register-card{
    width:90%;
    max-width:360px;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 8px 25px rgba(0,0,0,0.15);
    text-align:center;
}

.register-card h2{
    color:#ff7a18;
}

.register-card input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:1px solid #ddd;
    border-radius:6px;
}

.btn{
    width:100%;
    background:#ff7a18;
    color:white;
    border:none;
    padding:12px;
    border-radius:25px;
    cursor:pointer;
}

@media (max-width:480px){
    .register-card{
        padding:22px;
        border-radius:10px;
    }
}
</style>
</head>

<body>

<div class="register-card">

<h2>🍔 FoodDelivery</h2>
<p>Create your account</p>

<% if(message != null){ %>
    <div class="message" style="color:<%=messageColor%>;">
        <%= message %>
    </div>
<% } %>

<form method="post">

<input type="text" name="name" placeholder="Full Name" required>
<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Password" required>

<button class="btn" type="submit">Register</button>

</form>

<br>
<a href="login.jsp">Already have an account? Login</a>

</div>

</body>
</html>