BULK INSERT Branches
FROM 'D:\DEPI\Final Project\branches_v2.csv' 
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  
);