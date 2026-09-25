CREATE TABLE dim_Branch (
    Branch_key INT IDENTITY(1,1) PRIMARY KEY,
    Branch_ID INT,
    Branch_name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Start_date DATE,
    End_date DATE,
    Is_current INT
);