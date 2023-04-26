Q1. Find the sponsor who has sponsored the highest amount in YouTube. Display the sponsor’s name, phone number and the total amount sponsored.
Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users having the word “Marvel Entertainment” in them. 
Display the Video Title, channel name and the ratio in the ascending order of the title.
Q3. Find unique user/s with the total number of paid subscribers greater than 100 for their channel/s created on 01.01.2023.
 Display the username, email, channel name and the subscriber count.
Q4. Find the average sentiment score for each keyword category. Display the keyword name along with average score such that the highest 
score is displayed first.
Q5. Find the minimum and maximum age of viewers who watched the most commented on video on Taylor Swift’s channel. Display the video 
title, minimum age and the maximum age.
Q6. Find all the content creators living in the US who have consistently posted at least 1 video each week of the last month. Display their
 username, channel/s they own and their total subscriber count.


Table Sponsor
attributes: sponsor_name, sponsor_id, phone, address, amount

Sponsor: sponsor_id, sponsor_name, phone, address, amount
User: user_id, name, channel_name, email, age, address
Channel: channel_id, name, video_id, created_date
video: video_id, name, likes, views, upload_date
subscriber: subscriber_id, type(paid/unpaid), channel_id
Information video: keyword
Comment: video_id, user_id, likes, Sentiment


## begin loop


CREATE TABLE Sponsor (
    sponsor_id int PRIMARY KEY,
    sponsor_name varchar(255),
    phone varchar(255),
    Address varchar(255),
    amount int
);

INSERT INTO Sponsor (sponsor_id, sponsor_name, phone, address, amount)
VALUES
  (1, 'ABC Company', '123-456-7890', '123 Main St', 5000.00),
  (2, 'XYZ Corporation', '555-555-5555', '456 Elm St', 10000.00),
  (3, 'Acme Inc.', '888-888-8888', '789 Oak Ave', 2500.00),
  (4, 'Big Corporation', '999-999-9999', '555 Pine St', 7500.00),
  (5, 'Small Business LLC', '444-444-4444', '987 Maple Ave', 1000.00),
  (6, 'Global Corp.', '777-777-7777', '111 Cedar St', 15000.00),
  (7, 'Local Business', '222-222-2222', '222 Walnut St', 500.00),
  (8, 'National Co.', '333-333-3333', '333 Chestnut St', 100000.00),
  (9, 'Regional Enterprise', '666-666-6666', '444 Birch Ave', 50000.00),
  (10, 'Community Partners', '111-111-1111', '555 Sycamore St', 1000.00),
  -- 90 more rows of data...
  (99, 'Tech Corp.', '444-555-6666', '999 Elm St', 12000.00),
  (100, 'Marketing Inc.', '777-888-9999', '111 Oak Ave', 8000.00);




select Sponsor.sponsor_name, Sponsor.phone, B.total from
 (select A.sponsor_id as id, max(A.thesum) as total from (select sponsor_id, sum(amount) as thesum from Sponsor group by sponsor_id) as A) as B
 join Sponsor where Sponsor.sponsor_id = B.id

 





