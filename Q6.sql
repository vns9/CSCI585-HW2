-- Oracle Live SQL


-- Dropping existing tables

DROP TABLE VIEWS;
DROP VIEW MARVEL_ENTERTAINMENT_USERS;
DROP TABLE VIDEO_RATIOS;
DROP TABLE MARVEL_ENTERTAINMENT__USERS;
DROP TABLE INFORMATIONAL_VIDEO;
DROP TABLE KEYWORDS;
DROP TABLE VIDEO_COMMENTS;
DROP TABLE SUBSCRIPTION;
DROP TABLE SPONSORSHIP;
DROP TABLE SPONSORS;
DROP TABLE VIDEO;
DROP TABLE CHANNEL;
DROP TABLE USERS;


-- Creating Tables

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


-- Inserting data into tables

INSERT INTO KEYWORDS VALUES ('movie');
INSERT INTO KEYWORDS VALUES ('horror');
INSERT INTO KEYWORDS VALUES ('natgeo');
INSERT INTO KEYWORDS VALUES ('food');


INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment is evil', '1@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment rocks', '2@gmail.com', 20, 'US');
INSERT INTO USERS VALUES (NULL, 'The Marvel and Entertainment is Ok', '3@gmail.com', 30, 'US');
INSERT INTO USERS VALUES (NULL, 'Marvel Entertainment', '4@gmail.com', 40, 'US');
INSERT INTO USERS VALUES (NULL, 'User 5', '5@gmail.com', 50, 'US');
INSERT INTO USERS VALUES (NULL, 'User 6', '6@gmail.com', 60, 'US');
INSERT INTO USERS VALUES (NULL, 'User 7', '7@gmail.com', 70, 'US');
INSERT INTO USERS VALUES (NULL, 'User 8', '8@gmail.com', 300, 'US');
INSERT INTO USERS VALUES (NULL, 'User 9', '9@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'User 10', '10@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'User 11', '11@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'User 12', '12@gmail.com', 10, 'UK');
INSERT INTO USERS VALUES (NULL, 'User 13', '13@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Taylor Swift', '14@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'Taylor Swift', '15@gmail.com', 10, 'US');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'John Doe', 'johndoe@example.com', 27, 'US');
INSERT INTO USERS VALUES (NULL, 'Jane Doe', 'janedoe@example.com', 32, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');
INSERT INTO USERS VALUES (NULL, 'Adam Smith', 'adam.smith@example.com', 45, 'UK');
INSERT INTO USERS VALUES (NULL, 'Emily Johnson', 'emily.johnson@example.com', 18, 'US');
INSERT INTO USERS VALUES (NULL, 'Michael Brown', 'michael.brown@example.com', 21, 'AU');
INSERT INTO USERS VALUES (NULL, 'Olivia Lee', 'olivia.lee@example.com', 54, 'CN');
INSERT INTO USERS VALUES (NULL, 'William Clark', 'william.clark@example.com', 29, 'US');
INSERT INTO USERS VALUES (NULL, 'Sophia Martin', 'sophia.martin@example.com', 36, 'CA');
INSERT INTO USERS VALUES (NULL, 'Daniel Lewis', 'daniel.lewis@example.com', 41, 'UK');
INSERT INTO USERS VALUES (NULL, 'Isabella Wilson', 'isabella.wilson@example.com', 22, 'US');
INSERT INTO USERS VALUES (NULL, 'Matthew Walker', 'matthew.walker@example.com', 48, 'AU');
INSERT INTO USERS VALUES (NULL, 'Emma Thomas', 'emma.thomas@example.com', 31, 'CN');
INSERT INTO USERS VALUES (NULL, 'Jacob Hernandez', 'jacob.hernandez@example.com', 25, 'US');
INSERT INTO USERS VALUES (NULL, 'Mia Baker', 'mia.baker@example.com', 39, 'CA');


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
INSERT INTO SUBSCRIPTION VALUES (16, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (17, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (18, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (19, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (20, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (21, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (22, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (23, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (24, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (25, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (26, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (27, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (28, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (29, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (30, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (31, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (32, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (33, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (34, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (35, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (36, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (37, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (38, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (39, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (40, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (41, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (42, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (43, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (44, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (45, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (46, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (47, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (48, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (49, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (50, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (51, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (52, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (53, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (54, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (55, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (56, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (57, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (58, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (59, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (60, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (61, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (62, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (63, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (64, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (65, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (66, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (67, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (68, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (69, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (70, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (71, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (72, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (73, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (74, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (75, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (76, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (77, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (78, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (79, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (80, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (81, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (82, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (83, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (84, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (85, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (86, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (87, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (88, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (89, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (90, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (91, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (92, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (93, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (94, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (95, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (96, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (97, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (98, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (99, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (100, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (101, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (102, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (103, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (104, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (105, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (106, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (107, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (108, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (109, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (110, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (111, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (112, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (113, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (114, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (115, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (116, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (117, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (118, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (119, 1, 'PAID');
INSERT INTO SUBSCRIPTION VALUES (120, 1, 'PAID');


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


INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 1', '222-555-8901');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 2', '222-555-1234');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 3', '222-555-5678');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 4', '222-555-9012');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 5', '222-555-3456');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 6', '222-555-7890');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 7', '222-555-2345');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 8', '222-555-6789');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 9', '222-555-0123');
INSERT INTO SPONSORS VALUES (NULL, 'Sponsor 10', '222-555-4567');


INSERT INTO SPONSORSHIP VALUES (1,1,100);
INSERT INTO SPONSORSHIP VALUES (1,2,105);
INSERT INTO SPONSORSHIP VALUES (2,6,205);
INSERT INTO SPONSORSHIP VALUES (3,7,120);
INSERT INTO SPONSORSHIP VALUES (4,7,130);


-- Q6
/*
  Explanation

  - We get all channel ids where atleast one video is posted in the 1st, 2nd, 3rd, 4th, 5th week of January 2023.
  - We take channel information (name, channel subscribers count) of these channel ids and cross it with users based on channel owner id condition.
  - We filter only those users whose country code is 'US'
  - We present the username, channel name and subscriber count.
*/
SELECT u.user_name as user_name, c.channel_name as channel_name, c.channel_sub_count as subscribers_count
FROM USERS u, (
  SELECT channel_user_id, channel_name, channel_sub_count
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
WHERE c.channel_user_id = u.user_id AND u.user_country_code = 'US';
