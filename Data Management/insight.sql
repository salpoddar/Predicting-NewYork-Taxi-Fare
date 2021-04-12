/* Find the distance travelled using euclid distance */
select key_,sqrt(pow(dropoff_longitude - pickup_longitude,2) + pow(dropoff_latitude - pickup_latitude ,2)) as distance from new_york_city_taxi_fare;
/* find the average fare amount vs. time of day.*/
select HOUR(pickup_datetime), AVG(fare_amount ) from new_york_city_taxi_fare group by HOUR(pickup_datetime);																   
/* find the average passenger count vs. time of day.*/
select HOUR(pickup_datetime), AVG(passenger_count) from new_york_city_taxi_fare group by HOUR(pickup_datetime);
/* find the usage of cab(passenger count) vs. day of the year.*/
select DAYOFYEAR(pickup_datetime), SUM(passenger_count) from new_york_city_taxi_fare group by DAYOFYEAR(pickup_datetime);
/* find the fare amoust vs. day of the year.*/
select DAYOFYEAR(pickup_datetime), avg(fare_amount) from new_york_city_taxi_fare group by DAYOFYEAR(pickup_datetime);