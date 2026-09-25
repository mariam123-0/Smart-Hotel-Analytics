CREATE TABLE dbo.fact_Date (
    Date_key INT IDENTITY(1,1) PRIMARY KEY,
    Date_ID INT,
    Full_date DATE,
    Day INT,
    Week INT,
    Month INT,
    Quarter INT,
    Year INT,
    Is_weekend INT
);