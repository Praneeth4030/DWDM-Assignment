CREATE DATABASE UNIVERSITY;

USE University;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice', 20, 'Computer Science'),
(2, 'Bob', 22, 'Data Science'),
(3, 'Charlie', 21, 'Computer Science'),
(4, 'Diana', 23, 'Data Science'),
(5, 'Ethan', 19, 'Mathematics'),
(6, 'Fiona', 20, 'Computer Science'),
(7, 'George', 24, 'Data Science'),
(8, 'Hannah', 22, 'Computer Science'),
(9, 'Ian', 21, 'Data Science'),
(10, 'Julia', 23, 'Computer Science'),
(11, 'Kevin', 25, 'Data Science'),
(12, 'Liam', 22, 'Computer Science'),
(13, 'Mona', 24, 'Data Science'),
(14, 'Nate', 17, 'Undeclared'),
(15, 'Olivia', 23, 'Physics');

SELECT * FROM Students;

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES
(101, 'Database Systems', 4),
(102, 'Algorithms', 4),
(103, 'Machine Learning', 3),
(104, 'Web Development', 3);

SELECT * FROM Courses;

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES
(1, 1, 101, 'A'),
(2, 2, 103, 'B'),
(3, 3, 102, 'A'),
(4, 4, 103, 'C'),
(5, 1, 102, 'B'),
(6, 6, 101, 'A-'),
(7, 7, 103, 'B+'),
(8, 8, 102, 'C+'),
(9, 9, 103, 'A'),
(10, 2, 101, 'B');

SELECT * FROM Enrollments;

-- ====================================================================
-- Executing All Provided Queries
-- ====================================================================

-- Question:

-- Write an SQL query to create a table named Departments with the following columns:
 -- DeptID → integer, should be the primary key.
 -- DeptName → variable-length string up to 50 characters.

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Question: How do you add a new column Email of type VARCHAR(100) to the existing Students table?
ALTER TABLE Students ADD Email VARCHAR(100);

-- Write an SQL statement to delete the entire table Departments from the database?

DROP TABLE Departments;

-- How do you insert a new student records into the Students table?

INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice', 20, 'Computer Science'),
(2, 'Bob', 22, 'Data Science'),
(3, 'Charlie', 21, 'Computer Science'),
(4, 'Diana', 23, 'Data Science'),
(5, 'Ethan', 19, 'Mathematics'),
(6, 'Fiona', 20, 'Computer Science'),
(7, 'George', 24, 'Data Science'),
(8, 'Hannah', 22, 'Computer Science'),
(9, 'Ian', 21, 'Data Science'),
(10, 'Julia', 23, 'Computer Science'),
(11, 'Kevin', 25, 'Data Science'),
(12, 'Liam', 22, 'Computer Science'),
(13, 'Mona', 24, 'Data Science'),
(14, 'Nate', 17, 'Undeclared'),
(15, 'Olivia', 23, 'Physics');

SELECT * FROM Students;
SELECT * FROM Students;

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES
(101, 'Database Systems', 4),
(102, 'Algorithms', 4),
(103, 'Machine Learning', 3),
(104, 'Web Development', 3);

SELECT * FROM Courses;

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES
(1, 1, 101, 'A'),
(2, 2, 103, 'B'),
(3, 3, 102, 'A'),
(4, 4, 103, 'C'),
(5, 1, 102, 'B'),
(6, 6, 101, 'A-'),
(7, 7, 103, 'B+'),
(8, 8, 102, 'C+'),
(9, 9, 103, 'A'),
(10, 2, 101, 'B');

SELECT * FROM Enrollments;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- How do you add a new column Email of type VARCHAR(100) to the existing Students table?

ALTER TABLE Students ADD Email VARCHAR(100);
SELECT * FROM Students;
-- Write an SQL statement to delete the entire table Departments from the database?

DROP TABLE Departments;

