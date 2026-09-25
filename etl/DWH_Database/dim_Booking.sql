CREATE TABLE dbo.dim_Booking (
    Booking_ID INT IDENTITY(1,1) PRIMARY KEY,
    Guest_key INT NOT NULL,
    Room_key INT NOT NULL,
    Branch_key INT NOT NULL,
    Date_key INT NOT NULL,
    Payment_amount DECIMAL(10,2),
    Stay_duration INT,
    Total_revenue DECIMAL(10,2),
    FOREIGN KEY (Date_key) REFERENCES dbo.fact_Date(Date_key),
    FOREIGN KEY (Guest_key) REFERENCES dbo.dim_Guest(Guest_key),
    FOREIGN KEY (Room_key) REFERENCES dbo.dim_Room(Room_key),
    FOREIGN KEY (Branch_key) REFERENCES dbo.dim_Branch(Branch_key)
);