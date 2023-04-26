-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 

-- Q5. Find the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel. Display the video 
-- title, minimum age and the maximum age.


-- Channel: Name, owner, subscription_count, created_details
-- video: video_id, name, likes, views, upload_date
-- Statistic: video_id, Like/dislike, View_count, Num_shares, Num_comments
-- View: viewer_id (unique identifier for the viewer), video_id(video they watched), age (age of the viewer)

-- Create Channel table
CREATE TABLE Channel (
  channel_id INT PRIMARY KEY,
  name VARCHAR(255),
  owner VARCHAR(255),
  subscription_count INT,
  created_date DATE
);
-- Create Video table
CREATE TABLE Video (
  video_id INT PRIMARY KEY,
  name VARCHAR(255),
  likes INT,
  views INT,
  upload_date DATE,
  channel_id INT,
  FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);
-- Create Statistic table
CREATE TABLE Statistic (
  statistic_id INT PRIMARY KEY,
  video_id INT,
  likes INT,
  dislikes INT,
  view_count INT,
  num_shares INT,
  num_comments INT,
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);
-- Create View table
CREATE TABLE View (
  view_id INT PRIMARY KEY,
  viewer_id INT,
  video_id INT,
  age INT,
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);
-- Insert 2 rows into Channel table
INSERT INTO Channel (channel_id, name, owner, subscription_count, created_date)
VALUES (1, 'Taylor Swift', 'Taylor Swift', 1000000, '2022-01-01'),
       (2, 'Marvel Entertainment', 'Marvel Studios', 2000000, '2022-02-01');
-- Insert 5 rows into Video table
INSERT INTO Video (video_id, name, likes, views, upload_date, channel_id)
VALUES (1, 'Blank Space', 10000, 100000, '2022-01-01', 1),
       (2, 'Shake It Off', 20000, 200000, '2022-01-15', 1),
       (3, 'Avengers: Endgame Trailer', 50000, 500000, '2022-02-01', 2),
       (4, 'Spider-Man: No Way Home Trailer', 60000, 600000, '2022-03-01', 2),
       (5, 'Loki Trailer', 70000, 700000, '2022-04-01', 2);
-- Insert 5 rows into Statistic table
INSERT INTO Statistic (statistic_id, video_id, likes, dislikes, view_count, num_shares, num_comments)
VALUES (1, 1, 9000, 1000, 90000, 500, 200),
       (2, 2, 19000, 1000, 190000, 700, 250),
       (3, 3, 48000, 2000, 480000, 1000, 300),
       (4, 4, 59000, 1000, 590000, 1500, 400),
       (5, 5, 69000, 1000, 690000, 2000, 500);
-- Insert 10 rows into View table
INSERT INTO View (view_id, viewer_id, video_id, age)
VALUES (1, 1, 1, 25),
       (2, 2, 1, 30),
       (3, 3, 1, 35),
       (4, 4, 1, 40),
       (5, 5, 1, 45),
       (6, 1, 2, 20),
       (7, 2, 2, 25),
       (8, 3, 2, 30),
       (9, 4, 3, 25),
       (10, 5, 3, 30);

-- There are 4 tables, Channel, Video, Statistic and View, Channel and Video share the same attribute channel_id, Video and  Statistic share the same attribute video_id,
-- Video and view share the same attribute video_id, join them together and filter the owner of channel that is 'Taylor Swift' and select the min and max age based on the filtered results.
SELECT v.name AS video_title, MIN(age) AS min_age, MAX(age) AS max_age
FROM video v
JOIN channel c ON v.channel_id = c.channel_id
JOIN statistic s ON v.video_id = s.video_id
JOIN view w ON v.video_id = w.video_id
WHERE c.owner = 'Taylor Swift'
GROUP BY v.name;







