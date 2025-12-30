CREATE DATABASE mini_project;
USE mini_project;



CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,            
    phone_number VARCHAR(10) NOT NULL,                         
    email VARCHAR(100) UNIQUE                  
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY, 
    course_name VARCHAR(100) NOT NULL,        
    credit INT NOT NULL,                         
    CONSTRAINT chk_credit CHECK (credit > 0)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2) DEFAULT 0, 
    
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id), 
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);



INSERT INTO Student (full_name, phone_number, email) VALUES 
('Nguyen Van An', '0963718462', 'annguyen@example.com'),    
('Tran Thi Binh', '0381758294', 'binhtran@example.com'),    
('Le Van Cuong', '0978174624', 'cuongle@example.com'),
('Tran Khanh An', '0371899263','ankhanh@gmail.com'),      
('Tran Khanh Duy', '0388174658','duykhanh@gmail.com');    

INSERT INTO Course (course_name, credit) VALUES
('Toan Cao Cap', 3),        
('Tin Hoc Dai Cuong', 2),   
('Triet Hoc', 3),           
('Lap Trinh Java', 4),
('Lap Trinh Web', 5);       

INSERT INTO Enrollment (student_id, course_id, grade) VALUES
(1, 1, 7.5),
(1, 2, 8.0),
(2, 3, 5.0), 
(4, 5, 9.0);

UPDATE Enrollment 
SET grade = 9.0
WHERE student_id = 2 AND course_id = 3;


SELECT full_name, email, phone_number 
FROM Student;

DELETE FROM Course 
WHERE course_id = 101; 
