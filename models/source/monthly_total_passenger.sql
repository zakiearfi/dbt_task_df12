{{
    config(
        materialized = "table"
    )
}}

SELECT 
    pickup_month,
    SUM(passenger_count) AS total_passengers
FROM 
    week3-df.weeklytask3.nyc_taxi_trip
GROUP BY 
    pickup_month
ORDER BY 
    pickup_month