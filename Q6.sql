-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 

-- Q6. Find all the content creators living in the US who have consistently posted at least 1 video each week of the last month. Display their
--  username, channel/s they own and their total subscriber count.

-- users: user_id, username, email, country.
-- channels: channel_id, user_id, channel_name, creation_date, subscriber_count.
-- videos: video_id, channel_id, video_name, upload_date.
-- views: view_id, viewer_id, video_id, age, view_date.



-- Create users table
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(50),
  country VARCHAR(50)
);

-- Insert 5 rows into users table
INSERT INTO users (user_id, username, email, country)
VALUES
  (1, 'JohnDoe', 'johndoe@example.com', 'USA'),
  (2, 'JaneDoe', 'janedoe@example.com', 'Canada'),
  (3, 'AliceSmith', 'alicesmith@example.com', 'USA'),
  (4, 'BobJohnson', 'bobjohnson@example.com', 'USA'),
  (5, 'EmilyBrown', 'emilybrown@example.com', 'Canada');

-- Create channels table
CREATE TABLE channels (
  channel_id INT PRIMARY KEY,
  user_id INT,
  channel_name VARCHAR(50),
  creation_date DATE,
  subscriber_count INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert 5 rows into channels table
INSERT INTO channels (channel_id, user_id, channel_name, creation_date, subscriber_count)
VALUES
  (1, 1, 'JohnDoe Channel', '2022-01-01', 1000),
  (2, 2, 'JaneDoe Channel', '2022-02-01', 500),
  (3, 3, 'AliceSmith Channel', '2022-03-01', 2000),
  (4, 4, 'BobJohnson Channel', '2022-04-01', 1500),
  (5, 5, 'EmilyBrown Channel', '2022-05-01', 800);

-- Create videos table
CREATE TABLE videos (
  video_id INT PRIMARY KEY,
  channel_id INT,
  video_name VARCHAR(50),
  upload_date DATE,
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

-- Insert 10 rows into videos table
INSERT INTO videos (video_id, channel_id, video_name, upload_date)
VALUES
  (1, 1, 'JohnDoe Video 1', '2023-01-05'),
  (2, 2, 'JaneDoe Video 1', '2022-02-10'),
  (3, 3, 'AliceSmith Video 1', '2022-03-15'),
  (4, 4, 'BobJohnson Video 1', '2022-04-20'),
  (5, 5, 'EmilyBrown Video 1', '2022-05-25'),
  (6, 1, 'JohnDoe Video 2', '2023-01-12'),
  (7, 1, 'JohnDoe Video 3', '2023-01-20'),
  (8, 1, 'JohnDoe Video 4', '2023-01-27'),
  (9, 1, 'JohnDoe Video 5', '2023-01-31'),
  (10, 1, 'JohnDoe Video 6', '2022-05-25');

-- Create views table
CREATE TABLE views (
  view_id INT PRIMARY KEY,
  viewer_id INT,
  video_id INT,
  age INT,
  view_date DATE,
  FOREIGN KEY (viewer_id) REFERENCES users(user_id),
  FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

-- Insert 5 rows into views table
INSERT INTO views (view_id, viewer_id, video_id, age, view_date)
VALUES
  (1, 1, 1, 25, '2022-01-05'),
  (2, 2, 2, 30, '2022-02-10'),
  (3, 3, 3, 35, '2022-03-15'),
  (4, 4, 4, 40, '2022-04-20'),
  (5, 5, 5, 45, '2022-05-25');


-- there are two tables users and channels, join them based on their same attribute user_id
-- filter the country to be USA and upload at least 1 videos each week last month
-- The WEEK() function returns the week number for a given date (a number from 0 to 53).
-- # last month from 2023-01-01 to 2023-01-31
SELECT u.username, c.channel_name, c.subscriber_count
FROM users u
JOIN channels c ON u.user_id = c.user_id
WHERE u.country = 'USA'
  AND c.channel_id IN (
    SELECT v.channel_id
    FROM videos v
    WHERE v.upload_date >= '2023-01-01' and v.upload_date <= '2023-01-31'
    GROUP BY v.channel_id
    HAVING COUNT(DISTINCT WEEK(v.upload_date)) >= 4
  )


