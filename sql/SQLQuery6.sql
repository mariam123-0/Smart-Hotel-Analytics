CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(255),
    email VARCHAR(255) NULL,
    phone VARCHAR(50) NULL,
    room_id DECIMAL(10,1) NULL,  -- لاحظ: هذا الحقل يحتوي على أرقام عشرية في البيانات، لكن يمكن تغييره إلى INT إذا لزم
    book_date DATE NULL
);