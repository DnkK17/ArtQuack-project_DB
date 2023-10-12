CREATE TABLE [Level] (
  levelID int PRIMARY KEY,
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
  instructorID varchar(50) PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  [name] varchar(30),
  email varchar(30),
  [certificate] varchar(500),
  rate int,
  summarize varchar(500),
  [status] bit
);

CREATE TABLE [Category] (
  cateID int PRIMARY KEY,
  [name] varchar(500)
);

CREATE TABLE [Course] (
  [course_code] varchar(30),
  instructorID varchar(50) FOREIGN KEY REFERENCES [Instructor]([instructorID]),
  cateID int FOREIGN KEY REFERENCES [Category]([cateID]),
  levelID int FOREIGN KEY REFERENCES [Level]([levelID]),
  reviewID int,
  courseID varchar(50) PRIMARY KEY,
  [name] varchar(500),
  [description] varchar(500),
  [upload_date] date,
  [price] float,
  [viewer] int,
  [buyer] int,
  [rate] int,
);

CREATE TABLE [Topic] (
  topicID varchar(50) PRIMARY KEY,
  [name] varchar(500),
  videoURL varchar(1000),
  courseID varchar(50) FOREIGN KEY REFERENCES [Course]([courseID])
);

CREATE TABLE [User] (
  userName varchar(100) PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  id varchar(50),
  [name] varchar(100),
  email varchar(500),
  [password] varchar(30),
  [status] bit
);

CREATE TABLE [Enroll] (
  enrollID varchar(50) PRIMARY KEY,
  userName varchar(100) FOREIGN KEY REFERENCES [User]([userName]),
  [courseID] varchar(50) FOREIGN KEY REFERENCES [Course]([courseID]),
  [status] bit
);

CREATE TABLE [EnrollTopic] (
  enTopicID varchar(50) PRIMARY KEY,
  topicID varchar(50) FOREIGN KEY REFERENCES [Topic]([topicID]),
  enrollID varchar(50) FOREIGN KEY REFERENCES [Enroll]([enrollID]),
  enroll_date date,
  [status] bit
);

CREATE TABLE [ArtWork] (
  artworkID varchar(50) PRIMARY KEY,
  enTopicID varchar(50) FOREIGN KEY REFERENCES [EnrollTopic]([enTopicID]),
  userID varchar(50),
  instructorID varchar(50),
  [status] bit,
);

CREATE TABLE [Review] (
  reviewID varchar(50) PRIMARY KEY,
  artworkID varchar(50) FOREIGN KEY REFERENCES [ArtWork]([artworkID]),
  userID varchar(50),
  instructorID varchar(50),
  rate int,
  comment varchar(500),
  [date] date,
  [status] bit,
);

CREATE TABLE [Post] (
  postID varchar(50) PRIMARY KEY,
  userRoleID varchar(50) FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  cateID int FOREIGN KEY REFERENCES [Category]([cateID]),
  title varchar(1000),
  content varchar(3000),
  [status] bit,
);
