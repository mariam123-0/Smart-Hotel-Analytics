CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    Branch_id INT,
    room_num INT,
    type VARCHAR(50),
    price DECIMAL(10,2),
    floor_num INT NULL,
    status VARCHAR(50) NULL,
    guest_id INT NULL
);