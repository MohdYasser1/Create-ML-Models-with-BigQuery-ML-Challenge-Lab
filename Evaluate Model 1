#standardSQL
CREATE OR REPLACE MODEL bike_time.bike_duration2
    OPTIONS (model_type='linear_reg', labels=['duration_minutes']) AS
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
        EXTRACT (YEAR FROM start_time) = 2018
    AND
        duration_minutes > 0;


    
