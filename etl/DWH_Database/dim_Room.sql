CREATE TABLE dbo.dim_Room (
    Room_key INT IDENTITY(1,1) PRIMARY KEY,
    Room_ID INT,
    Branch_key INT,
    Room_num INT,
    Room_type VARCHAR(50),
    Price DECIMAL(10,2),
    Floor_num INT,
    Status VARCHAR(50),
    Start_date DATE,
    End_date DATE,
    Is_current INT,
    FOREIGN KEY (Branch_key) REFERENCES dbo.dim_Branch(Branch_key)
);