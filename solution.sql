DROP TABLE VIEWS;
DROP TABLE INFORMATIONAL_VIDEO;
DROP TABLE KEYWORDS;
DROP TABLE VIDEO_COMMENTS;
DROP TABLE SUBSCRIPTION;
DROP TABLE SPONSORSHIP;
DROP TABLE SPONSORS;
DROP TABLE VIDEO;
DROP TABLE CHANNEL;
DROP TABLE USERS;


CREATE TABLE USERS(
  user_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_email VARCHAR(50) NOT NULL,
  user_age NUMBER,
  user_country_code VARCHAR(10)
);


CREATE TABLE CHANNEL(
  channel_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  channel_name VARCHAR(50) NOT NULL,
  channel_user_id NUMBER NOT NULL,
  channel_created_on DATE NOT NULL,
  channel_sub_count NUMBER NOT NULL,
  CONSTRAINT channel_fk_1
  FOREIGN KEY (channel_user_id)
  REFERENCES USERS(user_id)
  ON DELETE CASCADE
);


CREATE TABLE SUBSCRIPTION(
  subscription_user_id NUMBER NOT NULL,
  subscription_channel_id NUMBER NOT NULL,
  subscription_type VARCHAR(50) NOT NULL,
  PRIMARY KEY(subscription_user_id, subscription_channel_id),
  CONSTRAINT subscription_fk_1
  FOREIGN KEY (subscription_user_id)
  REFERENCES USERS(user_id)
  ON DELETE CASCADE,
  CONSTRAINT subscription_fk_2
  FOREIGN KEY (subscription_channel_id)
  REFERENCES CHANNEL(channel_id)
  ON DELETE CASCADE
);


CREATE TABLE VIDEO(
  video_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  video_title VARCHAR(50) NOT NULL,
  video_likes_count NUMBER,
  video_views_count NUMBER,
  video_comments_count NUMBER,
  video_channel_id NUMBER NOT NULL,
  video_posted_date DATE NOT NULL,
  CONSTRAINT video_fk_1
  FOREIGN KEY (video_channel_id)
  REFERENCES CHANNEL(channel_id)
  ON DELETE CASCADE
);


CREATE TABLE VIDEO_COMMENTS(
  comment_user_id NUMBER NOT NULL,
  comment_video_id NUMBER NOT NULL,
  comment_sentiment_score NUMBER NOT NULL,
  PRIMARY KEY (comment_user_id, comment_video_id),
  CONSTRAINT comment_fk_1
  FOREIGN KEY (comment_user_id)
  REFERENCES USERS(user_id)
  ON DELETE CASCADE,
  CONSTRAINT comment_fk_2
  FOREIGN KEY (comment_video_id)
  REFERENCES VIDEO(video_id)
  ON DELETE CASCADE
);


CREATE TABLE KEYWORDS(
  keyword_id VARCHAR(50) NOT NULL,
  PRIMARY KEY (keyword_id)
);


CREATE TABLE INFORMATIONAL_VIDEO(
  informational_video_kw VARCHAR(50) NOT NULL,
  informational_video_id NUMBER NOT NULL,
  PRIMARY KEY (informational_video_id, informational_video_kw),
  CONSTRAINT informational_fk_1
  FOREIGN KEY (informational_video_kw)
  REFERENCES KEYWORDS(keyword_id)
  ON DELETE CASCADE,
  CONSTRAINT informational_fk_2
  FOREIGN KEY (informational_video_id)
  REFERENCES VIDEO(video_id)
  ON DELETE CASCADE
);


CREATE TABLE VIEWS(
  view_user_id NUMBER NOT NULL,
  view_video_id NUMBER NOT NULL,
  PRIMARY KEY (view_user_id, view_video_id),
  CONSTRAINT views_fk_1
  FOREIGN KEY (view_user_id)
  REFERENCES USERS(user_id)
  ON DELETE CASCADE,
  CONSTRAINT views_fk_2
  FOREIGN KEY (view_video_id)
  REFERENCES VIDEO(video_id)
  ON DELETE CASCADE
);


CREATE TABLE SPONSORS(
  sponsor_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
  sponsor_name VARCHAR(50) NOT NULL,
  sponsor_phone_number VARCHAR(20) NOT NULL
);


