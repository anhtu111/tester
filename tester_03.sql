DROP DATABASE IF EXISTS assignment;
create database assignment;

use assignment

DROP TABLE IF EXISTS `Department`;
create table Department (
Departmet_ID int auto_increment primary key,
Department_Name varchar(100)
);

DROP TABLE IF EXISTS `Position`;
create table Position (
Position_ID int auto_increment primary key ,
Position_Name enum('Dev','Test','Scrum Master','PM', 'marketing')
);

DROP TABLE IF EXISTS `Account`;
create table `Account` (
Account_ID int auto_increment primary key,
Email text,
Username varchar(100) unique key,
Full_Name varchar(100),
Departmet_ID int,
Position_ID int,
Create_Date date,
age int ,
foreign key (Departmet_ID) references Department (Departmet_ID),
foreign key (Position_ID) references Position (Position_ID)
);

DROP TABLE IF EXISTS `Group`;
create table `Group` (
Group_ID int(200) auto_increment primary key,
Group_Name varchar(100),
Creator_ID int unique key,
Create_Date date
);

DROP TABLE IF EXISTS `GroupAccount`;
create table `GroupAccount` (
Group_ID int,
Account_ID int,
Join_Date date,
foreign key (Group_ID) references `Group` (Group_ID),
foreign key (Account_ID) references `Account` (Account_ID)
);

DROP TABLE IF EXISTS `TypeQuestion`;
create table TypeQuestion (
Type_ID int primary key,
Type_Name varchar(100) 
);

DROP TABLE IF EXISTS `CategoryQuestion`;
create table CategoryQuestion (
Category_ID int primary key,
Category_Name varchar(100)
);

DROP TABLE IF EXISTS `Question`;
create table Question (
Question_ID int auto_increment primary key,
Content text,
Category_ID int,
Type_ID int,
Creator_ID int,
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Type_ID) references TypeQuestion (Type_ID),
foreign key (Creator_ID) references `Account` (Account_id)
);

DROP TABLE IF EXISTS `Answer`;
create table Answer (
Answer_ID int auto_increment primary key,
Content text,
Question_ID int,
is_Correct enum('1','0') ,
foreign key (Question_ID) references Question (Question_ID)
);

DROP TABLE IF EXISTS `Exam`;
create table Exam (
Exam_ID int auto_increment primary key,
`Code` varchar(20) unique key,
Title text,
Category_ID int,
Duration int,
Creator_ID int, 
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Creator_ID) references `Account` (Account_id)
);


DROP TABLE IF EXISTS `ExamQuestion`;
create table ExamQuestion (
Exam_ID int,
Question_ID int,
foreign key (Exam_ID) references Exam (Exam_ID), 
foreign key (Question_ID) references Question (Question_ID)
);



insert  into `department`(`Departmet_ID`,`Department_Name`) 
values 
	(1,'Phòng kỹ thuật'),
	(2,'Phòng nhân sự'),
	(3,'Phòng kế toán'),
	(4,'Ban giám đốc'),
	(5,'Phòng bảo vệ');

insert  into `position`(`Position_ID`,`Position_Name`)
values 
	(1,'Dev'),
	(2,'Test'),
	(3,'Scrum Master');

insert  into `account`(`Account_ID`,`Email`,`Username`,`Full_Name`,`Departmet_ID`,`Position_ID`,`Create_Date`,`age`) 
values 
	(1,'sonnv@gmail.com','sonnv','Nguyễn Văn Sơn',1,1,'2023-07-04',18),
	(2,'tuan@gmail.com','nvtuan','Nguyễn Văn Tuấn',2,1,'2023-07-09',22),
	(3,'van@gmail.com','van','nguyên văn vân',4,3,'2023-07-17',40),
	(4,'hong@gmail.com','hong','nguyễn thị hồng',2,2,'2023-07-26',34),
	(5,'phong@cnt.com','phong','Nguyen Văn Phong',5,1,'2023-07-31',18),
	(6,'anh@cnt.com','anh','Nguyễn Văn Anh',5,2,'2023-07-26',45),
	(7,'abc@cnt.com','abc','Trần Abc',3,2,'2023-07-26',45),
	(8,'gcde@gmai.com','gcde','nguyễn gcde',2,1,'2023-07-09',18),
	(9,'huong@gmail.com','huong','phùng thị hương',1,1,'2023-07-17',34),
    (10,'cccng@gmail.com','a','phùng thị a',4,2,'2023-07-28',20);

