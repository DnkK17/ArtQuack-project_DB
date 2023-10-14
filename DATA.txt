-- Inserting data into [Level] table
INSERT INTO [Level] (levelID, levelName) VALUES
('L1', 'Beginner'),
('L2', 'Intermediate'),
('L3', 'Advanced');
('L4', 'Professional'),
('L5', 'Expert');

-- Inserting data into [Role] table
INSERT INTO [Role] (roleID, roleName) VALUES
(1, 'Admin'),
(2, 'Student'),
(3, 'Instructor');

-- Inserting data into [UserRole] table
INSERT INTO [UserRole] (userRoleID, roleID) VALUES
('UR1', 2),
('UR2', 3);

-- Inserting data into [Instructor] table
INSERT INTO [Instructor] (instructorID, userRoleID, [name], email, [certificate], rate, summarize, [status]) VALUES
('I1', 'UR2', 'Emily Johnson', 'emily.johnson@example.com', 'Certificate of Excellence in Art', 5, 'Experienced in Art Selling', 1);

-- Inserting data into [Category] table
INSERT INTO [Category] (cateID, [name]) VALUES
('C1', 'Paintings'),
('C2', 'Sculptures'),
('C3', 'Photography');

-- Inserting data into [Course] table
INSERT INTO [Course] ([course_code], instructorID, cateID, levelID, reviewID, courseID, [name], [description], [upload_date], [price], [viewer], [buyer], [rate]) VALUES
('ART101', 'I1', 'C1', 'L1', 'RV1', 'CRS1', 'Art Selling Basics', 'A comprehensive guide to selling art online and offline', '2023-10-08', 99.99, 50, 10, 4);
('ART102', 'I2', 'C2', 'L2', 'RV2', 'CRS2', 'Advanced Art Techniques', 'Exploring advanced techniques in various art forms', '2023-10-15', 149.99, 80, 15, 4),
('ART103', 'I3', 'C3', 'L3', 'RV3', 'CRS3', 'Mastering Contemporary Art', 'Master the techniques and concepts of contemporary art', '2023-10-20', 199.99, 100, 20, 4),
('ART104', 'I4', 'C1', 'L4', 'RV4', 'CRS4', 'Exploring Art History', 'A comprehensive journey through the history of art', '2023-10-25', 99.99, 60, 10, 4),
('ART105', 'I5', 'C5', 'L5', 'RV5', 'CRS5', 'Digital Art Creation', 'Learn to create stunning digital artworks using various tools', '2023-10-30', 249.99, 120, 25, 4),
('ART106', 'I6', 'C8', 'L2', 'RV6', 'CRS6', 'Introduction to Ceramics', 'Basic introduction to the art of ceramics and pottery', '2023-11-05', 149.99, 80, 15, 4);

-- Inserting data into [Topic] table
INSERT INTO [Topic] (topicID, [name], videoURL, courseID) VALUES
('T1', 'Introduction to Art Selling', 'https://www.example.com/intro_art_selling', 'CRS1'),
('T2', 'Marketing Strategies for Art', 'https://www.example.com/art_marketing_strategies', 'CRS1');

-- Inserting data into [User] table
INSERT INTO [User] (userName, userRoleID, id, [name], email, [password], [status]) VALUES
('student1', 'UR1', 'ID1', 'Michael Smith', 'michael.smith@example.com', 'password1', 1),
('instructor1', 'UR2', 'ID2', 'Emily Johnson', 'emily.johnson@example.com', 'password2', 1);

-- Inserting data into [Enroll] table
INSERT INTO [Enroll] (enrollID, userName, [courseID], [status]) VALUES
('E1', 'student1', 'CRS1', 1);

-- Inserting data into [EnrollTopic] table
INSERT INTO [EnrollTopic] (enTopicID, topicID, enrollID, enroll_date, [status]) VALUES
('ET1', 'T1', 'E1', '2023-10-09', 1);

-- Inserting data into [ArtWork] table
INSERT INTO [ArtWork] (artworkID, enTopicID, userID, instructorID, [status]) VALUES
('AW1', 'ET1', 'ID1', 'I1', 1);

-- Inserting data into [Review] table
INSERT INTO [Review] (reviewID, artworkID, userID, instructorID, rate, comment, [date], [status]) VALUES
('RV1', 'AW1', 'ID1', 'I1', 4, 'Great insights into art selling', '2023-10-10', 1);

-- Inserting data into [Post] table
INSERT INTO [Post] (postID, title, cateID, topicID, content, [status]) VALUES
('P1', 'Tips for Selling Your Artwork', 'C1', 'T1', 'Here are some valuable tips to help you sell your artwork effectively.', 1);