CREATE TABLE SPONSORSHIP(
  sponsor_id NUMBER NOT NULL,
  video_id NUMBER NOT NULL,
  amount NUMBER,
  PRIMARY KEY(sponsor_id, video_id),
  CONSTRAINT sponsorship_fk_1
  FOREIGN KEY (sponsor_id)
  REFERENCES SPONSORS(sponsor_id)
  ON DELETE CASCADE,
  CONSTRAINT sponsorship_fk_2
  FOREIGN KEY (video_id)
  REFERENCES VIDEO(video_id)
  ON DELETE CASCADE
);


INSERT INTO KEYWORDS VALUES ('movie');
INSERT INTO KEYWORDS VALUES ('horror');
INSERT INTO KEYWORDS VALUES ('natgeo');
INSERT INTO KEYWORDS VALUES ('food');


INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment sucks', 'ass1@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment is great', 'ass1@gmail.com', 20, 'US');
INSERT INTO USERS VALUES (NULL, 'The Marvel Entertainment is Ok', 'ass1@gmail.com', 30, 'US');
INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment', 'ass1@gmail.com', 40, 'US');
INSERT INTO USERS VALUES (NULL, 'Bat Man', 'ass1@gmail.com', 50, 'US');
INSERT INTO USERS VALUES (NULL, 'Mat Man', 'ass1@gmail.com', 60, 'US');
INSERT INTO USERS VALUES (NULL, 'Cat Man', 'ass1@gmail.com', 70, 'US');
INSERT INTO USERS VALUES (NULL, 'Marvel Man', 'ass1@gmail.com', 300, 'US');
INSERT INTO USERS VALUES (NULL, 'Ass Man', 'ass1@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'Goat Man', 'ass1@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'Woman Man', 'ass1@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'She Man', 'ass1@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'Hu Man', 'ass1@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Taylor Swift', 'ass1@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Taylor Swift', 'ass2@gmail.com', 10, 'US');


