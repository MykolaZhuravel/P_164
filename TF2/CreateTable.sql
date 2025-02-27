CREATE TABLE t_lottery_numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lottery_name VARCHAR(255) NOT NULL,
    drawing_date DATE NOT NULL,
    numbers TEXT NOT NULL
);