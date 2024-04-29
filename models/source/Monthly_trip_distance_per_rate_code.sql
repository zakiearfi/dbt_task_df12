{{
    config(
        materialized = "table"
    )
}}

SELECT 
    pickup_month,
    RatecodeID,
    AVG(trip_distance) AS avg_trip_distance
FROM 
    week3-df.weeklytask3.nyc_taxi_trip
WHERE
    RatecodeID IS NOT NULL
GROUP BY 
    pickup_month, RatecodeID
ORDER BY 
    RatecodeID