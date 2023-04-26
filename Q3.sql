-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 
-- Q3. Find unique user/s with the total number of paid subscribers greater than 100 for their channel/s created on 01.01.2023.
--  Display the username, email, channel name and the subscriber count.

-- User: user_id, name, email, age, address
-- channel: channel_id, user_id, channel_name, creation_date, subscriber_count
-- Subscription: user_id, channel_id, type



  -- create the user table
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- create the channel table
CREATE TABLE channel (
    channel_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    channel_name VARCHAR(100) NOT NULL,
    creation_date DATE NOT NULL,
    subscriber_count INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- create the Subscription table
CREATE TABLE Subscription (
  user_id INT,
  channel_id INT,
  type VARCHAR(50)
);

-- insert 10 rows into the user table
INSERT INTO user (user_id, username, email)
VALUES
    (1, 'user1', 'user1@example.com'),
    (2, 'user2', 'user2@example.com'),
    (3, 'user3', 'user3@example.com'),
    (4, 'user4', 'user4@example.com'),
    (5, 'user5', 'user5@example.com'),
    (6, 'user6', 'user6@example.com'),
    (7, 'user7', 'user7@example.com'),
    (8, 'user8', 'user8@example.com'),
    (9, 'user9', 'user9@example.com'),
    (10, 'user10', 'user10@example.com');

-- insert 10 rows into the channel table
INSERT INTO channel (channel_id, user_id, channel_name, creation_date, subscriber_count)
VALUES
    (1, 1, 'channel1', '2023-01-01', 200),
    (2, 2, 'channel2', '2023-01-01', 150),
    (3, 3, 'channel3', '2023-01-01', 100),
    (4, 4, 'channel4', '2023-01-01', 50),
    (5, 5, 'channel5', '2023-01-01', 300),
    (6, 6, 'channel6', '2023-01-01', 250),
    (7, 7, 'channel7', '2023-01-01', 400),
    (8, 8, 'channel8', '2023-01-01', 350),
    (9, 9, 'channel9', '2023-01-01', 1000),
    (10, 10, 'channel10', '2023-01-01', 500);


INSERT INTO Subscription (user_id, channel_id, type)
VALUES
    (1, 1, 'paid'),
    (2, 2, 'unpay'),
    (3, 3, 'paid'),
    (4, 4, 'unpay'),
    (5, 5, 'unpay'),
    (6, 6, 'unpay'),
    (7, 7, 'paid'),
    (8, 8, 'unpay'),
    (9, 9, 'unpay'),
    (10, 10, 'paid');


-- for this question we have to return username, email, channel name and the subscriber count.
-- There are 3 tables, user, channel and Subscription, user, channel and Subscription have the same column user_id, join them together based on the same column
-- filter the date to be created on 01.01.2023 and subscribers greater than 100 while the type of subscribers are paid.

SELECT u.username, u.email, c.channel_name, SUM(c.subscriber_count) AS total_subscribers
FROM user u
JOIN channel c ON u.user_id = c.user_id
JOIN Subscription s ON c.user_id = s.user_id
WHERE c.creation_date = '2023-01-01' AND c.subscriber_count > 100
AND s.type = 'paid'
GROUP BY u.user_id
HAVING COUNT(DISTINCT c.channel_id) = 1;



