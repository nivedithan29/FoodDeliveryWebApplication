# 🍔 Food Delivery Web Application

A full-stack Food Ordering Web Application developed using Java (JSP & Servlets), MySQL, JDBC, HTML, CSS, and Apache Tomcat.  
This system allows users to browse food items, manage cart, place orders, and view order history through a clean and structured interface.

The application follows MVC (Model-View-Controller) architecture and demonstrates complete dynamic web application development.

---

## 📌 Project Objective

To design and implement a complete food ordering system that simulates real-world online food delivery platforms.  
The project focuses on backend logic, database integration, session management, and user-friendly UI design.

---

## 🚀 Features

### 👤 User Module
- User Registration & Login
- Session-based Authentication
- Browse Food Menu by Category
- Search Food Items
- Add to Cart
- Update Quantity / Remove Items
- Place Order
- View Order History

### 🛠 Admin Module
- Add Food Items
- Delete Food Items
- Manage Menu Dynamically

### 💾 System Features
- MySQL Database Integration
- JDBC Connectivity
- MVC Architecture
- Session Management
- Dynamic Content Rendering
- Clean Orange + White UI Design

---

## 🛠 Technology Stack

Frontend:
- HTML
- CSS
- JSP

Backend:
- Java
- Servlets
- JDBC

Database:
- MySQL

Server:
- Apache Tomcat 10

Tools:
- Eclipse IDE
- Git & GitHub

---

## 🏗 Project Structure

FoodDeliveryApp  
│  
├── src/main/java/com/food  
│   ├── dao (FoodDAO, UserDAO, OrderDAO)  
│   ├── model (Food, User)  
│   ├── servlet (AddFood, DeleteFood, SearchFood, etc.)  
│   └── util (DBConnection)  
│  
├── src/main/webapp  
│   ├── images  
│   ├── style.css  
│   ├── home.jsp  
│   ├── menu.jsp  
│   ├── cart.jsp  
│   ├── login.jsp  
│   ├── register.jsp  
│   ├── orderHistory.jsp  
│   ├── orderSuccess.jsp  
|    └── admin.jsp  

---

## ⚙️ How to Run the Project

### 1️⃣ Requirements
- Java 17+
- MySQL
- Apache Tomcat 10
- Eclipse IDE

---

### 2️⃣ Database Setup

Create database:

```sql
CREATE DATABASE foodapp;
USE foodapp;
```

Create Users Table:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
```

Create Food Table:

```sql
CREATE TABLE food (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DOUBLE,
    category VARCHAR(50),
    image VARCHAR(100)
);
```

Create Orders Table:

```sql
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

### 3️⃣ Configure Database

Update DBConnection.java:

```java
String url = "jdbc:mysql://localhost:3306/foodapp";
String user = "root";
String password = "your_password";
```

---

### 4️⃣ Run Application

- Import project into Eclipse
- Add MySQL Connector JAR
- Run on Apache Tomcat
- Open in browser:

http://localhost:8080/FoodDeliveryApp

---

## 📸 Screenshots Included

- Login Page  
- Register Page  
- Dashboard  
- Food Menu  
- Cart Page  
- Order History  
- Admin Panel  
- Order Success Page  

---

## 🎥 Live Project Demo

A complete walkthrough of the Food Delivery Web Application including user flow, cart system, and admin panel.

▶️ Watch Demo:  
https://www.loom.com/share/ad7ae07f08b64c92a55f8602d1fccd80

 ---

## 🔮 Future Improvements

- Online Payment Integration (Razorpay / Stripe)
- Mobile Responsive UI
- Order Tracking System
- Admin Analytics Dashboard
- Cloud Deployment

---

## 🎯 Learning Outcomes

- Full Stack Java Web Development
- MVC Architecture
- JDBC & MySQL Integration
- Session Handling
- CRUD Operations
- Project Structuring & Debugging
- Git & GitHub Workflow

---

## 👩‍💻 Developed by Niveditha N
