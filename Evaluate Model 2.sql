#standardSQL
SELECT
    SQRT(mean_squared_error) AS rmse,
    mean_absolute_error
FROM
    ML.EVALUATE(MODEL `qwiklabs-gcp-02-7d0d6541b087.bike_time.bike_duration2`,
    (
    SELECT 
        start_station_name,
        subscriber_type,
        EXTRACT (HOUR FROM start_time) AS start_hour,
        duration_minutes
    FROM
        `bigquery-public-data.austin_bikeshare.bikeshare_trips` AS trips
    JOIN
        `bigquery-public-data.austin_bikeshare.bikeshare_stations` AS stations
    ON 
        trips.start_station_name=stations.name
    WHERE 
        EXTRACT (YEAR FROM start_time) = 2019
    AND
        duration_minutes > 0


    
    )
    )
