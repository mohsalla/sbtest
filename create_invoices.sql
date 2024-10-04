/ * Create INVOICE  Table  */
USE memory.default
;

--Create a table for INVOICE 

CREATE TABLE IF NOT EXISTS INVOICE (
supplier_id TINYINT,
invoice_ammount DECIMAL(8, 2),
due_date DATE
) COMMENT ' Table creation for INVOICE data'
;


/ * Create SUPPLIER  Table  */


-- Create a table for SUPPLIER 
CREATE TABLE IF NOT EXISTS SUPPLIER (
supplier_id TINYINT,
name VARCHAR
) COMMENT 'Table creation for SUPPLIER data'
;


-- Insert the data from the finance/invoices_due directory into the INVOICE table. 
INSERT INTO INVOICE (supplier_id, invoice_ammount, due_date)
VALUES
(1,  6000.00, date '2025-01-03'),
(2,  2000.00, date '2024-12-03'),
(2,  1500.00, date '2025-01-03'),
(3,  500.00, date '2024-11-03'),
(4,  6000.00, date '2025-01-03'),
(5,  4000.00, date '2025-04-03')
;


-- Insert the supplier data into SUPPLIER table
INSERT INTO SUPPLIER (supplier_id, name)
VALUES
(1, 'Party Animals'),
(2, 'Catering Plus'),
(3, 'Dave''s Discos'),
(4, 'Entertainment tonight'),
(5, 'Ice Ice Baby')
;

