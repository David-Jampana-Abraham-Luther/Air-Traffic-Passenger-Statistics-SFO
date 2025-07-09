CREATE TABLE AirportData (
    Activity_Period DATE,
    Operating_Airline VARCHAR(255),
    Operating_Airline_IATA_Code VARCHAR(10),
    Published_Airline VARCHAR(255),
    Published_Airline_IATA_Code VARCHAR(10),
    GEO_Summary VARCHAR(255),
    GEO_Region VARCHAR(255),
    Activity_Type_Code VARCHAR(50),
    Price_Category_Code VARCHAR(50),
    Terminal VARCHAR(50),
    Boarding_Area VARCHAR(50),
    Passenger_Count INT
);
DESC AirportData;


-- Query to count the number of rows in the AirportData table:
SELECT COUNT(*) AS TotalRows FROM AirportData;

-- Query to display the first 10 rows of data in the AirportData table:
SELECT * FROM AirportData LIMIT 10;

-- Query to display unique operating airlines and their respective passenger counts:
SELECT Operating_Airline, SUM(Passenger_Count) AS TotalPassengers 
FROM AirportData 
GROUP BY Operating_Airline;

-- Query to display the total number of passengers for each activity type:
SELECT Activity_Type_Code, SUM(Passenger_Count) AS TotalPassengers 
FROM AirportData 
GROUP BY Activity_Type_Code;

-- Query to display the top 5 busiest terminals based on passenger counts:
SELECT Terminal, SUM(Passenger_Count) AS TotalPassengers 
FROM AirportData 
GROUP BY Terminal 
ORDER BY TotalPassengers DESC 
LIMIT 5;


-- Get the total number of passengers for each operating airline
SELECT Operating_Airline, SUM(Passenger_Count) AS total_passengers
FROM AirportData
GROUP BY Operating_Airline
ORDER BY total_passengers DESC
LIMIT 10; -- Limit to top 10 airlines by passenger count

-- Get the total number of passengers for each terminal
SELECT Terminal, SUM(Passenger_Count) AS total_passengers
FROM AirportData
GROUP BY Terminal
ORDER BY total_passengers DESC;