insert  into `group`(`Group_ID`,`Group_Name`,`Creator_ID`,`Create_Date`)
values 
(1,'TESTER',1,'2023-07-30'),
(2,'JAVA',2,'2023-07-27'),
(3,'DOTNET',3,'2023-07-18'),
(4,'PM',4,'2023-07-04');

select * from `account`

insert  into `groupaccount`(`Group_ID`,`Account_ID`,`Join_Date`) 
values 
(1,1,'2023-07-18'),
(2,2,'2023-07-27');

insert  into `typequestion`(`Type_ID`,`Type_Name`) 
values
(1,'Khó'),
(2,'Dễ');

insert  into `categoryquestion`(`Category_ID`,`Category_Name`) 
values 
(1,'Du lich'),
(2,'Công nghệ thông tin'),
(3,'Lịch sử'),
(4,'Toán học');

insert  into `question`(`Question_ID`,`Content`,`Category_ID`,`Type_ID`,`Creator_ID`,`Create_Date`) 
values
(1,'Kết quả của biểu thức sau là m ấy: 5 + 6 ?',4,2,1,'2023-07-26'),
(2,'Phep tính sau cho kết quả là mấy : 15:5?',4,1,2,'2023-07-11');

insert  into `answer`(`Answer_ID`,`Content`,`Question_ID`,`is_Correct`) 
values 
(1,'kết quả là 11',1,'1'),
(2,'kết quả là 12',1,'0'),
(3,'kết quả là 13',1,'0'),
(4,'kết quả là 14',1,'0'),
(5,NULL,NULL,'0');


insert  into `Exam`(`Exam_ID`,`Code`,`Title`,`Category_ID`,`Duration`,`Creator_ID`,`Create_Date`)
values 
(1,'A001','Bài tập 1',4,2,1,'2023-07-30'),
(2,'A002','Bài tập 2',2,3,2,'2023-07-28'),
(3,'A003','Bài tập 3',3,4,3,'2023-07-20'),
(4,'A004','Bài tập 4',4,2,1,'2023-07-21'),
(5,'A005','Bài tập 5',1,1,2,'2023-07-22'),
(6,'A006','Bài tập 6',1,1,4,'2023-07-23');


insert  into `ExamQuestion`(`Exam_ID`,`Question_ID`)
values 
(1,1),
(2,2),
(3,1),
(4,1),
(5,2),
(6,1);


SELECT `position`.`Position_ID`,
    `position`.`Position_Name`
FROM `assignment`.`position`;

SELECT `account`.`Account_ID`,
    `account`.`Email`,
    `account`.`Username`,
    `account`.`Full_Name`,
    `account`.`Departmet_ID`,
    `account`.`Position_ID`,
    `account`.`Create_Date`,
    `account`.`age`
FROM `assignment`.`account`;

SELECT `answer`.`Answer_ID`,
    `answer`.`Content`,
    `answer`.`Question_ID`,
    `answer`.`is_Correct`
FROM `assignment`.`answer`;

SELECT `categoryquestion`.`Category_ID`,
    `categoryquestion`.`Category_Name`
FROM `assignment`.`categoryquestion`;

SELECT `department`.`Departmet_ID`,
    `department`.`Department_Name`
FROM `assignment`.`department`;

SELECT `exam`.`Exam_ID`,
    `exam`.`Code`,
    `exam`.`Title`,
    `exam`.`Category_ID`,
    `exam`.`Duration`,
    `exam`.`Creator_ID`,
    `exam`.`Create_Date`
FROM `assignment`.`exam`;

SELECT `examquestion`.`Exam_ID`,
    `examquestion`.`Question_ID`
FROM `assignment`.`examquestion`;

SELECT `group`.`Group_ID`,
    `group`.`Group_Name`,
    `group`.`Creator_ID`,
    `group`.`Create_Date`
FROM `assignment`.`group`;

SELECT `groupaccount`.`Group_ID`,
    `groupaccount`.`Account_ID`,
    `groupaccount`.`Join_Date`
FROM `assignment`.`groupaccount`;

SELECT `question`.`Question_ID`,
    `question`.`Content`,
    `question`.`Category_ID`,
    `question`.`Type_ID`,
    `question`.`Creator_ID`,
    `question`.`Create_Date`
FROM `assignment`.`question`;

SELECT `typequestion`.`Type_ID`,
    `typequestion`.`Type_Name`
FROM `assignment`.`typequestion`;



