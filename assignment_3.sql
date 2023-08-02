use assignment

-- thêm  2- 5  loại lĩnh vực câu hỏi vào trong bảng categoryquestion(đã có sẵn dữ liệu test) --

insert  into `typequestion`(`Type_ID`,`Type_Name`) 
values
(1,'Khó'),
(2,'Dễ');

-- Thêm một 10 câu hỏi và các câu trả lời tương ứng (bảng question và answer) với mỗi câu hỏi sẽ có 4 câu trả lời.
-- Trong 4 câu trả lời đó thì sẽ có 1 câu trả lời đúng

insert  into `categoryquestion`(`Category_ID`,`Category_Name`) 
values 
(1,'Du lich'),
(2,'Công nghệ thông tin'),
(3,'Lịch sử'),
(4,'Toán học');

insert  into `question`(`Question_ID`,`Content`,`Category_ID`,`Type_ID`,`Creator_ID`,`Create_Date`) 
values

(3,'Phep tính sau cho kết quả là mấy : 20:5?',4,1,1,'2023-07-12'),
(4,'Phep tính sau cho kết quả là mấy : 25:5?',4,2,2,'2023-07-13'),
(5,'Cầu rồng ở đâu?',1,2,3,'2023-07-14'),
(6,'AI là gì ?',2,1,4,'2023-07-15'),
(7,'Bài thơ A là của ai ?',3,1,5,'2023-07-16'),
(8,'tester là làm gì ?',2,2,6,'2023-07-17'),
(9,'Bài thơ B là của ai ?',3,1,7,'2023-07-18'),
(10,'Địa điểm A ở đâu ?',1,1,8,'2023-07-19');


insert  into `answer`(`Answer_ID`,`Content`,`Question_ID`,`is_Correct`) 
values 

(6,'kết quả là 3',2,'1'),
(7,'kết quả là abc',2,'0'),
(8,'kết quả là ab',2,'0'),
(9,'kết quả là ac',2,'0'),
(10,NULL,NULL,'0'),

(11,'kết quả là 4',3,'1'),
(12,'kết quả là 12',3,'0'),
(13,'kết quả là 13',3,'0'),
(14,'kết quả là 14',3,'0'),
(15,NULL,NULL,'0'),

(16,'kết quả là 5',4,'1'),
(17,'kết quả là 12',4,'0'),
(18,'kết quả là 13',4,'0'),
(19,'kết quả là 14',4,'0'),
(20,NULL,NULL,'0'),

(21,'kết quả là ĐN',5,'1'),
(22,'kết quả là 12',5,'0'),
(23,'kết quả là 13',5,'0'),
(24,'kết quả là 14',5,'0'),
(25,NULL,NULL,'0'),

(26,'kết quả là C',6,'1'),
(27,'kết quả là 12',6,'0'),
(28,'kết quả là 13',6,'0'),
(29,'kết quả là 14',6,'0'),
(30,NULL,NULL,'0'),

(31,'kết quả là B',7,'1'),
(32,'kết quả là 12',7,'0'),
(33,'kết quả là 13',7,'0'),
(34,'kết quả là 14',7,'0'),
(35,NULL,NULL,'0'),

(36,'kết quả là F',8,'1'),
(37,'kết quả là 12',8,'0'),
(38,'kết quả là 13',8,'0'),
(39,'kết quả là 14',8,'0'),
(40,NULL,NULL,'0'),

(41,'kết quả là K',9,'1'),
(42,'kết quả là 12',9,'0'),
(43,'kết quả là 13',9,'0'),
(44,'kết quả là 14',9,'0'),
(45,NULL,NULL,'0'),

(46,'kết quả là G',10,'1'),
(47,'kết quả là 12',10,'0'),
(48,'kết quả là 13',10,'0'),
(49,'kết quả là 14',10,'0'),
(50,NULL,NULL,'0');


-- Lấy toàn bộ danh sách các câu hỏi và câu trả lời đúng. Sắp xếp theo thứ tự thời gian tạo tăng dần. 

select `question`.Question_ID, `question`.Content, `answer`.Content, `answer`.is_Correct, `question`.Create_Date
from `question` join `answer` 
on `question`.Question_ID = `answer`.Question_ID
where is_Correct = '1' 
order by Create_Date asc

-- Lấy toàn bộ danh sách các câu hỏi được tạo ra trong ngày hôm nay

select * from `question` where Create_Date = '2023-07-13'

-- Thống kê xem mỗi lĩnh vực câu hỏi, mỗi lĩnh vực có bao nhiêu câu hỏi.
-- và mỗi lĩnh vực có bao nhiêu câu hỏi khó , bao nhiêu câu hỏi dễ.

select `question`.Question_ID, `question`.Content, `categoryquestion`.Category_Name 
from `question` join `categoryquestion` on `question`.Category_ID = `categoryquestion`.Category_ID 

select count(Content)as `số câu hỏi lĩnh vực `,Category_Name from(
select `question`.Question_ID, `question`.Content, `categoryquestion`.Category_Name 
from `question` join `categoryquestion` on `question`.Category_ID = `categoryquestion`.Category_ID ) as dem
group by Category_Name

select count(Type_Name) as `số câu hỏi khó` ,Category_Name from(
select `question`.Question_ID,`question`.Content,`categoryquestion`.Category_Name,`typequestion`.Type_Name   
from `question` join `categoryquestion` on `question`.Category_ID = `categoryquestion`.Category_ID 
join `typequestion` on `question`.Type_ID = `typequestion`.Type_ID) as a
group by Category_Name,Type_Name
having Type_Name='khó'

select count(Type_Name) as `số câu hỏi dễ` ,Category_Name from(
select `question`.Question_ID,`question`.Content,`categoryquestion`.Category_Name,`typequestion`.Type_Name   
from `question` join `categoryquestion` on `question`.Category_ID = `categoryquestion`.Category_ID 
join `typequestion` on `question`.Type_ID = `typequestion`.Type_ID) as a
group by Category_Name,Type_Name
having Type_Name='dễ'

-- Tìm trong bảng question có bao nhiêu lĩnh vực câu hỏi đã được  thêm.

SELECT COUNT(DISTINCT `Category_ID`) AS `Số lượng lĩnh vực câu hỏi đâ đc thêm vào`
FROM `question`;

select * from question

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

SELECT `position`.`Position_ID`,
    `position`.`Position_Name`
FROM `assignment`.`position`;

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

