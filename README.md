# 🚖 Ride Sharing SQL Project

## 📌 Overview
This project is a **Ride Sharing System** built using SQL. It simulates a real-world ride booking platform where riders can book trips, drivers provide services, and the system manages trips, payments, and ratings.

The project demonstrates strong knowledge of:
- Database design (ER modeling)
- SQL queries (DDL, DML, DQL)
- Joins, Subqueries, Aggregations
- Window & String functions
- Business insights using data

---

## 🎯 Objectives
- Design a structured relational database
- Store and manage ride-sharing data efficiently
- Perform advanced SQL queries to extract insights
- Analyze business metrics like revenue, ratings, and trips

---

## 🗂️ Database Schema

### 1. Riders
- `rider_id` (PK)
- `name`
- `email`
- `phone`
- `city`

### 2. Drivers
- `driver_id` (PK)
- `name`
- `email`
- `phone`
- `vehicle_number`
- `city`

### 3. Trips
- `trip_id` (PK)
- `rider_id` (FK)
- `driver_id` (FK)
- `start_location`
- `end_location`
- `trip_date`
- `distance_km`
- `fare`
- `status`

### 4. Payments
- `payment_id` (PK)
- `trip_id` (FK)
- `payment_method` (Cash/Card/Wallet)
- `amount`
- `payment_date`

### 5. Ratings
- `rating_id` (PK)
- `trip_id` (FK)
- `rider_rating`
- `driver_rating`
- `comments`

---

## ⚙️ Database Setup

```sql
CREATE DATABASE ride;
USE ride;
SHOW DATABASES;
```

---

## 🔍 Key SQL Concepts Used

### ✔️ Basic Queries
```sql
SELECT * FROM Riders;
SELECT * FROM Drivers;
```

### ✔️ Filtering
```sql
SELECT * FROM Riders
WHERE city = 'Mumbai';
```

### ✔️ Aggregation
```sql
SELECT COUNT(*) AS total_drivers
FROM Drivers
WHERE city = 'Navi Mumbai';
```

---

## 🔗 Joins

### Rider Trips Count
```sql
SELECT r.name, COUNT(t.trip_id) AS total_trips
FROM Riders r
JOIN Trips t ON r.rider_id = t.rider_id
GROUP BY r.name;
```

### Driver Earnings
```sql
SELECT d.name, SUM(p.amount) AS total_earnings
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
JOIN Payments p ON t.trip_id = p.trip_id
GROUP BY d.name;
```

---

## 📊 Advanced Queries

### Top 5 Highest Fare Trips
```sql
SELECT trip_id, rider_id, driver_id, fare
FROM Trips
ORDER BY fare DESC
LIMIT 5;
```

### Average Fare per City
```sql
SELECT start_location, AVG(fare) AS avg_fare
FROM Trips
GROUP BY start_location;
```

### Cities with Avg Fare > 300
```sql
SELECT start_location, AVG(fare) AS avg_fare
FROM Trips
GROUP BY start_location
HAVING AVG(fare) > 300;
```

---

## 🔄 Subqueries

### Trip with Maximum Fare
```sql
SELECT *
FROM Trips
WHERE fare = (SELECT MAX(fare) FROM Trips);
```

### Drivers with No Rating Below 3
```sql
SELECT d.name
FROM Drivers d
WHERE d.driver_id NOT IN (
    SELECT t.driver_id
    FROM Trips t
    JOIN Ratings r ON t.trip_id = r.trip_id
    WHERE r.driver_rating < 3
);
```

---

## 🧠 Window Functions

### Ranking Drivers
```sql
SELECT d.name,
       AVG(r.rider_rating) AS avg_rider_rating,
       RANK() OVER (ORDER BY AVG(r.rider_rating) DESC) AS rating_rank
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
JOIN Ratings r ON t.trip_id = r.trip_id
GROUP BY d.name;
```

### Cumulative Driver Earnings
```sql
SELECT d.name, t.trip_id, t.fare,
SUM(t.fare) OVER (PARTITION BY d.driver_id ORDER BY t.trip_date) AS cumulative_fare
FROM Trips t
JOIN Drivers d ON t.driver_id = d.driver_id;
```

---

## 🔤 String Functions

```sql
SELECT UPPER(name) FROM Drivers;

SELECT name, LENGTH(name) FROM Riders;

SELECT * FROM Drivers
WHERE name LIKE 'A%';
```

---

## 📈 Insights Generated
- Identify top earning drivers
- Analyze city-wise revenue
- Find highest fare trips
- Evaluate driver performance using ratings
- Analyze payment methods (Cash/Card/Wallet)

---

## 🛠️ Tools Used
- MySQL / SQL
- Database Design (ER Modeling)

---

## 📌 Conclusion
This project demonstrates:
- Strong SQL fundamentals
- Real-world database design
- Data analysis using SQL queries

---

## 👤 Author
**Sahil Parab**

---

## ⭐ How to Use
1. Clone the repository  
2. Run SQL scripts in MySQL  
3. Explore and modify queries  

---

## 🚀 Future Improvements
- Add dashboard (Power BI / Tableau)
- Add stored procedures & triggers
- Optimize queries for performance
