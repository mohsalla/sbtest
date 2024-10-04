/ * SQL query for creating 'Expense' Table  */

USE memory.default;

CREATE TABLE IF NOT EXISTS EXPENSE (
employee_id TINYINT,
item_desc varchar(100),
unit_price DECIMAL(8, 2),
quantity TINYINT ) COMMENT 'Table creation for EXPENSE data';

-- Insert the data from the finance/receipts_from_last_night directory into EXPENSE table.

INSERT INTO EXPENSE (employee_id, item_desc, unit_price,quantity)
VALUES
(3, 'Drinks, lots of drinks', 6.50, 14),
(3, 'More Drinks', 11.00, 20), 
(3, 'So Many Drinks!', 22.00, 18),
(3, 'I bought everyone in the bar a drink!', 13.00, 75),
(9, 'Flights from Mexico back to New York', 300.00, 1),
(4, 'Ubers to get us all home', 40.00, 9),
(2, 'I had too much fun and needed something to eat', 17.50, 4);