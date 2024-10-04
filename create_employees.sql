USE memory.default;

-- Create SQL for EMPLOYEE table creation.
CREATE TABLE IF NOT EXISTS EMPLOYEE (EMPLOYEE_ID TINYINT, FIRST_NAME VARCHAR(25), LAST_NAME VARCHAR(25), JOB_TITLE VARCHAR(15),MANAGER_ID TINYINT)
COMMENT 'Table creation for Employee data';

-- Insert data in the hr/employee_index.csv into EMPLOYEE table
INSERT INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE, MANAGER_ID)
VALUES 
(1, 'Ian', 'James', 'CEO', 4),
(2,'Umberto','Torrielli','CSO',1),
(3, 'Alex', 'Jacobson', 'MD EMEA', 2),
(4, 'Darren', 'Poynton 'CFO' , 2),
(5, 'Tim', 'Beard', 'MD APAC', 2),
(6, 'Gemma', 'Dodd', 'COS', 1),
(7, 'Lisa', 'Platten', 'CHR', 6),
(8, 'Stefano', 'Camisaca', 'GM Activation', 2),
(9, 'Andrea', 'Ghibaudi', 'MD NAM',2);
