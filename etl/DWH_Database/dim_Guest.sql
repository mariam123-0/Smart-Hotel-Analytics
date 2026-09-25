CREATE TABLE dbo.dim_Guest (
    Guest_key INT IDENTITY(1,1) PRIMARY KEY,
    Guest_ID INT,
    Guest_name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(50),
    Start_date DATE,
    End_date DATE,
    Is_current INT
);