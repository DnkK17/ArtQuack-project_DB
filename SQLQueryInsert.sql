INSERT INTO [dbo].[Role] ([roleID], [roleName]) VALUES 
	('0', 'Admin'),
	('1', 'Instructor'),
	('2', 'User');

INSERT INTO [dbo].[UserRole]([userRoleID], [roleID]) VALUES
	('1', '0'),
	('2', '1'),
	('3', '1'),
	('4', '2'),
	('5', '2');

INSERT INTO [dbo].[Category]([cateID], [name]) VALUES
	('1', 'Animals'),
	('2', 'Anime'),
	('3', 'Decorative motifs'),
	('4', 'Cartoons'),
	('5', 'Landscape'),
	('6', 'Sports'),
	('7', 'Cube'),
	('8', 'Toys'),
	('9', 'Humans')

INSERT INTO [dbo].[Instructor]([instructorID], [userRoleID], [name], [email], [certificate], [rate], [summarize], [status]) VALUES
	('1', '2', 'John', 'insmain@artquack.vn', NULL, '5', 'Good and have experiences', '1')


INSERT INTO [dbo].[Level] ([levelID], [levelName]) VALUES
	('1', 'Easy'),
	('2', 'Medium'),
	('3', 'Hard')

INSERT INTO [dbo].[User] ([userName], [userRoleID], [id], [name], [email], [password], [status]) VALUES
	('hihi', '2', '1', 'bubu', 'mainguyen@gmail.com', '123', '1')

INSERT INTO [dbo].[Review]([reviewID], [artworkID], [userID], [instructorID], [rate], [comment], [date], [status]) VALUES
	('1', NULL, '1', '1', '5', NULL, '2023-8-8', '1')

INSERT INTO [dbo].[Enroll]([enrollID], [userName], [courseID], [status]) VALUES
	('1', 'bubu', '1', '1')

INSERT INTO [dbo].[Course]([course_code], [instructorID], [cateID], [levelID], [reviewID], [courseID], [name], [description], [upload_date], [price], [viewer], [buyer], [rate]) VALUES
	('C123', '1', '7', '1', '1', '1', 'Draw city at night', 'nice', '2023-1-3', '9.9', '100', '120', '5')

INSERT INTO [dbo].[Topic]([topicID], [name], [videoURL], [courseID]) VALUES
	('1', 'Basic of city', 'https://www.youtube.com/watch?v=QaiaTvrRWN0', '1')

INSERT INTO [dbo].[Post] ([postID], [userRoleID], [cateID], [topicID], [content], [status]) VALUES
	('1', '1', '7', '1', 'A fully narrated Procreate digital drawing time lapse of a Japanese city at night.', '1')

INSERT INTO [dbo].[EnrollTopic]([enTopicID], [topicID], [enrollID], [enroll_date], [status]) VALUES
	('1', '1', '1', '2023-7-7', '1')