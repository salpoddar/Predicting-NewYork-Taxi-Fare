
/* Load csv file into the "fares" table. The table columns should match the csv header*/
LOAD DATA INFILE
'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\train.csv'
INTO TABLE IBDPROJECT.fares
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SET GLOBAL net_read_timeout = 600000 ;

SHOW VARIABLES LIKE "secure_file_priv";

/* To display the data after loading file */
select * from fares;
