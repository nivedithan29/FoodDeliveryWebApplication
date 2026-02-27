# 🍔 Food Delivery Web Application

A Full Stack Food Ordering Web Application developed using **Java (JSP & Servlets), MySQL, JDBC, HTML, CSS, and Apache Tomcat**.

This application allows users to browse food items, manage cart, place orders, and view order history.  
The system follows **MVC (Model-View-Controller) Architecture** to ensure clean code structure and maintainability.

---

## 📌 Project Objective

To design and implement a real-world food ordering system that simulates online food delivery platforms.  
The project focuses on backend logic, session management, database integration, and dynamic content rendering.

---

## 🏗 Architecture Overview

The application follows MVC architecture:

User → JSP (View) → Servlet (Controller) → DAO (Model) → MySQL Database

- **Model** – Handles business logic & database operations (DAO classes)
- **View** – JSP pages for UI rendering
- **Controller** – Servlets to process requests and manage flow

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
- Clean Orange & White UI Design

---

## 🛠 Technology Stack

### 💻 Backend
- Java
- Servlets
- JDBC

### 🎨 Frontend
- HTML
- CSS
- JSP

### 🗄 Database
- MySQL

### 🖥 Server
- Apache Tomcat 10

### 🧰 Tools
- Eclipse IDE
- Git & GitHub

---

## 📂 Project Structure

```
FoodDeliveryApp
│
├── src/main/java/com/food
│   ├── dao (FoodDAO, UserDAO, OrderDAO)
│   ├── model (Food, User)
│   ├── servlet (AddFoodServlet, DeleteFoodServlet, SearchFoodServlet, etc.)
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
│   └── admin.jsp
```

---

## 🔄 Application Flow

1. User registers and logs in
2. Login creates a session
3. Menu is fetched dynamically from database
4. Cart is stored in session
5. Order details inserted into database
6. Order history retrieved using DAO layer

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

### 3️⃣ Configure Database Connection

Update `DBConnection.java`:

```java
String url = "jdbc:mysql://localhost:3306/foodapp";
String user = "root";
String password = "your_password";
```

---

### 4️⃣ Run the Application

1. Import project into Eclipse
2. Add MySQL Connector JAR
3. Configure Apache Tomcat
4. Run project on server
5. Open in browser:

```
http://localhost:8080/FoodDeliveryApp
```

---

## 📸 Screenshots

(Add screenshots inside /screenshots folder and link here)

```
![Login Page](screenshots/login.png)
![Menu Page](screenshots/menu.png)
![Cart Page](screenshots/cart.png)
![Admin Panel](screenshots/admin.png)
```

---

## 🎥 Live Demo

▶ Watch Demo:  
https://www.loom.com/share/ad7ae07f08b64c92a55f8602d1fccd80

---

## 🚧 Challenges Faced

- Managing session after login
- Maintaining cart state across pages
- Handling dynamic data rendering in JSP
- JDBC connection management
- Designing clean MVC structure

---

## 🔮 Future Improvements

- Password Encryption (BCrypt)
- Online Payment Integration (Razorpay / Stripe)
- Mobile Responsive UI
- Order Tracking System
- Admin Analytics Dashboard
- Cloud Deployment (AWS / Render)

---

## 🎯 Learning Outcomes

- Full Stack Java Web Development
- MVC Architecture Implementation
- JDBC & MySQL Integration
- Session Handling
- CRUD Operations
- Project Structuring & Debugging
- Git & GitHub Workflow

---

## 👩‍💻 Developed By

**Niveditha N**  


✨ Keep Learning • Keep Building • Keep Growing ✨
