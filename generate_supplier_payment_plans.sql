/* The below query calculates the remaining balance (balance_outstanding) and the monthly payment (payment_amount) for each supplier, and then creates a sequence of payment dates for the remaining months. */


with RECURSIVE nums as (
      select 0 as n
      union all
      select n + 1 as n
      from nums
      where n < 11
     ),

monthly_payments as (
	select t.*,
       		last_day_of_month(DATE_ADD('month', n, current_date)) AS payment_date
	from (select *,
       		EXTRACT(YEAR FROM i.due_date) * 12 + EXTRACT(MONTH FROM i.due_date) - 			(EXTRACT(YEAR FROM current_date) * 12 + EXTRACT(MONTH FROM current_date)) + 			1 AS months_remaining,
       			round(i.invoice_ammount / NULLIF(EXTRACT(YEAR FROM i.due_date) * 12 + 				EXTRACT(MONTH FROM i.due_date)
          		- (EXTRACT(YEAR FROM current_date) * 12 + EXTRACT(MONTH FROM current_date)) 			+ 1, 0),2) AS payment_amount
		from test.invoice i
		) t join
     nums n
     on DATE_ADD('month', n, current_date) <= due_date

)

select sub_q.supplier_id,
           s.name as supplier_name,
       sub_q.invoice_ammount,
       sub_q.due_date,
       sub_q.payment_amount,
      (invoice_ammount - (payment_amount*row_id)) as balance_after_payment,
      sub_q.payment_date
from (
	select *,row_number() over(PARTITION BY supplier_id,invoice_ammount ORDER BY 			supplier_id, invoice_ammount,payment_date) as row_id
	from monthly_payments) sub_q
join 
test.supplier s 
on sub_q.supplier_id = s.supplier_id 
;

-- END of the script