INSERT INTO CHANNEL VALUES (NULL, 'channel 1', 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 2', 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 3', 2, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 4', 8, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 5', 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 6', 6, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 200);
INSERT INTO CHANNEL VALUES (NULL, 'channel 7', 6, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 900);
INSERT INTO CHANNEL VALUES (NULL, 'channel 8', 6, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1100);
INSERT INTO CHANNEL VALUES (NULL, 'channel 9', 6, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1100);
INSERT INTO CHANNEL VALUES (NULL, 'channel 10', 14, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1100);
INSERT INTO CHANNEL VALUES (NULL, 'channel 11', 15, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1100);


INSERT INTO SUBSCRIPTION VALUES (1,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (2,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (3,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (4,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (5,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (6,1,'PAID');
INSERT INTO SUBSCRIPTION VALUES (1,2,'PAID');
INSERT INTO SUBSCRIPTION VALUES (2,2,'PAID');
INSERT INTO SUBSCRIPTION VALUES (3,2,'PAID');
INSERT INTO SUBSCRIPTION VALUES (4,3,'PAID');
INSERT INTO SUBSCRIPTION VALUES (5,3,'PAID');
INSERT INTO SUBSCRIPTION VALUES (6,4,'PAID');
INSERT INTO SUBSCRIPTION VALUES (6,5,'PAID');
INSERT INTO SUBSCRIPTION VALUES (7,5,'FREE');


INSERT INTO VIDEO VALUES (NULL, 'title 1', 100, 400, 100, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 2', 200, 20, 100, 1, TO_DATE('2023-01-14', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 3', 10, 20, 20, 2, TO_DATE('2023-01-03', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 4', 300, 20, 900, 4, TO_DATE('2023-01-03', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 5', 10, 20, 2000, 4, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 6', 40, 20, 20, 4, TO_DATE('2023-01-18', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 7', 50, 20, 20, 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 8', 0, 20, 20, 5, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 9', 300, 20, 900, 6, TO_DATE('2023-01-03', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 10', 10, 20, 2000, 6, TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 11', 40, 20, 20, 6, TO_DATE('2023-01-18', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 12', 40, 20, 20, 6, TO_DATE('2023-01-23', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 13', 40, 20, 20, 4, TO_DATE('2023-01-23', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 14', 4000, 20, 20, 10, TO_DATE('2023-01-23', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 15', 40, 20, 200, 11, TO_DATE('2023-01-23', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 16', 40, 20, 200, 11, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 17', 40, 20, 200, 11, TO_DATE('2023-01-08', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 18', 40, 20, 200, 11, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO VIDEO VALUES (NULL, 'title 19', 40, 20, 200, 11, TO_DATE('2023-01-22', 'YYYY-MM-DD'));


INSERT INTO VIDEO_COMMENTS VALUES (1, 1, 3000);
INSERT INTO VIDEO_COMMENTS VALUES (2, 1, 23);
INSERT INTO VIDEO_COMMENTS VALUES (3, 1, 23);
INSERT INTO VIDEO_COMMENTS VALUES (4, 3, 23);
INSERT INTO VIDEO_COMMENTS VALUES (1, 2, 23);
INSERT INTO VIDEO_COMMENTS VALUES (1, 5, 300);


INSERT INTO INFORMATIONAL_VIDEO VALUES ('natgeo', 1);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('food', 1);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('movie', 1);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('food', 2);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('movie', 2);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('natgeo', 2);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('natgeo', 3);
INSERT INTO INFORMATIONAL_VIDEO VALUES ('food', 3);


INSERT INTO VIEWS VALUES (1, 1);
INSERT INTO VIEWS VALUES (1, 2);
INSERT INTO VIEWS VALUES (1, 3);
INSERT INTO VIEWS VALUES (1, 4);
INSERT INTO VIEWS VALUES (8, 4);
INSERT INTO VIEWS VALUES (6, 2);
INSERT INTO VIEWS VALUES (2, 3);
INSERT INTO VIEWS VALUES (2, 15);
INSERT INTO VIEWS VALUES (8, 15);


INSERT INTO SPONSORS VALUES (NULL, 'Karen Martin', '555-8901');
INSERT INTO SPONSORS VALUES (NULL, 'John Smith', '555-1234');
INSERT INTO SPONSORS VALUES (NULL, 'Jane Doe', '555-5678');
INSERT INTO SPONSORS VALUES (NULL, 'Bob Johnson', '555-9012');
INSERT INTO SPONSORS VALUES (NULL, 'Alice Brown', '555-3456');
INSERT INTO SPONSORS VALUES (NULL, 'Tom Wilson', '555-7890');
INSERT INTO SPONSORS VALUES (NULL, 'Sara Lee', '555-2345');
INSERT INTO SPONSORS VALUES (NULL, 'Mike Davis', '555-6789');
INSERT INTO SPONSORS VALUES (NULL, 'Emily Miller', '555-0123');
INSERT INTO SPONSORS VALUES (NULL, 'David White', '555-4567');


INSERT INTO SPONSORSHIP VALUES (1,1,100);
INSERT INTO SPONSORSHIP VALUES (1,2,105);
INSERT INTO SPONSORSHIP VALUES (2,6,205);
INSERT INTO SPONSORSHIP VALUES (3,7,120);
INSERT INTO SPONSORSHIP VALUES (4,7,130);


-- Q1
SELECT s1.sponsor_name, s1.sponsor_phone_number, s2.total_amount as total_amount_sponsored
FROM SPONSORS s1
JOIN (
  SELECT sponsor_id, SUM(amount) as total_amount 
  FROM SPONSORSHIP 
  GROUP BY sponsor_id
  HAVING SUM(amount) = (SELECT MAX(SUM(amount)) FROM SPONSORSHIP GROUP BY sponsor_id)
) s2 ON s1.sponsor_id = s2.sponsor_id;


-- Q2
SELECT video_title, c1.channel_name, FLOOR(video_likes_count/video_views_count) as RATIO
FROM VIDEO, CHANNEL c1
WHERE video_channel_id = c1.channel_id 
AND c1.channel_id IN (
  SELECT channel_id
  FROM CHANNEL
  WHERE channel_user_id IN (
    SELECT user_id
    FROM USERS
    WHERE user_name LIKE '%Marvel Entertainment%'
  )  
)
ORDER BY video_title ASC;


-- Q3
SELECT user_name, user_email, c.channel_name, c.channel_sub_count
FROM USERS, (
  SELECT * 
  FROM CHANNEL
  WHERE channel_created_on = TO_DATE('2023-01-01', 'YYYY-MM-DD')
  AND channel_id IN (
    SELECT subscription_channel_id
    FROM SUBSCRIPTION
    WHERE subscription_type = 'PAID'
    GROUP BY subscription_channel_id
    HAVING COUNT(subscription_user_id) > 2
)) c 
WHERE user_id = c.channel_user_id;


-- Q4
SELECT I.informational_video_kw, (SUM(v3.video_sentiment_score))/(SUM(v3.video_sentiment_sum)) as average_sentiment
FROM INFORMATIONAL_VIDEO I, (
  SELECT v.video_id as video_id, v2.sentiment_score_sum as video_sentiment_score, v2.sentiment_count as video_sentiment_sum
  FROM VIDEO v 
  JOIN (
    SELECT comment_video_id, SUM(comment_sentiment_score) as sentiment_score_sum, COUNT(*) as sentiment_count 
    FROM VIDEO_COMMENTS
    GROUP BY comment_video_id  
  ) v2 ON v.video_id = v2.comment_video_id
) v3 
WHERE I.informational_video_id = v3.video_id
GROUP BY I.informational_video_kw
ORDER BY average_sentiment DESC;


-- Q4 v2
SELECT I.informational_video_kw, (SUM(v3.video_sentiment_score))/(SUM(v3.video_sentiment_sum)) as average_sentiment
FROM INFORMATIONAL_VIDEO I, (
    SELECT comment_video_id, SUM(comment_sentiment_score) as video_sentiment_score, COUNT(*) as video_sentiment_sum 
    FROM VIDEO_COMMENTS
    GROUP BY comment_video_id  
) v3 
WHERE I.informational_video_id = v3.comment_video_id
GROUP BY I.informational_video_kw
ORDER BY average_sentiment DESC;


-- Q5
SELECT v.video_title, MAX(u.user_age) as MAX_VIEWER_AGE, MIN(u.user_age) as MIN_VIEWER_AGE
FROM USERS u, VIDEO v, VIEWS vs
WHERE u.user_id = vs.view_user_id AND v.video_id = vs.view_video_id AND 
v.video_id IN(
  SELECT video_id
  FROM VIDEO
  WHERE video_comments_count = (
    SELECT MAX(video_comments_count)
    FROM VIDEO
    WHERE video_channel_id IN(
      SELECT channel_id
      FROM CHANNEL
      WHERE channel_user_id IN(
        SELECT user_id
        FROM USERS
        WHERE user_name LIKE 'Taylor Swift'
      )
    )  
  ) AND video_channel_id IN (
      SELECT channel_id
      FROM CHANNEL
      WHERE channel_user_id IN(
        SELECT user_id
        FROM USERS
        WHERE user_name = 'Taylor Swift'
      )
    )  
)
GROUP BY v.video_id, v.video_title;


-- Q6
SELECT user_name, channel_name, total_sub_count
FROM (
  SELECT u.user_id as user_id, u.user_name as user_name, c.channel_name as channel_name
  FROM USERS u, (
    SELECT channel_user_id, channel_name
    FROM CHANNEL
    WHERE channel_id in (
      SELECT video_channel_id
      FROM VIDEO
      WHERE video_posted_date >= TO_DATE('2023-01-01', 'YYYY-MM-DD') AND video_posted_date <= TO_DATE('2023-01-07', 'YYYY-MM-DD')
      INTERSECT
      SELECT video_channel_id
      FROM VIDEO
      WHERE video_posted_date >= TO_DATE('2023-01-08', 'YYYY-MM-DD') AND video_posted_date <= TO_DATE('2023-01-14', 'YYYY-MM-DD')
      INTERSECT
      SELECT video_channel_id
      FROM VIDEO
      WHERE video_posted_date >= TO_DATE('2023-01-15', 'YYYY-MM-DD') AND video_posted_date <= TO_DATE('2023-01-21', 'YYYY-MM-DD')
      INTERSECT
      SELECT video_channel_id
      FROM VIDEO
      WHERE video_posted_date >= TO_DATE('2023-01-22', 'YYYY-MM-DD') AND video_posted_date <= TO_DATE('2023-01-31', 'YYYY-MM-DD')
    )
  ) c 
  WHERE c.channel_user_id = u.user_id AND u.user_country_code = 'US'
) t1
LEFT JOIN (
  SELECT u1.user_id as user_id, SUM(c1.channel_sub_count) as total_sub_count
  FROM USERS u1, CHANNEL c1
  WHERE u1.user_id = c1.channel_user_id
  GROUP BY u1.user_id
) t2 ON t1.user_id = t2.user_id;