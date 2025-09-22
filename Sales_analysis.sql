--Podstawowe KPI
--Total Revenue (przychód ³¹czny)
SELECT SUM(total_price) AS total_revenue
FROM sales;

--Total Orders (liczba zamówieñ)
SELECT COUNT(order_id) AS total_orders
FROM orders;

--Average Order Value (œrednia wartoœæ zamówienia)
SELECT 
    SUM(s.total_price) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM sales s
JOIN orders o ON s.order_id = o.order_id;

--Total Quantity Sold (³¹czna liczba sprzedanych sztuk)
SELECT SUM(quantity) AS total_units_sold
FROM sales;

--Average Price per Unit (œrednia cena za jednostkê)
SELECT AVG(price_per_unit) AS avg_price_per_unit
FROM sales;

--Analiza klientów
--Total Customers (liczba klientów)
SELECT COUNT(customer_id) AS total_customers
FROM customers;

--New vs Returning Customers
WITH first_orders AS (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM orders
    GROUP BY customer_id
)
SELECT 
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    COUNT(DISTINCT CASE WHEN o.order_date = f.first_order THEN o.customer_id END) AS new_customers,
    COUNT(DISTINCT CASE WHEN o.order_date > f.first_order THEN o.customer_id END) AS returning_customers
FROM orders o
JOIN first_orders f ON o.customer_id = f.customer_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY order_year, order_month;

--Customers spend the most money (klienci wydaj¹cy najwiêcej pieniêdzy)
SELECT TOP 10
    c.customer_id,
    c.customer_name,
    SUM(s.total_price) AS revenue
FROM sales s
JOIN orders o ON o.order_id = s.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue DESC;

--RFM 
WITH customer_summary AS (
    SELECT 
        o.customer_id,
        MAX(o.order_date) AS last_order,
        COUNT(DISTINCT o.order_id) AS frequency,
        SUM(s.total_price) AS monetary
    FROM orders o
    JOIN sales s ON o.order_id = s.order_id
    GROUP BY o.customer_id
)
SELECT 
    cs.customer_id,
    c.customer_name,
    DATEDIFF(DAY, cs.last_order, GETDATE()) AS recency_days,  -- liczba dni od ostatniego zakupu
    cs.frequency,
    cs.monetary
FROM customer_summary cs
JOIN customers c ON cs.customer_id = c.customer_id;

--Analiza produktów
--Top Products by Revenue (Najpopularniejsze produkty wed³ug przychodów)
SELECT TOP 10
    p.product_id,
    p.product_name,
    SUM(s.total_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

--Revenue by Product Category (Przychody wed³ug kategorii produktów)
SELECT 
    p.product_type,
    SUM(s.total_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_type
ORDER BY revenue DESC;

--Average Price per Category (Œrednia cena za kategoriê)
SELECT 
    p.product_type,
    AVG(s.price_per_unit) AS avg_price
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_type;

--Most frequently ordered products (Najczêœciej zamawiane produkty)
SELECT TOP 5
    p.product_id,
    p.product_name,
    SUM(s.quantity) AS quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY quantity DESC;

--Analiza czasowa
--Revenue by Month (Przychody wed³ug miesi¹ca)
SELECT 
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    SUM(s.total_price) AS revenue
FROM sales s
JOIN orders o ON s.order_id = o.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY order_year, order_month;

--Delivery Time (œrednia d³ugoœæ dostawy)
SELECT AVG(DATEDIFF(DAY, order_date, delivery_date)) AS avg_delivery_days
FROM orders
WHERE delivery_date IS NOT NULL;

--Revenue by State (Przychody wed³ug stanu)
SELECT 
    c.state,
    SUM(s.total_price) AS revenue
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.state
ORDER BY revenue DESC;























