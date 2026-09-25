BULK INSERT Bookings
FROM 'D:\DEPI\Final Project\bookings_v2.csv' 
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  
);