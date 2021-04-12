
/* Create DATABASE */
CREATE DATABASE IBDProject;

/*Create table if it does not exist. Fields id, fare_amount, pickup_datetime, pickup latitude/longitude, dropoff latitude/longitude, passenger_count.*/
CREATE TABLE IF NOT EXISTS IBDProject.fares(
	id VARCHAR(255) PRIMARY KEY,
    fare_amount FLOAT NOT NULL,
    pickup_datetime DATETIME NOT NULL,
    pickup_longitude FLOAT NOT NULL,
	pickup_latitude FLOAT NOT NULL,
	dropoff_longitude FLOAT NOT NULL,
	dropoff_latitude FLOAT NOT NULL,
	passenger_count FLOAT NOT NULL
);
desc fares;
alter table ibdproject.fares
modify dropoff_latitude varchar(255);