-- How do you insert a new student record with ID=1, Name=Alice, Age=20, and Major=Computer Science into the Students table?

INSERT INTO Students (StudentID, Name, Age, Major)
VALUES (1, 'Alice', 20, 'Computer Science');

-- Write an SQL query to update the Major of the student with StudentID = 1 to Data Science?
UPDATE Students SET Major = 'Data Science' WHERE StudentID = 1;

-- Write an SQL query to delete all students whose Age is less than 18?
DELETE FROM Students WHERE Age < 18;

-- How do you fetch the Name and Major of all students older than 19 years?
SELECT Name, Major FROM Students WHERE Age > 19;

-- Write an SQL query to calculate the average age of all students?
SELECT AVG(Age) AS AvgAge FROM Students;

-- Write an SQL query to count the number of students in each Major and display only those majors having more than 5 students?
SELECT Major, COUNT(*) AS StudentCount
FROM Students
GROUP BY Major
HAVING COUNT(*) > 5;

-- Write an SQL query to fetch all details of students who are older than 20 years and are majoring in Computer Science?
SELECT * FROM Students WHERE Age > 20 AND Major = 'Computer Science';

-- Write an SQL query to display each student’s name, grade, and their rank in the class based on grades (highest grade first)?
SELECT Name, Grade,
       RANK() OVER (ORDER BY Grade DESC) AS RankInClass
FROM Enrollments;

-- Write a query to display student names along with the course names they are enrolled in using an INNER JOIN?
SELECT s.Name, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

 -- Write a query to display all students and their enrolled course names. If a student is not enrolled in any course, still include them in the result.?
 SELECT s.Name, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- Write an SQL query to display every possible combination of students and courses using a CROSS JOIN?
SELECT s.Name, c.CourseName
FROM Students s CROSS JOIN Courses c;

-- Question: Find student IDs present in both Students and Enrollments tables.
SELECT StudentID FROM Students
INTERSECT
SELECT StudentID FROM Enrollments;

-- Question: Find students registered but not enrolled in any course.
SELECT Name FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Students
    EXCEPT
    SELECT StudentID FROM Enrollments
);

-- Question: How to perform several changes as a single atomic operation?
BEGIN TRANSACTION;
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES (16, 1, 104, 'A');
UPDATE Students SET Major = 'AI' WHERE StudentID = 1;
COMMIT TRANSACTION;

-- Question: How do you create an index to speed up searches on the Major column?
CREATE INDEX idx_student_major ON Students(Major);

-- Question: How can you check if the index is used?
SELECT * FROM Students WHERE Major = 'Data Science';

-- Write an SQL query to display pairs of students who have the same major but different StudentIDs (self join)?
SELECT s1.Name AS Student1, s2.Name AS Student2
FROM Students s1
JOIN Students s2 
  ON s1.Major = s2.Major 
 AND s1.StudentID <> s2.StudentID;

-- Write an SQL query to group students by major and display all names in each major as a comma-separated string?
SELECT Major, STRING_AGG(Name, ', ') AS Students
FROM Students
GROUP BY Major;

-- How do you achieve the same result in MySQL (list of student names grouped by major)?
SELECT Major, GROUP_CONCAT(Name, ', ') AS Students
FROM Students
GROUP BY Major;

-- Question: List all students, sorted by age in descending order.
SELECT Name, Age
FROM Students
ORDER BY Age DESC;

-- Question: List students, sorted first by age (descending), then by name (ascending).
SELECT Name, Age
FROM Students
ORDER BY Age DESC, Name ASC;

-- Question: Show the top 5 oldest students.
SELECT TOP  Name, Age
FROM Students
ORDER BY Age DESC;

-- Question: Using a CTE, find students who are older than the average age.
WITH AvgAgeCTE AS (
    SELECT AVG(Age) AS AgeValue FROM Students
)
SELECT Name, Age
FROM Students, AvgAgeCTE
WHERE Students.Age > AvgAgeCTE.AgeValue;
