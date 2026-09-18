SELECT
    COUNT(*) AS total_orders,
    SUM(CASE 
            WHEN dispatch_delay_hours > 5 
              OR processing_time_hours > 24 
            THEN 1 ELSE 0 
        END) AS late_deliveries,
    ROUND(
        100.0 * SUM(CASE 
                        WHEN dispatch_delay_hours > 5 
                          OR processing_time_hours > 24 
                        THEN 1 ELSE 0 
                    END) / COUNT(*),
        2
    ) AS late_delivery_percentage
FROM ecommerce_delivery_predictions;