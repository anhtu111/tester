create database tester;

use tester
CREATE TABLE `categoryquestion` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `groupaccount` (
  `GroupID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  KEY `GroupID` (`GroupID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `groupaccount_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `group` (`GroupID`),
  CONSTRAINT `groupaccount_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `group` (
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(100) DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `position` (
  `positionID` int NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `question` (
  `QuestionID` int NOT NULL AUTO_INCREMENT,
  `Content` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `TypeID` (`TypeID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categoryquestion` (`CategoryID`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `answer` (
  `AnswerID` int NOT NULL AUTO_INCREMENT,
  `Content` varchar(100) DEFAULT NULL,
  `QuestionID` int DEFAULT NULL,
  `isCorrect` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examquestion` (
  `ExamID` int DEFAULT NULL,
  `QuestionID` int DEFAULT NULL,
  KEY `ExamID` (`ExamID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `examquestion_ibfk_1` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`),
  CONSTRAINT `examquestion_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `ExamID` int NOT NULL AUTO_INCREMENT,
  `Code` int DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `CreatorID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categoryquestion` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `positionID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `DepartmentID` (`DepartmentID`),
  KEY `positionID` (`positionID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `typequestion` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` enum('(Essay,','Multiple-Choice)') DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- BT
 
create table Department(
DepartmentID int not null auto_increment primary key,
DepartmentName varchar(100)
)

 
create table `Position`(
positionID int not null auto_increment primary key,
PositionName varchar(20)
)

create table `Account`(
AccountID int not null auto_increment primary key,
Email varchar(50),
Username varchar(50),
FullName varchar(50),
DepartmentID int,
positionID int,
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY (positionID) REFERENCES `Position`(positionID),
CreateDate date
)

create table `Group`(
GroupID int not null auto_increment primary key,
GroupName varchar(100),
CreatorID int,
CreateDate date
)

create table GroupAccount(
GroupID int,
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
AccountID int,
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
JoinDate date 
)

create table TypeQuestion(
TypeID int not null auto_increment primary key,
TypeName enum('(Essay,','Multiple-Choice)')
)

create table CategoryQuestion(
CategoryID int not null auto_increment primary key,
CategoryName varchar(100)
)

create table Question(
QuestionID int not null auto_increment primary key,
Content int,
CategoryID int,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
TypeID int,
FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
CreatorID int,
CreateDate date
)

create table Answer(
AnswerID int not null auto_increment primary key,
Content varchar(100),
QuestionID int,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
isCorrect varchar(10)
)

create table Exam(
ExamID int not null auto_increment primary key,
`Code` int,
Title varchar(100),
CategoryID int,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
Duration time,
CreatorID int,
CreateDate date
)

create table ExamQuestion(
ExamID int,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
QuestionID int,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
)


