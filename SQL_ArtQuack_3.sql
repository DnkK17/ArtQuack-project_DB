CREATE TABLE [Level] (
  levelID int PRIMARY KEY,
  levelName varchar(500)
);

CREATE TABLE [Role] (
  roleID int PRIMARY KEY,
  roleName varchar(500),
);

CREATE TABLE [UserRole] (
  userRoleID varchar PRIMARY KEY,
  roleID int FOREIGN KEY REFERENCES [Role]([roleID])
);

CREATE TABLE [Instructor] (
  instructorID varchar PRIMARY KEY,
  userRoleID varchar FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  [name] varchar(30),
  email varchar(30),
  [certificate] varchar(500),
  rate int,
  summarize varchar(500),
  [status] bit
);

CREATE TABLE [Category] (
  cateID varchar PRIMARY KEY,
  [name] varchar(500)
);

CREATE TABLE [Course] (
  [course_code] varchar(30),
  instructorID varchar FOREIGN KEY REFERENCES [Instructor]([instructorID]),
  cateID varchar FOREIGN KEY REFERENCES [Category]([cateID]),
  levelID int FOREIGN KEY REFERENCES [Level]([levelID]),
  reviewID varchar,
  courseID varchar PRIMARY KEY,
  [name] varchar(500),
  [description] varchar(500),
  [upload_date] date,
  [price] float,
  [viewer] int,
  [buyer] int,
  [rate] int,
);

CREATE TABLE [Topic] (
  topicID varchar PRIMARY KEY,
  [name] varchar(500),
  videoURL varchar(1000),
  courseID varchar FOREIGN KEY REFERENCES [Course]([courseID])
);

CREATE TABLE [User] (
  userName varchar(100) PRIMARY KEY,
  userRoleID varchar FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  id varchar,
  [name] varchar(100),
  email varchar(500),
  [password] varchar(30),
  [status] bit
);

CREATE TABLE [Enroll] (
  enrollID varchar PRIMARY KEY,
  userName varchar(100) FOREIGN KEY REFERENCES [User]([userName]),
  [courseID] varchar FOREIGN KEY REFERENCES [Course]([courseID]),
  [status] bit
);

CREATE TABLE [EnrollTopic] (
  enTopicID varchar PRIMARY KEY,
  topicID varchar FOREIGN KEY REFERENCES [Topic]([topicID]),
  enrollID varchar FOREIGN KEY REFERENCES [Enroll]([enrollID]),
  enroll_date date,
  [status] bit
);

CREATE TABLE [ArtWork] (
  artworkID varchar PRIMARY KEY,
  enTopicID varchar FOREIGN KEY REFERENCES [EnrollTopic]([enTopicID]),
  userID varchar,
  instructorID varchar,
  [status] bit,
);

CREATE TABLE [Review] (
  reviewID varchar PRIMARY KEY,
  artworkID varchar FOREIGN KEY REFERENCES [ArtWork]([artworkID]),
  userID varchar,
  instructorID varchar,
  rate int,
  comment varchar(500),
  [date] date,
  [status] bit,
);

CREATE TABLE [Post] (
  postID varchar PRIMARY KEY,
  title varchar (300)
  cateID varchar FOREIGN KEY REFERENCES [Category]([cateID]),
  topicID varchar FOREIGN KEY REFERENCES [Topic]([topicID]),
  content varchar(3000),
  [status] bit,
);
