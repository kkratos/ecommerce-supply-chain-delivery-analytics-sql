WITH category_stats AS (
	SELECT 
    customer_state,
    product_category,
    ROUND(100.0 * SUM(late_delivery) / COUNT(*), 2) late_rate_pct
FROM
    ecommerce_delivery_predictions
GROUP BY customer_state , product_category
),
ranked as (
	SELECT *, 
    DENSE_RANK() OVER(PARTITION BY customer_state ORDER BY late_rate_pct DESC) AS rnk
    FROM category_stats
)

SELECT * FROM ranked
WHERE rnk = 1
ORDER BY customer_state;