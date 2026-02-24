<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.User" %>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

List<Map<String,String>> cart =
    (List<Map<String,String>>) session.getAttribute("cart");

double total = 0;

if(cart != null){
    for(Map<String,String> item : cart){
        double price = Double.parseDouble(item.get("price"));
        int qty = Integer.parseInt(item.get("qty"));
        total += price * qty;
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>

<style>
body{
    margin:0;
    font-family:Segoe UI, Arial;
    background:#f2f2f2;
    display:flex;
    flex-direction:column;
    min-height:100vh;
}

.navbar{
    background:#ff7a18;
    color:white;
    padding:15px 45px;
    display:flex;
    justify-content:space-between;
}

.container{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
}

.payment-box{
    background:white;
    width:420px;
    padding:35px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.payment-box h2{
    margin-bottom:10px;
}

.total{
    font-size:20px;
    color:#ff7a18;
    margin:15px 0;
}

.qr{
    background:#f9f9f9;
    padding:25px;
    border-radius:10px;
    margin:20px 0;
    border:1px dashed #ccc;
}

.btn{
    background:#ff7a18;
    color:white;
    border:none;
    padding:10px 20px;
    border-radius:25px;
    cursor:pointer;
}

.btn:hover{
    background:#e5670f;
}

.footer{
    background:#ff7a18;
    color:white;
    text-align:center;
    padding:12px;
}
</style>
</head>

<body>

<div class="navbar">
    <div><b>🍔 FoodDelivery</b></div>
    <div>Payment</div>
</div>

<div class="container">
<div class="payment-box">

<h2>Complete Your Payment</h2>
<p>Hello, <%= user.getName() %></p>

<div class="total">
Total Amount: ₹ <%= total %>
</div>

<div class="qr">
<p><b>Scan & Pay (Demo UPI)</b></p>
<p>UPI ID: <b>niveditha@upi</b></p>
<p style="font-size:13px;color:gray;">(After payment click below)</p>
</div>

<form action="orderSuccess.jsp" method="post">
<button class="btn">I Have Paid</button>
</form>

</div>
</div>

<div class="footer">
© 2026 FoodDelivery | Developed by <b>Niveditha</b>
</div>

</body>
</html>