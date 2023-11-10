CREATE USER 'bekir'@'%' IDENTIFIED BY '123456789';
GRANT ALL PRIVILEGES ON *.* TO 'bekir'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE mydatabase;
USE mydatabase;
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    hire_date DATE
);