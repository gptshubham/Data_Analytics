/*
Generate a yearly report for Croma India where there are two columns
1. Fiscal Year
2. Total Gross Sales amount In that year from Croma
*/
select 
	 get_fiscal_year(fsm.date) as FY,
     SUM(ROUND(fsm.sold_quantity * fgp.gross_price,2)) as yearly_sales
from fact_sales_monthly fsm
join fact_gross_price fgp
on 
	fsm.product_code=fgp.product_code AND
    get_fiscal_year(fsm.date) = fgp.fiscal_year
where customer_code = 90002002
group by get_fiscal_year(date)
order by FY;


