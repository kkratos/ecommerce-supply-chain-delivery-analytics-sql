SELECT order_priority, ROUND(avg(dispatch_delay_hours),2) as avg_dispatch_delay_hours
FROM ecommerce_delivery_predictions
GROUP BY order_priority;