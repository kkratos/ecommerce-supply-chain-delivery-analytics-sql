SELECT seller_id,  
COUNT(*) as total_orders,
ROUND(AVG(seller_rating),2) as avg_rating,
ROUND(AVG(seller_reliability_score),2) as avg_reliablity_score,
ROUND(100 * SUM(late_delivery) / COUNT(*), 2) as late_rate_pct
FROM ecommerce_delivery_predictions
GROUP BY seller_id
HAVING COUNT(*) >= 10
	AND AVG(seller_reliability_score) < 60
    AND (100.0 * SUM(late_delivery) / COUNT(*)) > 25
ORDER BY late_rate_pct DESC;

--
SELECT 
    seller_id,
    COUNT(*) AS order_count
FROM ecommerce_delivery_predictions
GROUP BY seller_id
ORDER BY order_count DESC
LIMIT 20;