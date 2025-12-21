# BiteNow 🍔🚴‍♂️  
Online Food Delivery Application

BiteNow is a **full-stack online food delivery application** designed to provide end-to-end food ordering functionality, similar to real-world food delivery platforms.  
The project focuses on **backend engineering, clean architecture, and system design**, built entirely using Java-based technologies.

---

## 📌 Project Overview
BiteNow enables users to:
- Browse restaurants
- View menus
- Add items to cart
- Place food orders
- Track order history  

The application is built using **JSP, Servlets, JDBC, and MySQL**, following **OOPS principles and Low-Level System Design** to ensure scalability and maintainability.

---

## 🎯 Project Goals
- Build a real-world food delivery system from scratch
- Implement complete order lifecycle management
- Apply backend engineering best practices
- Design a scalable and modular architecture

---

## 🛠 Tech Stack
- **Backend:** Java, JSP, Servlets, JDBC  
- **Database:** MySQL  
- **Programming Concepts:** OOPS, Collections Framework  
- **Architecture:** Low-Level Design (LLD)  
- **Tools:** Apache Tomcat, Git, GitHub  

---

## 🧠 Key Concepts Used
- MVC-like layered architecture  
- DAO design pattern for database access  
- Collections (`List`, `Map`) for cart and menu management  
- Session management for user authentication  
- CRUD operations using JDBC  
- Low-Level System Design principles  

---

## 📂 Project Structure
BiteNow/
│
├── src/
│ ├── controller/ # Servlets (Request handling)
│ ├── dao/ # Data Access Objects
│ ├── model/ # POJO classes
│ └── util/ # DB connection utilities
│
├── WebContent/
│ ├── jsp/ # JSP pages (UI)
│ ├── css/ # Stylesheets
│ └── images/ # App assets
│
└── README.md


---

## 🍽 Features Implemented

### 👤 User Features
- User registration and login
- Restaurant listing and search
- Menu browsing by restaurant
- Add/remove items from cart
- Place food orders
- View order history

### 🛒 Cart & Order Management
- Dynamic cart using Java Collections
- Quantity-based price calculation
- Order confirmation and summary
- Persistent order storage in database

### 🏪 Restaurant Management
- Restaurant and menu data stored in MySQL
- Menu availability handling
- Ratings and pricing support

---

## ⚙️ Application Flow
1. User logs in or registers  
2. Browses restaurants  
3. Selects a restaurant and views menu  
4. Adds items to cart  
5. Places an order  
6. Order details stored in database  
7. User can view order history  

---

## 🧩 Low-Level System Design Overview
- **Controller Layer:** Handles HTTP requests using Servlets  
- **Service/DAO Layer:** Business logic and DB interaction  
- **Model Layer:** POJO classes representing entities  
- **Database Layer:** MySQL for persistent storage  

This layered design ensures:
- Separation of concerns  
- Easy debugging and extension  
- Scalable backend architecture  

---

## ⏱ Time & Space Complexity (Key Operations)
- Menu lookup: `O(1)`  
- Cart operations: `O(n)`  
- Order processing: `O(n)`  

---

## 🧪 Learning Outcomes
- Real-world backend development experience
- Strong understanding of JSP & Servlets lifecycle
- JDBC-based database interaction
- Applying OOPS and Collections in production-like projects
- Designing scalable systems using LLD concepts

---

## 🧠 Interview Explanation (One-Liner)
> “BiteNow is a full-stack food delivery application where I designed the backend using JSP, Servlets, JDBC, and MySQL, applying low-level system design and OOPS principles to handle users, restaurants, carts, and orders.”

---

## 🚀 Future Enhancements
- Payment gateway integration
- Live order tracking
- Admin dashboard
- REST API migration
- Spring Boot upgrade

---

## 👨‍💻 Author
**Dhinesh Kumar**  
Java Backend Developer | System Design | DSA  

---

## 📌 Note
This project was built for learning, system design practice, and interview preparation, simulating a real-world food delivery platform.
