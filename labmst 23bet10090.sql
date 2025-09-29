CREATE TABLE Student (
    sid INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50)
);

CREATE TABLE Marks (
    marks_id INT PRIMARY KEY,
    sid INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (sid) REFERENCES Student(sid)
);
INSERT INTO Student (sid, name, dept) VALUES
(1, 'Rahul', 'CSE'),
(2, 'Priya', 'ECE'),
(3, 'Amit', 'ME'),
(4, 'Sneha', 'IT'),
(5, 'Karan', 'CIVIL');

INSERT INTO Marks (marks_id, sid, subject, marks) VALUES
(1011, 1, 'Maths', 85),
(1021, 1, 'Physics', 78),
(1031, 2, 'Maths', 92),
(1041, 2, 'Electronics', 88),
(1051, 3, 'Thermo', 75),
(1061, 4, 'Programming', 95),
(1071, 5, 'Structures', 80),
(1081, 5, 'dsa', 70);

SELECT s.sid, s.name, s.dept, m.subject, m.marks
FROM Student s
JOIN Marks m ON s.sid = m.sid;

CREATE VIEW HighScorers AS
SELECT s.sid, s.name, s.dept, m.subject, m.marks
FROM Student s
JOIN Marks m ON s.sid = m.sid
WHERE m.marks > 80;

SELECT dept, AVG(marks) AS avg_marks
FROM HighScorers
GROUP BY dept;

CREATE VIEW DeptHighScores AS
SELECT 
    s.dept,
    COUNT(*) AS high_count,
    AVG(m.marks) AS avg_marks
FROM Student s
JOIN Marks m ON s.sid = m.sid
WHERE m.marks > 80
GROUP BY s.dept;

SELECT * FROM DeptHighScores;



