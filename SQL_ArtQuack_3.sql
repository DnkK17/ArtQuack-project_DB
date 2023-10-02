CREATE TABLE [Level] (
  levelID int PRIMARY KEY,
  customerID int,
  levelName varchar(500)
);

CREATE TABLE [Role] (
  roleID int PRIMARY KEY,
  roleName varchar(500),
);

CREATE TABLE [UserRole] (
  userRoleID int PRIMARY KEY,
  roleID int FOREIGN KEY REFERENCES [Role]([roleID])
);

CREATE TABLE [Instructor] (
  instructorID int PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  [name] varchar(30),
  email varchar(30),
  job varchar(30),
  [certificate] varchar(500),
  rate int,
  summarize varchar(500)
);

CREATE TABLE [Category] (
  cateID int PRIMARY KEY,
  [name] varchar(500)
);

CREATE TABLE [Course] (
  [course_code] varchar(30),
  instructorID int FOREIGN KEY REFERENCES [Instructor]([instructorID]),
  cateID int FOREIGN KEY REFERENCES [Category]([cateID]),
  levelID int FOREIGN KEY REFERENCES [Level]([levelID]),
  reviewID int,
  courseID int PRIMARY KEY,
  [name] varchar(500),
  [description] varchar(500),
  [upload_date] date,
  [price] float,
  [viewer] int,
  [buyer] int,
  [rate] int,
);

CREATE TABLE [Topic] (
  topicID int PRIMARY KEY,
  [name] varchar(500),
  videoURL varchar(500),
  courseID int FOREIGN KEY REFERENCES [Course]([courseID])
);

CREATE TABLE [User] (
  userName int PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  email varchar(500),
  [password] varchar(30),
  phone int,
);

CREATE TABLE [Enroll] (
  enrollID int PRIMARY KEY,
  userID int FOREIGN KEY REFERENCES [User]([userName]),
  [courseID] int FOREIGN KEY REFERENCES [Course]([courseID]),
  [status] bit
);

CREATE TABLE [EnrollTopic] (
  enTopicID int PRIMARY KEY,
  topicID int FOREIGN KEY REFERENCES [Topic]([topicID]),
  enrollID int FOREIGN KEY REFERENCES [Enroll]([enrollID]),
  enroll_date date,
  [status] bit
);

CREATE TABLE [ArtWork] (
  artworkID int PRIMARY KEY,
  enTopicID int FOREIGN KEY REFERENCES [EnrollTopic]([enTopicID]),
  customerID int,
  instructorID int,
  [status] bit,
);

CREATE TABLE [Review] (
  reviewID int PRIMARY KEY,
  artworkID int FOREIGN KEY REFERENCES [ArtWork]([artworkID]),
  customerID int,
  instructorID int,
  rate int,
  comment varchar(500),
  [date] date,
  [status] bit,
);

CREATE TABLE [Post] (
  postID int PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  cateID int FOREIGN KEY REFERENCES [Category]([cateID]),
  topicID int FOREIGN KEY REFERENCES [Topic]([topicID]),
  content varchar(3000),
  [status] bit,
);

ALTER TABLE [dbo].[User] add ID int, name varchar(100)
alter table [dbo].[User] drop column [phone]
alter table [dbo].[Instructor] drop column [job]
alter table [dbo].[User] add status bit
alter table [dbo].[Instructor] add status bit