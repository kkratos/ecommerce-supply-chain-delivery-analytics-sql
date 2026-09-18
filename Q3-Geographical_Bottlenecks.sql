SELECT customer_city, COUNT(*) as late_deliveries
FROM ecommerce_delivery_predictions
WHERE late_delivery = 1
GROUP BY customer_city
ORDER BY late_deliveries DESC
LIMIT 5;