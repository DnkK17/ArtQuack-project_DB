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
  instructorID int PRIMARY KEY,
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
  videoURL varchar(1000),
  courseID int FOREIGN KEY REFERENCES [Course]([courseID])
);

CREATE TABLE [User] (
  userName varchar(100) PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]),
  id int,
  [name] varchar(100),
  email varchar(500),
  [password] varchar(30),
  [status] bit
);

CREATE TABLE [Enroll] (
  enrollID int PRIMARY KEY,
  userName varchar(100) FOREIGN KEY REFERENCES [User]([userName]),
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
  userID int,
  instructorID int,
  [status] bit,
);

CREATE TABLE [Review] (
  reviewID int PRIMARY KEY,
  artworkID int FOREIGN KEY REFERENCES [ArtWork]([artworkID]),
  userID int,
  instructorID int,
  rate int,
  comment varchar(500),
  [date] date,
  [status] bit,
);

CREATE TABLE [Post] (
  postID int PRIMARY KEY,
  userRoleID int FOREIGN KEY REFERENCES [UserRole]([userRoleID]), //empty userRoleID - replace w 'title'
  cateID int FOREIGN KEY REFERENCES [Category]([cateID]),
  topicID int FOREIGN KEY REFERENCES [Topic]([topicID]),
  content varchar(3000),
  [status] bit,
);
