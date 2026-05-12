# 📌 MySQL Trigger Practice Project

## 📖 Overview

This project is a hands-on MySQL Trigger practice project built around a product inventory management database.

The main goal of this project was to strengthen my understanding of:

* Database Automation
* Audit Logging
* Data Validation
* Business Rule Implementation using MySQL Triggers

The project includes multiple real-world trigger scenarios commonly used in inventory and business management systems.

---

# 🚀 Features

* Automatic stock tracking
* Automatic price tracking
* Inventory audit logging
* Low stock alert system
* Duplicate product prevention
* Price validation rules
* Product deletion protection
* Automatic category assignment
* Price change percentage tracking

---

# 🛠 Skills Practiced

* MySQL Triggers
* SQL Debugging
* Audit Logging
* Inventory Database Design
* Business Logic Implementation
* Database Automation
* Data Validation

---

# 🗄 Database Tables

The project uses the following tables:

* `products`
* `stock_audit`
* `price_audit`
* `low_stock_alerts`
* `deleted_products`
* `product_summary`
* `price_change_log`

---

# 🔥 Trigger Scenarios Implemented

## ✅ Basic Trigger Scenarios

1. Save old and new stock values automatically
2. Save old and new price values automatically
3. Prevent inserting negative stock
4. Prevent updating price below 1
5. Automatically set negative stock to 0

---

## ⚡ Intermediate Trigger Scenarios

6. Prevent deleting products
7. Automatically increase Electronics product price by 10%
8. Record only price increases
9. Prevent stock updates above 1000
10. Convert product names to uppercase

---

## 🏢 Real-World Trigger Scenarios

11. Track every stock change
12. Track every price change
13. Block price reduction greater than 50%
14. Prevent deleting products with remaining stock
15. Automatically set category to `Uncategorized`
16. Insert low-stock products into `low_stock_alerts`
17. Save deleted product information automatically
18. Update total product count automatically
19. Prevent duplicate product names
20. Store price change percentage automatically

---

# 📚 Key Learnings

Through this project, I learned:

* Difference between `BEFORE` and `AFTER` triggers
* Practical use of `OLD` and `NEW`
* Real-world audit logging techniques
* Trigger-based data validation
* Inventory management automation
* SQL debugging and trigger testing
* Business rule implementation using triggers

---

# 📂 Repository Structure

```bash
mysql-trigger-practice-project/
│
├── trigger_practice_database.sql
├── trigger.sql
├── trigger_test.sql
└── README.md
```

---

# 🛠 Tools Used

* MySQL
* MySQL Workbench
* GitHub
* Notion

---

# 🎯 Project Goal

The purpose of this project was not only to practice SQL syntax, but also to improve problem-solving skills by implementing real-world database scenarios commonly used in inventory and business systems.

---

# 👨‍💻 Author

Maksud-Ur-Rashid

Data Analyst | EXCEL | SQL | POWER BI | PYTHON

