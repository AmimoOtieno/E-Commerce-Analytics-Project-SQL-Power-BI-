SELECT 
    p.category,
    ROUND(SUM(oi.item_total), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

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
