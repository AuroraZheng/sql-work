-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 

-- Q1. Find the sponsor who has sponsored the highest amount in YouTube. Display the sponsor’s name, phone number and the total amount sponsored.
-- Sponsor: sponsor_id, sponsor_name, phone, address, amount


-- create the table youtube_sponsorship has attributes sponsor_id, video_id, and amount
CREATE TABLE youtube_sponsorship (
    sponsor_id INT,
    video_id INT,
    amount DECIMAL(10, 2)
);

-- insert 10 rows
INSERT INTO youtube_sponsorship (sponsor_id, video_id, amount)
VALUES
    (1, 1001, 500.00),
    (1, 1002, 1000.00),
    (2, 1003, 750.50),
    (3, 1004, 250.00),
    (4, 1005, 1500.00),
    (5, 1006, 100.00),
    (5, 1007, 200.00),
    (6, 1008, 400.00),
    (6, 1009, 800.00),
    (7, 1010, 600.00);

-- create the table sponsor_detail has attributes sponsor_id, sponsor_name, phone and address 
CREATE TABLE sponsor_detail (
    sponsor_id INT PRIMARY KEY,
    sponsor_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL
);

-- insert 10 rows
INSERT INTO sponsor_detail (sponsor_id, sponsor_name, phone, address)
VALUES
    (1, 'ABC Inc.', '555-1234', '123 Main St.'),
    (2, 'XYZ Corp.', '555-5678', '456 Elm St.'),
    (3, 'Acme Enterprises', '555-9876', '789 Oak St.'),
    (4, 'Smith & Co.', '555-4321', '246 Maple Ave.'),
    (5, 'Johnson Industries', '555-2468', '135 Pine St.'),
    (6, 'Doe Associates', '555-3698', '369 Oak St.'),
    (7, 'Jones Holdings', '555-7890', '789 Maple Ave.'),
    (8, 'Miller Corp.', '555-1357', '246 Elm St.'),
    (9, 'Green Enterprises', '555-3691', '369 Pine St.'),
    (10, 'Brown & Sons', '555-2469', '135 Oak St.');


-- this question is to find the highest amount that a sponsor has sponsored
-- we have two tables youtube_sponsorship and sponsor_detail share the same column sponsor_id
-- join these two tables based on the common column 
-- and select the sum of highest amount by limit 1
SELECT s.sponsor_name, s.phone, SUM(ys.amount) as total_amount
FROM youtube_sponsorship ys
JOIN sponsor_detail s ON ys.sponsor_id = s.sponsor_id
GROUP BY ys.sponsor_id
ORDER BY total_amount DESC
LIMIT 1;






