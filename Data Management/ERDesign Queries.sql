
/* Create PickupLocation Table*/
DROP TABLE PickupLocation;
CREATE TABLE PickupLocation(
	pickup_id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_longitude FLOAT NOT NULL,
	pickup_latitude FLOAT NOT NULL
);


/* Create DropoffLocation Table*/
DROP TABLE DropoffLocation;
CREATE TABLE DropoffLocation(
	dropoff_id INT AUTO_INCREMENT PRIMARY KEY,
	dropoff_longitude FLOAT NOT NULL,
	dropoff_latitude FLOAT NOT NULL
);

/* Create RideDetails Table*/
DROP TABLE RideDetails;
CREATE TABLE RideDetails(
	ride_key VARCHAR(255) PRIMARY KEY,
    pickup_dttm DATETIME NOT NULL,
    pickup_id INT NOT NULL default 0,
	dropoff_id INT NOT NULL default 0,
	passenger_cnt FLOAT NOT NULL,
	fare_amt FLOAT NOT NULL
);

/* Populating data in PickupLocation Table from fares */
ALTER TABLE PickupLocation AUTO_INCREMENT = 1;
INSERT INTO PickupLocation(pickup_longitude, pickup_latitude)
SELECT DISTINCT pickup_longitude, pickup_latitude
FROM fares;

/* Populating data in DropoffLocation Table from fares */
ALTER TABLE DropoffLocation AUTO_INCREMENT = 1;
INSERT INTO DropoffLocation(dropoff_longitude, dropoff_latitude)
SELECT DISTINCT dropoff_longitude, dropoff_latitude
FROM fares;

/* Populating partial data in RideDetails Table from fares */
INSERT INTO RideDetails(ride_key,pickup_dttm,passenger_cnt,fare_amt)
SELECT id,pickup_datetime,passenger_count,fare_amount FROM fares;

/* Looking up for pickup_id from PickupLocation Table and adding it to RideDetails table */
UPDATE RideDetails 
SET pickup_id = 
(SELECT pickup_id FROM PickupLocation WHERE pickup_longitude IN 
(SELECT pickup_longitude FROM fares WHERE RideDetails.ride_key=fares.id)
AND pickup_latitude IN
(SELECT pickup_latitude FROM fares WHERE RideDetails.ride_key=fares.id));

/* Looking up for dropoff_id from DropoffLocation Table and adding it to RideDetails table */
UPDATE RideDetails 
SET dropoff_id = 
(SELECT dropoff_id FROM DropoffLocation WHERE dropoff_longitude IN 
(SELECT dropoff_longitude FROM fares WHERE RideDetails.ride_key=fares.id) 
AND dropoff_latitude IN 
(SELECT dropoff_latitude FROM fares WHERE RideDetails.ride_key=fares.id));
