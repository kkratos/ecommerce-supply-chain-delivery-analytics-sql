
WITH breached_orders AS (
SELECT 
    customer_state, order_id, order_value, order_priority
FROM
    ecommerce_delivery_predictions
WHERE
    order_value > 200
        AND order_priority IN ('High' , 'Critical')
        AND late_delivery = 1
)
SELECT 
	customer_state,
	COUNT(*) as beached_orders,
	ROUND(SUM(order_value), 2) as revenue_at_risk
FROM breached_orders
GROUP BY customer_state;

