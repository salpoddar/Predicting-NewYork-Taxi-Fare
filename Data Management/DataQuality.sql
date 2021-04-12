
/*To delete the extreme passenger count that is incorrect*/
DELETE FROM RideDetails 
WHERE passenger_cnt=208;

/*To delete data that has negative fare*/
DELETE FROM RideDetails 
WHERE fare_amt < 0;

/* To sync data between all the three tables after performing above two queries*/
DELETE FROM PickupLocation 
WHERE PickupLocation.pickup_id NOT IN
(SELECT pickup_id from RideDetails);

DELETE FROM DropoffLocation 
WHERE DropoffLocation.dropoff_id NOT IN
(SELECT dropoff_id from RideDetails);


/*To delete wrong pickup longitude and latitude data from all the tables*/
DELETE FROM PickupLocation 
WHERE pickup_longitude NOT BETWEEN -180 AND 180;

DELETE FROM PickupLocation 
WHERE pickup_latitude NOT BETWEEN -90 AND 90;

DELETE FROM RideDetails 
WHERE RideDetails.pickup_id NOT IN 
(SELECT pickup_id from PickupLocation);


/*To delete wrong drop-off longitude and latitude data from all the tables*/
DELETE FROM DropoffLocation 
WHERE dropoff_longitude NOT BETWEEN -180 AND 180;

DELETE FROM DropoffLocation 
WHERE dropoff_latitude NOT BETWEEN -90 AND 90;

DELETE FROM RideDetails 
WHERE RideDetails.dropoff_id NOT IN 
(SELECT dropoff_id from DropoffLocation);


