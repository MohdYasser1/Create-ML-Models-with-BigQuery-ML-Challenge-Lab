#standardSQL
SELECT 
    AVG(predicted_duration_minutes) AS average_predicted_duration_minutes
FROM 
    ML.PREDICT(MODEL `qwiklabs-gcp-02-7d0d6541b087.bike_time.bike_duration1`,
    (
    SELECT 
        start_station_name,
        EXTRACT (HOUR FROM start_time) AS start_hour,
        stations.address AS location,
        EXTRACT(DAYOFWEEK FROM start_time) AS daysofweek,
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
        start_station_name = '21st & Speedway @PCL'
    AND
        subscriber_type='Single Trip'


     
    ))
