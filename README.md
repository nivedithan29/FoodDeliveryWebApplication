# 🍔 Food Delivery Web Application

A complete full-stack **Food Ordering Web Application** built using **Java (JSP & Servlets), MySQL, HTML, CSS and Apache Tomcat**.  
This system allows users to browse food items, manage cart, place orders and view order history through a clean and simple interface.

The project follows **MVC (Model-View-Controller)** architecture and demonstrates real-world dynamic web application development from scratch.

---

## 📌 Project Overview

This application simulates a real online food ordering system where users can:

- Create account and login securely
- Browse food menu by category
- Search food items instantly
- Add items to cart
- Update quantity / remove items
- Place orders
- View order history
- Admin manages food items
- Fully database driven system

---

## 🧠 Technology Stack

**Frontend**
- HTML
- CSS
- JSP

**Backend**
- Java Servlets
- JDBC

**Database**
- MySQL

**Server**
- Apache Tomcat 10

**Tools Used**
- Eclipse IDE
- Git & GitHub

---

## ✨ Features

### 👤 User Module
- User Registration & Login
- Session based authentication
- Browse food by category
- Search food instantly
- Add to cart
- Increase / Decrease quantity
- Remove items from cart
- Place order
- View order history

### 🛠 Admin Module
- Add new food items
- Delete food items
- Manage menu dynamically

---

## 🗂 Project Structure

```
FoodDeliveryApp/
│
├── src/
│   ├── com.food.dao
│   ├── com.food.model
│   ├── com.food.servlet
│   └── com.food.util
│
├── WebContent/
│   ├── images/
│   ├── style.css
│   ├── home.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── admin.jsp
│   ├── orderHistory.jsp
│   ├── payment.jsp
│   └── orderSuccess.jsp
│
└── README.md
```

---

## ⚙️ How to Run the Project

### 1️⃣ Clone Repository

```
git clone https://github.com/your-username/FoodDeliveryApp.git
```

---

### 2️⃣ Import into Eclipse

- Open Eclipse
- File → Import → Existing Projects into Workspace
- Select project folder
- Add Apache Tomcat Server
- Run on Server

---

### 3️⃣ Setup Database

Create database:

```sql
CREATE DATABASE fooddb;
USE fooddb;
```

Create tables:

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(100)
);

CREATE TABLE food_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DOUBLE,
  category VARCHAR(50),
  image VARCHAR(100)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_email VARCHAR(100),
  food_name VARCHAR(100),
  price DOUBLE,
  quantity INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

### 4️⃣ Configure Database Connection

Edit **DBConnection.java**

```java
String url = "jdbc:mysql://localhost:3306/fooddb";
String user = "root";
String pass = "your-password";
```

---

### 5️⃣ Run Application

Open browser:

```
http://localhost:8080/FoodDeliveryApp
```

---

## 💳 Payment

This project currently uses **demo payment simulation** only.  
No real payment gateway is integrated.

---

## 📸 Screenshots

Add screenshots inside a folder named **screenshots** in this repository.

Recommended screenshots:
- Login Page
- Register Page
- Dashboard
- Food Menu
- Cart Page
- Order History
- Payment Page

---

## 🎯 Learning Outcomes

- Full stack Java web development
- JSP & Servlet architecture
- JDBC + MySQL integration
- Session management
- CRUD operations
- MVC design pattern
- UI/UX structuring
- Git & GitHub workflow

---

## 🚀 Future Improvements

- Mobile responsive UI
- Real payment gateway (UPI / Razorpay / Stripe)
- Order tracking system
- Admin analytics dashboard
- Image upload from admin panel
- Email notifications
- Cloud deployment

---

## 👩‍💻 Developed By

**Niveditha**
