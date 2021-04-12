
# Dataset file
	File "train.csv" contains a small snap of the database.
	Location - \Data Management

************************ DATA MANAGEMENT *****************************

First go through Data Management Components.
	
Step1: Creating the Database
    Run the "prepDatabase.sql" into mysql prompt. This will create the database and tables in mysql.
	Location - \Data Management

Step2: Importing the database

	Run the sql queries in "importDdata.sql" into mysql prompt. This will import the data from "train.csv" into the table.
	Don't forget to change the path of train.csv in the importDdata.sql file.
	Location - \Data Management
	
	OR
	
	Run the python code from "python_mysql_insert_data.ipynb" file. This will also import the data from "train.csv" into the table.
	Dont forget to change the database credentials in the code.
	Location - \Data Management
	
Step3: Conecting to java  
	Run the MakeConn.java contains the code for connecting the database to java.
	Dont forget to change the database credentials in the code.
	Location - \Data Management
	
Step4: Creating ER tables
	Run the sql queries in "ERDesign Queries.sql" into mysql prompt. It will create three more tables PickupLocation, DropoffLocation 
	and RideDetails and populate data in them accordingly.
	Location - \Data Management

Step5: Data cleaning
	Run the sql queries in "DataQuality.sql" into mysql prompt. This will remove extreme,negative, and invalid data 
	from tables and Sync the values.
	Location - \Data Management
	
Step6: Querying the database
	Run "insight.sql" file contains the queries that we used to extract meaningful information from our database.
	Then copy the respective results in csv files for each query.
	Next run the python codes to generate the graphs of the obtained result csv file.
	Location of insight.sql - \Data Management
	Location of csv files - \Data Management\query results
	Location of python code and plotted graphs - \Data Management\graphs
	

************************ DATA ANALYTICS *****************************

Next go through Data Analytics Components.

Step7: Data Visualizations
	Run the "DataVisualizationPhase3.r" contains the script to load the data in R and carry all the visualizations in R/rattle.
	Location : \Data Analytics
	
Step8: Data Mining 
	 Run the "xgboost_final.r" contains the code to implement regression technique of data mining.
	 Location : \Data Analytics



	 
