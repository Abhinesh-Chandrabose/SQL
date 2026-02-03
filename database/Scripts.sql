-- database: ./demo.db

-- Use the ▷ button in the top right corner to run the entire file.


create table Students(StudentID INTEGER PRIMARY KEY,
FirstName  TEXT Not NULL,
LastName TEXT Not Null,
Email Text Not Null);
create table Courses(CourseID int PRIMARY KEY,
CourseName TEXT Not null,
Credits INTEGER not NULL);
create  table Enrollments(
    EnrollmentID integer PRimary Key,
    StudentID integer NOT NULL,
    CourseID INTEGER NOT NULL,
    Grade Text,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)

);
 