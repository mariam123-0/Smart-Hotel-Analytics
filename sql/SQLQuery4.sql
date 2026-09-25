CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    payment DECIMAL(10,2) NULL,
    booking_date DATE NULL,
    Branch_id INT
);