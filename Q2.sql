-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 

-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. 
-- Display the Video Title, channel name and the ratio in the ascending order of the title.

-- Tables that needed for this question
-- User: user_id, name, channel_name, email, age, address
-- Channel: channel_id, name, video_id, created_date
-- video: video_id, name, likes, views, upload_date


-- create the user table
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50)
);

-- create the channel table
CREATE TABLE channel (
    channel_id INT PRIMARY KEY,
    user_id INT,
    channel_name VARCHAR(50),
    creation_date DATE,
    subscriber_count INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- create the video table
CREATE TABLE video (
    video_id INT PRIMARY KEY,
    channel_id INT,
    title VARCHAR(50),
    views INT,
    likes INT,
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
);

-- insert sample data into the tables
INSERT INTO user (user_id, username, email)
VALUES
    (1, 'marvel_user1', 'marvel_user1@example.com'),
    (2, 'marvel_user2', 'marvel_user2@example.com'),
    (3, 'non_marvel_user', 'non_marvel_user@example.com');

-- Insert 2 rows into channel table
INSERT INTO channel (channel_id, user_id, channel_name, creation_date, subscriber_count)
VALUES
    (1, 1, 'Marvel Entertainment 1', '2023-01-01', 100),
    (2, 2, 'Marvel Entertainment 2', '2023-01-02', 200),
    (3, 3, 'Non-Marvel Channel', '2023-01-03', 300);

-- Insert 10 rows into video table
INSERT INTO video (video_id, channel_id, title, views, likes)
VALUES
    (1, 1, 'Marvel Video 1', 1000, 100),
    (2, 1, 'Marvel Video 2', 2000, 400),
    (3, 2, 'Marvel Video 3', 3000, 300),
    (4, 2, 'Marvel Video 4', 4000, 800),
    (5, 2, 'Non-Marvel Video', 5000, 500),
    (6, 3, 'Non-Marvel Video 2', 6000, 600),
    (7, 3, 'Non-Marvel Video 3', 7000, 700),
    (8, 1, 'Marvel Video 5', 8000, 200),
    (9, 1, 'Marvel Video 6', 9000, 450),
    (10, 2, 'Marvel Video 7', 10000, 550);

-- compute the ratio of likes to views for videos belonging to channels owned by users with "Marvel Entertainment" in their channel name
-- we have three tables user, channel and video. video and channel share the same column of channel_id, channel and user share the same column of user_id
-- join them based on their same column and find the channel's name have Marvel Entertainment and caluclate the Like_View_Ratio in video.
SELECT v.title AS Video_Title, c.channel_name AS Channel_Name, v.likes / v.views AS Like_View_Ratio
FROM video v
INNER JOIN channel c ON v.channel_id = c.channel_id
INNER JOIN user u ON c.user_id = u.user_id
WHERE c.channel_name LIKE '%Marvel Entertainment%'
ORDER BY v.title ASC;









