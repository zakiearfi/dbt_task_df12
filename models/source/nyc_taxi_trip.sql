{{
    config(
        materialized = "table"
    )
}}

SELECT
    * EXCEPT(
        lpep_pickup_datetime,
        store_and_fwd_flag,
        ehail_fee
    ),
    store_and_fwd_flag = 'Y' AS store_and_fwd_flag,
    EXTRACT(MONTH FROM lpep_pickup_datetime) AS pickup_month
FROM
    {{ source ('weeklytask3', 'raw_nyc_taxi_trip') }}