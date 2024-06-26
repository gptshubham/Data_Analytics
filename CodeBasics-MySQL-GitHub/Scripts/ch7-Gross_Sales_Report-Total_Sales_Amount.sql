# Gross Monthly Total Sales Report for Croma
-- Month
-- Total gross sales amount to Croma India in this Month
select 
	fsm.date, 
    SUM(fsm.sold_quantity * fgp.gross_price) as gross_price_total
from fact_sales_monthly fsm
join fact_gross_price fgp
on 
	fsm.product_code = fgp.product_code AND
    get_fiscal_year(fsm.date) = fgp.fiscal_year
where 
	customer_code = 90002002
group by fsm.date
order by fsm.date asc;
