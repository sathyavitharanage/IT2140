CREATE TABLE Department (
    dept_id     CHAR(5) PRIMARY KEY,
    dept_name   VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    student_id   CHAR(8) PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    nic          VARCHAR(10) UNIQUE NOT NULL,
    dept_id      CHAR(5),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Module (
    module_id    CHAR(6) PRIMARY KEY,
    module_name  VARCHAR(50) NOT NULL,
    credits      INT NOT NULL,
    dept_id      CHAR(5),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Enrollment (
    student_id   CHAR(8),
    module_id    CHAR(6),
    year         INT NOT NULL,
    semester     INT NOT NULL,
    PRIMARY KEY (student_id, module_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (module_id) REFERENCES Module(module_id)
);

ALTER TABLE Student
ADD CONSTRAINT chk_nic
CHECK (nic LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');

ALTER TABLE Module
ADD CONSTRAINT chk_credits
CHECK (credits IN (1, 2, 3, 4));
