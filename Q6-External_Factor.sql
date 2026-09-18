SELECT
    weather_condition,
    traffic_level,
    COUNT(*) as total,
    ROUND(100.0 * SUM(late_delivery) / COUNT(*), 2) as pct_late
FROM ecommerce_delivery_predictions
GROUP BY weather_condition, traffic_level