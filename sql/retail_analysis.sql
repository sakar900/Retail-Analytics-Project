/* ============================================================
   RETAIL ANALYTICS PROJECT – ADVANCED SQL ANALYSIS
   Dataset: Global Superstore (Kaggle)
   Purpose: End-to-End Retail Analytics & Business Insights
   ============================================================ */

---------------------------------------------------------------
-- 1. DEMAND TRENDS, SEASONALITY & YoY GROWTH (CTE + WINDOW)
---------------------------------------------------------------

WITH yearly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY 1
),
yoy_growth AS (
    SELECT
        year,
        total_sales,
        total_sales - LAG(total_sales) OVER (ORDER BY year) AS yoy_growth,
        ROUND(
            (total_sales - LAG(total_sales) OVER (ORDER BY year))
            / LAG(total_sales) OVER (ORDER BY year) * 100, 2
        ) AS yoy_growth_pct
    FROM yearly_sales
)
SELECT *
FROM yoy_growth
ORDER BY year;

---------------------------------------------------------------
-- 2. MONTHLY SEASONALITY & ROLLING 3-MONTH SALES TREND
---------------------------------------------------------------

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS revenue
    FROM superstore
    GROUP BY 1
)
SELECT
    month,
    revenue,
    ROUND(
        AVG(revenue) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS rolling_3_month_avg
FROM monthly_sales
ORDER BY month;

---------------------------------------------------------------
-- 3. REGIONAL PERFORMANCE ANALYSIS
---------------------------------------------------------------

SELECT
    region,
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY region
ORDER BY total_revenue DESC;

---------------------------------------------------------------
-- 4. KEY BUSINESS METRICS: ORDER CONTRIBUTION & AOV
---------------------------------------------------------------

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_revenue,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM superstore;

---------------------------------------------------------------
-- 5. CUSTOMER RETENTION INDICATOR (REPEAT CUSTOMERS)
---------------------------------------------------------------

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM superstore
    GROUP BY customer_id
)
SELECT
    COUNT(CASE WHEN order_count > 1 THEN customer_id END) AS repeat_customers,
    COUNT(customer_id) AS total_customers,
    ROUND(
        COUNT(CASE WHEN order_count > 1 THEN customer_id END)
        * 100.0 / COUNT(customer_id), 2
    ) AS retention_rate_pct
FROM customer_orders;

---------------------------------------------------------------
-- 6. CUSTOMER LIFETIME VALUE (CLV) FRAMEWORK & SEGMENTATION
---------------------------------------------------------------

WITH customer_clv AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS purchase_frequency,
        ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value,
        SUM(sales) AS customer_lifetime_value
    FROM superstore
    GROUP BY customer_id
)
SELECT
    customer_id,
    purchase_frequency,
    avg_order_value,
    customer_lifetime_value,
    CASE
        WHEN customer_lifetime_value >= 10000 THEN 'High-Value'
        WHEN customer_lifetime_value BETWEEN 4000 AND 9999 THEN 'At-Risk'
        ELSE 'Low-Value'
    END AS customer_segment
FROM customer_clv
ORDER BY customer_lifetime_value DESC;

---------------------------------------------------------------
-- 7. PROFITABILITY & DISCOUNT IMPACT ANALYSIS
---------------------------------------------------------------

SELECT
    discount,
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY discount
ORDER BY discount;

---------------------------------------------------------------
-- 8. IDENTIFYING MARGIN LEAKAGE BY PRODUCT CATEGORY
---------------------------------------------------------------

SELECT
    category,
    sub_category,
    SUM(sales) AS revenue,
    SUM(profit) AS profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margin_pct
FROM superstore
GROUP BY category, sub_category
ORDER BY margin_pct ASC;
