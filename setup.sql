-- setup.sql

-- Drop tables if they already exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;

-- Create a users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP,
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO users (username, email)
VALUES 
('johndoe', 'john@example.com'),
('janedoe', 'jane@example.com');

INSERT INTO transactions (user_id, amount, transaction_date, status)
VALUES 
(1, 99.99, '2024-06-01 10:00:00', 'COMPLETED'),
(2, 49.50, '2024-06-02 12:30:00', 'PENDING');
