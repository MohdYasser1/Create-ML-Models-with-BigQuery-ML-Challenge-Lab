SELECT 
    start_station_name,
    COUNT (*) AS trips,
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
        EXTRACT (YEAR FROM start_time) = 2019
    AND
        duration_minutes > 0
GROUP BY start_station_name
ORDER BY trips DESC;
