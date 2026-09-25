BULK INSERT Rooms
FROM 'D:\DEPI\Final Project\rooms_v2.csv' 
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  
);