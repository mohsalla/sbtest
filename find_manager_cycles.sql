-- Note: This query checks for cycles up to 3 levels deep and we can extend the query by adding more levels.

WITH Level1 AS (
     -- Start with a base level where we retrieve each employee and their direct manager from the EMPLOYEE table.     	Also initialize a loop_path to track the chain of approvals.
       SELECT e1.employee_id AS employee_id, e1.manager_id AS manager_id, 
           CAST(e1.employee_id AS VARCHAR) AS loop_path
    FROM employee e1
), Level2 AS (
       -- 1st level - Join the EMPLOYEE table on itself to move up one level in the management chain (i.e., the employee’s manager’s manager). Also the loop_path is updated to include the next employee in the chain.
    SELECT Level1.employee_id, e2.manager_id, 
           CONCAT(Level1.loop_path, ' -> ', CAST(e2.employee_id AS VARCHAR)) AS loop_path
    FROM Level1
    JOIN employee e2 ON Level1.manager_id = e2.employee_id

), Level3 AS (
       -- 2nd level to do another self-join to find manager's manager's manager.
       SELECT Level2.employee_id, e2.manager_id, 
           CONCAT(Level2.loop_path, ' -> ', CAST(e2.employee_id AS VARCHAR)) AS loop_path
    FROM Level2
    JOIN employee e2 ON Level2.manager_id = e2.employee_id
)
-- Final check if the employee’s ID matches their manager's ID at the end of the chain
SELECT employee_id, loop_path
FROM Level3
WHERE employee_id = manager_id
;
-- End of the script