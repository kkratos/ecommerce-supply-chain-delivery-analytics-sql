SELECT product_category,
COUNT(*) as total_orders,
SUM(CASE 
		WHEN dispatch_delay_hours > 5 
		  OR processing_time_hours > 24 
		THEN 1 ELSE 0 
	END) AS delayed_shipments
FROM ecommerce_delivery_predictions
GROUP BY product_category
ORDER BY delayed_shipments DESC;