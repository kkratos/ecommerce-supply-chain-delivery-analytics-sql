-- Identify compound risk scenarios 
-- (e.g., Low Seller Reliability + Severe Weather + High Distance) 
-- where late delivery rates exceed 40%. 

WITH binned AS (
	SELECT 
		late_delivery,
        CASE
			 WHEN seller_reliability_score < 60 THEN 'LOW'
			 ELSE 'HIGH'
         END as reliability_tier,
         CASE 
            WHEN weather_condition IN ('Storm', 'Snow') THEN 'Severe'
            WHEN weather_condition IN ('Rain', 'Fog') THEN 'Moderate'
            ELSE 'Clear'
        END AS weather_tier,
        CASE 
            WHEN warehouse_distance_km < 50 THEN 'Short'
            WHEN warehouse_distance_km <= 200 THEN 'Medium'
            ELSE 'Long'
        END AS distance_tier
    FROM ecommerce_delivery_predictions
)
SELECT 
reliability_tier,
weather_tier,
distance_tier,
COUNT(*) AS total_orders,
SUM(late_delivery) AS late_orders,
ROUND(100.0*SUM(late_delivery) / COUNT(*), 2) AS late_rate_pct
FROM binned
GROUP BY reliability_tier, weather_tier, distance_tier
HAVING COUNT(*) >= 10
	AND late_rate_pct > 40
ORDER BY late_rate_pct DESC;