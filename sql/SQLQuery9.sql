BULK INSERT Guests
FROM 'D:\DEPI\Final Project\guests_v2.csv' 
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  
);