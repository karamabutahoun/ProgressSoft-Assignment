
CREATE TABLE MyDepartment (
    Dept_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);



CREATE TABLE Gender (
    Gender_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL
);



CREATE TABLE University (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);



CREATE TABLE MyEmployee (
    ID NUMBER PRIMARY KEY,
    LAST_NAME VARCHAR2(100) NOT NULL,
    FIRST_NAME VARCHAR2(100) NOT NULL,
    HIRE_DATE DATE,
    USERID NUMBER,
    SALARY NUMBER CHECK (SALARY >= 0),
    DEPT_ID NUMBER,
    Gender_ID NUMBER,
    University_ID NUMBER,
    EMP_IMAGE BLOB,

    CONSTRAINT fk_department
        FOREIGN KEY (DEPT_ID)
        REFERENCES MyDepartment(Dept_ID),

    CONSTRAINT fk_gender
        FOREIGN KEY (Gender_ID)
        REFERENCES Gender(Gender_ID),

    CONSTRAINT fk_university
        FOREIGN KEY (University_ID)
        REFERENCES University(ID)
);


-- Add job title required for Q3
ALTER TABLE MyEmployee
ADD JOB_TITLE VARCHAR2(100);


-- Add manager relationship for Q2
ALTER TABLE MyEmployee
ADD MANAGER_ID NUMBER;

ALTER TABLE MyEmployee
ADD CONSTRAINT fk_manager
FOREIGN KEY (MANAGER_ID)
REFERENCES MyEmployee(ID);




-- Q2: Employee Details
SELECT
    e.FIRST_NAME || ' ' || e.LAST_NAME AS Employee_Name,
    e.SALARY,
    d.Name AS Department_Name,
    m.FIRST_NAME || ' ' || m.LAST_NAME AS Manager_Name,
    g.Name AS Gender_Name,
    u.Name AS University_Name
FROM MyEmployee e
LEFT JOIN MyDepartment d ON e.DEPT_ID = d.Dept_ID
LEFT JOIN MyEmployee m ON e.MANAGER_ID = m.ID
LEFT JOIN Gender g ON e.Gender_ID = g.Gender_ID
LEFT JOIN University u ON e.University_ID = u.ID;










-- Q4: Identify four SQL errors

-- Original statement:
-- SELECT empno, ename,
-- salary x 12 ANNUAL SALARY; FROM emp;

-- Error 1: Use * instead of x for multiplication.
-- Error 2: Remove the semicolon before FROM.
-- Error 3: An alias containing spaces needs double quotes.
-- Error 4: The column name should be SAL, not SALARY,
--          if using the standard Oracle SCOTT.EMP table.

-- Corrected statement:
SELECT empno, ename,
       sal * 12 AS "ANNUAL SALARY"
FROM emp;




-- Q5: Employees hired after SCOTT
CREATE OR REPLACE FUNCTION F_HR_QUERY
RETURN SYS_REFCURSOR
IS
    v_result SYS_REFCURSOR;
BEGIN
    OPEN v_result FOR
        SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
        FROM MyEmployee
        WHERE HIRE_DATE > (
            SELECT HIRE_DATE
            FROM MyEmployee
            WHERE UPPER(LAST_NAME) = 'SCOTT'
        );

    RETURN v_result;
END;
/




-- Q6: Copy employee data

CREATE TABLE MyEmployee_update AS
SELECT * FROM MyEmployee WHERE 1 = 0;

CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE
IS
BEGIN
    DELETE FROM MyEmployee_update;

    INSERT INTO MyEmployee_update
    SELECT * FROM MyEmployee;

    COMMIT;
END;
/





-- Test data for Q5
INSERT INTO MyEmployee
(ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY)
VALUES
(1, 'Test', 'SCOTT', DATE '1987-09-09', 3000);

INSERT INTO MyEmployee
(ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY)
VALUES
(2, 'Test', 'AHMAD', DATE '1980-10-10', 2000);

INSERT INTO MyEmployee
(ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY)
VALUES
(3, 'Test', 'RAMI', DATE '1986-05-24', 2500);

COMMIT;




-- Additional test employee hired after SCOTT
INSERT INTO MyEmployee
(ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY)
VALUES
(4, 'Omar', 'ALI', DATE '1990-06-15', 3500);

COMMIT;




-- Test data for Q3
UPDATE MyEmployee
SET JOB_TITLE = 'Developer'
WHERE ID IN (1, 2, 4);

UPDATE MyEmployee
SET JOB_TITLE = 'Sales Representative'
WHERE ID = 3;

COMMIT;




-- Q3: Monthly payroll by job title
SELECT
    JOB_TITLE,
    SUM(SALARY) AS TOTAL_MONTHLY_SALARY
FROM MyEmployee
WHERE UPPER(JOB_TITLE) NOT LIKE '%SALES%'
GROUP BY JOB_TITLE
HAVING SUM(SALARY) > 2500;




-- Test Q5: Display employees hired after SCOTT
VARIABLE result REFCURSOR;
EXEC :result := F_HR_QUERY;
PRINT result;




-- Execute the procedure
BEGIN
    P_COPY_EMPLOYEE;
END;
/

-- Verify copied data
SELECT * FROM MyEmployee_update;



-- SQL THEORY

-- SQL: Structured Query Language, used to manage
-- and query relational databases.

-- PL/SQL: Oracle's procedural extension of SQL.

-- DDL: Data Definition Language
-- Examples: CREATE, ALTER, DROP.

-- DML: Data Manipulation Language
-- Examples: INSERT, UPDATE, DELETE.

-- DCL: Data Control Language
-- Examples: GRANT, REVOKE.

-- JOIN TYPES:
-- INNER JOIN: Returns matching rows from both tables.
-- LEFT JOIN: Returns all left rows and matching right rows.
-- RIGHT JOIN: Returns all right rows and matching left rows.
-- FULL OUTER JOIN: Returns rows from both tables.
-- CROSS JOIN: Returns all possible row combinations.
-- SELF JOIN: Joins a table to itself.

-- RDBMS: Relational database management system.
-- Example: Oracle, MySQL, PostgreSQL.

-- NoSQL: Non-relational database systems.
-- Example: MongoDB.

-- AGGREGATE FUNCTIONS:
-- COUNT, SUM, AVG, MIN, MAX.

-- DATE FUNCTIONS:
-- SYSDATE, ADD_MONTHS, MONTHS_BETWEEN.

-- STRING FUNCTIONS:
-- UPPER, LOWER, SUBSTR, LENGTH.

-- CONSTRAINTS:
-- PRIMARY KEY, FOREIGN KEY, NOT NULL,
-- UNIQUE, CHECK.

-- INDEXES:
-- Improve data retrieval performance,
-- but require storage and maintenance.


