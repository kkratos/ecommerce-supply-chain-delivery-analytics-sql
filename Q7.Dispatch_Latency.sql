SELECT * 
FROM ecommerce_delivery_predictions;

-- Look at Distribution
select
	case
		when warehouse_distance_km < 200 then 'Short (<200) km'
        when warehouse_distance_km between 200 and 1000 then 'Medium (200-1000) km'
        when warehouse_distance_km > 1000 then 'Long (>1000) km'
    end as distance_tier,
    count(*) as total_orders,
    round(avg(dispatch_delay_hours), 2) as avg_delay,
    round(100 * sum(late_delivery) / count(*) , 2) as failure_rate_pct
from ecommerce_delivery_predictions
WHERE warehouse_distance_km IS NOT NULL
group by distance_tier
having count(*) >= 10
order by failure_rate_pct desc;
