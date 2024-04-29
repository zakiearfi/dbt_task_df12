{{
    config(
        materialized = "table"
    )
}}

SELECT 
    pickup_month,
    payment_type,
    fare_amount + extra + mta_tax + total_amount + improvement_surcharge + congestion_surcharge AS total_transactions
FROM 
    week3-df.weeklytask3.nyc_taxi_trip
WHERE
    payment_type IS NOT NULL
GROUP BY 
   pickup_month, payment_type, total_transactions
ORDER BY 
    payment_type