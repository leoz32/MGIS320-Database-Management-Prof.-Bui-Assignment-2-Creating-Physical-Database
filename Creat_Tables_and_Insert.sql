DROP DATABASE IF EXISTS Yilin_Jiang_Assignment3;
CREATE DATABASE Yilin_Jiang_Assignment3;
USE Yilin_Jiang_Assignment3;

CREATE TABLE Employee (
    EmployeeNum INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    ManagerID INT,
    PRIMARY KEY (EmployeeNum),
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeNum)
);

CREATE TABLE Project (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Note TEXT
);

CREATE TABLE EmployeeProject (
    EmployeeNum INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeNum, ProjectID),
    FOREIGN KEY (EmployeeNum) REFERENCES Employee(EmployeeNum),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE ProjectTask (
    ProjectID INT NOT NULL,
    Task VARCHAR(255),
    PRIMARY KEY (ProjectID, Task),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- Insert sample records into Employee
INSERT INTO Employee (FirstName, LastName, Email, ManagerID) VALUES
('Yifan', 'Zhu', 'yz5745@rit.edu',NULL),
('Yilin', 'Jiang', 'yj1114@rit.edu',NULL),
('Alice', 'Johnson', 'alice.johnson@example.com',1),
('Bob', 'Williams', 'bob.williams@example.com',1),
('Chat', 'GPT', 'chatgpt@openai.com',2);

-- Insert sample records into Project
INSERT INTO Project (ProjectName, StartDate, EndDate, Note) VALUES
('Project Alpha', '2023-01-01', '2023-06-01', 'Completed'),
('Project Beta', '2023-03-01', '2023-09-01', 'Ongoing'),
('Project Gamma', '2023-05-01', '2023-12-01', 'Ongoing'),
('Project Delta', '2024-07-01', '2025-01-01', 'Planned'),
('Project Epsilon', '2024-09-01', '2025-03-01', 'Planned'); 

-- Insert sample records into EmployeeProject
INSERT INTO EmployeeProject (EmployeeNum, ProjectID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5); 

-- Insert sample records into ProjectTask
INSERT INTO ProjectTask (ProjectID, Task) VALUES
(1, 'Task A'),
(1, 'Task B'),
(2, 'Task C'),
(3, 'Task D'),
(4, 'Task E');
