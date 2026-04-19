# E-Commerce-Analytics-Project-SQL-Power-BI-
This project presents an end-to-end analysis of an e-commerce dataset using SQL for data exploration and Power BI for interactive dashboarding.
The objective was to analyse sales performance, product trends, and customer behaviour, and present the findings in a structured and business-focused format.

# Dataset

The dataset models a real-world e-commerce environment and consists of interconnected tables including users, orders, order_items, products, reviews, and events. These tables capture customer transactions, product information, user interactions, and feedback.

<img width="1759" height="783" alt="ecommerce data model" src="https://github.com/user-attachments/assets/74248c20-d662-4ab4-923d-aec17d399c68" />

# Tools Used
SQL for data extraction and analysis
Power BI for data modelling and visualisation
DAX for calculated measures and KPIs

# SQL Analysis
1. Revenue by Category
```sql
SELECT 
    p.category,
    ROUND(SUM(oi.item_total), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
```
<img width="1235" height="787" alt="Revenue by product category" src="https://github.com/user-attachments/assets/dff7dc74-8051-496d-a645-327897ed6c8f" />

Insight:
Electronics generates the highest revenue, while categories such as groceries contribute significantly less.

2. Product Performance
```sql
SELECT 
    p.product_id,
    p.product_name,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    ROUND(SUM(oi.item_total), 2) AS total_sales
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY avg_rating DESC;
```
<img width="1246" height="816" alt="Product Performance (Ratings + Sales)" src="https://github.com/user-attachments/assets/37fb4092-c0b8-4f9b-afc5-cf1fad397491" />

Insight:
Highly rated products do not always correspond to high sales, suggesting potential gaps in visibility or pricing strategy.

3. Customer Lifetime Value
```sql
SELECT 
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS lifetime_value,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY lifetime_value DESC
LIMIT 10;
```
<img width="1232" height="706" alt="Customer Lifetime Value" src="https://github.com/user-attachments/assets/6bc4f6b8-8f6f-461c-8b8f-72620f3457c9" />


Insight:
A small group of customers contributes a significant portion of total revenue.

# Power BI Dashboard

The dashboard is structured into three main sections:

1. *Executive Overview*

Revenue trends over time

Order distribution

Key performance indicators including revenue, orders, customers, and average order value

<img width="1416" height="794" alt="overview" src="https://github.com/user-attachments/assets/9c72de57-2ec4-4634-8bde-b3614bacd5c2" />


2. *Sales and Product Performance*

Top and bottom-performing products

Revenue by category and brand

Product-level performance metrics

<img width="1422" height="799" alt="sales" src="https://github.com/user-attachments/assets/6c36849b-b86a-479d-9abf-d156494db8cb" />


3. *Customer and Behaviour Analysis*
   
Conversion funnel from view to purchase

User activity trends over time

Customer ratings and review insights

<img width="1419" height="798" alt="customer" src="https://github.com/user-attachments/assets/2a906121-2772-4feb-ad00-b89c3c4b4cb8" />

# Key Insights
A small number of products drive the majority of revenue
There is a clear drop-off between product views and completed purchases
High product ratings do not always translate into strong sales performance
A small segment of customers contributes significantly to overall revenue
