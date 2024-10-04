-- This query retrieves the employee_id, name, manager_id, manager’s name, and the total expensed amount for any employee who has expensed more than 1000 in goods or services, ordered by the total amount spent.

SELECT 
    e.employee_id AS employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    SUM(exp.unit_price * exp.quantity) AS total_expensed_amount
FROM 
    EMPLOYEE e
JOIN 
    -- join EMPLOYEE e with the EXPENSE table using e.employee_id = exp.employee_id to calculate the expenses for each employee.
    EXPENSE exp ON e.employee_id = exp.employee_id
LEFT JOIN 
    -- To get the manager's details using e.manager_id = m.employee_id
    EMPLOYEE m ON e.manager_id = m.employee_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
HAVING 
    SUM(exp.unit_price * exp.quantity) > 1000
ORDER BY 
    total_expensed_amount DESC
;
--END of the script---
