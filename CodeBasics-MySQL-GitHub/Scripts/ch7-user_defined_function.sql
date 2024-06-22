-- Month
select *
from fact_sales_monthly
where 
	customer_code=(
		select customer_code from dim_customer where customer like "%Croma%" and market = 'india') and
        -- or we can simply query it in a different temp tab and copy the output here
        -- in that case out query for customer_code would be:
        -- where customer_code = '90002002'
	get_fiscal_year(date)='2021'
order by date desc;


-- Product Name 
-- Variant
-- Sold Quality
-- Gross Price Per Item
-- Gross Price Total
