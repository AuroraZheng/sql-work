-- I am using http://sqlfiddle.com/#!9/8e31366/1 to execute the SQL commands 
-- Q4. Find the average sentiment score for each keyword category. Display the keyword name along with average score such that the highest 
-- score is displayed first.

-- Information video: keyword
-- Comment: video_id, user_id, likes, Sentiment

CREATE TABLE Information_video (
  video_id INT PRIMARY KEY,
  keyword VARCHAR(50)
);

CREATE TABLE Comment (
  video_id INT,
  user_id INT,
  likes INT,
  sentiment FLOAT
);

INSERT INTO Information_video (video_id, keyword) VALUES
  (1, 'Data Science'),
  (2, 'Machine Learning'),
  (3, 'Artificial Intelligence'),
  (4, 'Python'),
  (5, 'Big Data'),
  (6, 'Blockchain'),
  (7, 'Internet of Things'),
  (8, 'Cybersecurity'),
  (9, 'Cloud Computing'),
  (10, 'Virtual Reality');

INSERT INTO Comment (video_id, user_id, likes, sentiment) VALUES
  (1, 101, 10, 0.8),
  (1, 102, 5, 0.6),
  (2, 103, 8, 0.9),
  (2, 104, 6, 0.7),
  (3, 105, 12, 0.85),
  (3, 106, 3, 0.4),
  (4, 107, 7, 0.6),
  (4, 108, 9, 0.8),
  (5, 109, 4, 0.5),
  (5, 110, 2, 0.2);

-- there are two tables Information_video and Comment, they share the same attribute of video_id
-- select keyword and calculate the sentiment score based on each keyword. and sort the answer
SELECT Information_video.keyword, AVG(Comment.sentiment) AS average_score
FROM Information_video
JOIN Comment ON Information_video.video_id = Comment.video_id
GROUP BY Information_video.keyword
ORDER BY average_score DESC;
