create table course(
    course_no VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(50),
    semester INT,
    conducted_by INT
);

ALTER TABLE course ADD
course_type VARCHAR(10);

ALTER TABLE course ADD
branch_name INT;

INSERT INTO branch (branchId, branchName) VALUES
(1, "Architectural Assistantship"),
(2, "Interior Design"),
(3, "Civil Engineering"),
(4, "Advanced Dip. In Food Technology"),
(5, "Computer Engineering"),
(6, "Electronics Engineering"),
(7, "Electrical Engineering"),
(8, "Instrumentation & Control"),
(9, "Leather & Footwear Technology"),
(10, "Mechanical Engineering");

INSERT INTO course (coursecode, coursename, branchId, semester, course_type) VALUES
('BPH-101', 'Applied Physics-I', 5, 1,'theory'),
('BCH-101', 'Applied Chemistry-I', 5, 1,'theory'),
('BMA-101', 'Applied Math-I', 5, 1,'theory'),
('BLE-101', 'Electronic Devices and Circuits', 5, 1,'theory'),
('BLE-102', 'Circuit Theory', 5, 1,'theory'),
('BPH-191', 'Physics Lab-I', 5, 1,'lab'),
('BCH-191', 'Chemistry Lab-I', 5, 1,'lab'),
('BLE-191', 'Basic Electronics Workshop', 5, 1,'lab'),
('BLE-192', 'Basic Electronics Lab', 5, 1,'lab'),
('BLC-191', 'Programming Lab-I', 5, 1,'lab'),
('BPH-201', 'Applied Plysics-II', 5, 2,'theory'),
('BCH-201', 'Applied Chemistry-II', 5, 2,'theory'),
('BMA-201', 'Applied Maths-II', 5, 2,'theory'),
('BEN-201', 'English and Communication Skills', 5, 2,'theory'),
('BLC-201', 'Basic Computer Organisation', 5, 2,'theory'),
('BPH-291', 'Physics Lab-II', 5, 2,'lab'),
('BCH-291', 'Chemistry Lab-II', 5, 2,'lab'),
('BLE-291', 'Electronics Maintainance Practice', 5, 2,'lab'),
('BLE-292', 'Electronics Engineering Lab', 5, 2,'lab'),
('BLC-291', 'Programming Lab-II', 5, 2,'lab'),
('BLE-301', 'Digital Electronics-I', 5, 3,'theory'),
('BLE-302', 'Electrical Engineering', 5, 3,'theory'),
('BLE-303', 'Electrical Instrumentation-I', 5, 3,'theory'),
('BLC-301', 'Programming in C', 5, 3,'theory'),
('BLC-302', 'Fundamentals of MicroProcessor', 5, 3,'theory'),
('BLC-391', 'Basic MicroProcessor Lab', 5, 3,'lab'),
('BLE-392', 'Electronics and Communication Lab-I', 5, 3,'lab'),
('BLC-392', 'Software Lab-I', 5, 3,'lab'),
('BLC-393', 'Programming Lab-III', 5, 3,'lab'),
('BLC-401', 'Data Structure and Algorithms', 5, 4,'theory'),
('BMA-401', 'Applied Math-III', 5, 4,'theory'),
('BLE-401', 'Analog Electronics Circuit', 5, 4,'theory'),
('BLE-402', 'Digital System-II', 5, 4,'theory'),
('BLE-403', 'Principle of Communication', 5, 4,'theory'),
('BLE-493', 'Electronics and Communication Lab-II', 5, 4,'lab'),
('BLC-491', 'Microprocessor and Control Lab', 5, 4,'lab'),
('BLC-492', 'Software Lab-II', 5, 4,'lab'),
('BLC-493', 'Programming Lab-IV', 5, 4,'lab'),
('BME-506', 'Management and Entrepreneurship', 5, 5,'theory'),
('BLC-501', 'Computer Graphics', 5, 5,'theory'),
('BLC-502', 'Compiler Design', 5, 5,'theory'),
('BMA-504', 'Computational Techniques', 5, 5,'theory'),
('BLC-503', 'Computer Communication Network', 5, 5,'theory'),
('BLC-591', 'Computer Hardware and Networking Lab', 5, 5,'lab'),
('BLC-592', 'Advanced Programming Lab-I', 5, 5,'lab'),
('BLC-593', 'Programming Lab-V', 5, 5,'lab'),
('BLC-594', 'Minor Project', 5, 5,'lab'),
('BLC-601', 'Web Design and Internet Development', 5, 6,'theory'),
('BLC-602', 'Software Engineering', 5, 6,'theory'),
('BCE-607', 'Environmental Studies', 5, 6,'theory'),
('BLC-603', 'DataBase Management System', 5, 6,'theory'),
('BLC-604', 'Operating System', 5, 6,'theory'),
('BLC-691', 'Computer Hardware and Networking Lab', 5, 6,'lab'),
('BLC-692', 'Advanced Programming Lab-II', 5, 6,'lab'),
('BLC-693', 'Programming Lab-VI', 5, 6,'lab'),
('BLC-694', 'Major Project', 5, 6,'lab');

SELECT * FROM course
ORDER BY semester, course_type DESC, course_no;

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    academic_section VARCHAR(50)
);
ALTER TABLE branch CHANGE `branch_id` `branch_id` INT NOT NULL AUTO_INCREMENT;

INSERT INTO branch (branch_name, academic_section) VALUES
('Architechtural Assistantship', 'Architechture'),
('Interior Design', 'Architechture'),
('Civil Engineering', 'Civil Engineering'),
('Advanced Diploma Food Technology', 'Civil Engineering'),
('Computer Engineering', 'Electrical Engineering'),
('Electronics Engineering', 'Electrical Engineering'),
('Electrical Engineering', 'Electrical Engineering'),
('Instrumentation and control', 'Electrical Engineering'),
('Leather and Footwear Technology', 'Leather and Footwear'),
('Mechanical Engineering', 'Mechanical Engineering');

ALTER TABLE course ADD FOREIGN KEY (branch_name) REFERENCES branch(branch_id);

UPDATE course 
SET branch_name = 5;

CREATE TABLE students (
    enrollmentNo VARCHAR(10) PRIMARY KEY,
    facultyNo VARCHAR(15) UNIQUE,
    studentName VARCHAR(30),
    fathersName VARCHAR(30),
    phoneNo INT(12),
    emailId VARCHAR(30),
    branch INT,
    semester INT,
    dateOfBirth DATE,
    FOREIGN KEY (branch) REFERENCES branch(branch_id)
);
ALTER TABLE students ADD `password` VARCHAR(255);

ALTER TABLE students
MODIFY COLUMN phoneNo VARCHAR(12);


