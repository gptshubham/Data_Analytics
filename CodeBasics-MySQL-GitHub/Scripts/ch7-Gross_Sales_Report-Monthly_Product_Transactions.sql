-- Month & Sold Quality
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

/*
# Exercise - sales report of fy 2021 Q4 related to croma India
select * from fact_sales_monthly
where 
	customer_code = (select customer_code from dim_customer where customer like "%croma%" and market = "India") AND
    get_fiscal_year(date) = 2021 and
    -- get_fiscal_quarter(date) = "Q4"
    -- alternatively we can fetch quarter using get fiscal month
    get_fiscal_month(date) between 10 and 12
*/

-- Product Name & Variant
select 
	product,
    variant
from dim_product;

-- Gross Price Per Item
select gross_price from fact_gross_price;

-- Gross Price Total --> sold qty * gross_price per item


# final query
select 
	fsm.date, fsm.product_code,
    dp.product, dp.variant, fsm.sold_quantity, 
    fgp.gross_price,
    ROUND(fsm.sold_quantity * fgp.gross_price, 2) as gross_price_total
from fact_sales_monthly fsm
join dim_product dp
on fsm.product_code=dp.product_code
join fact_gross_price fgp
on 
	fsm.product_code = fgp.product_code and 
	get_fiscal_year(fsm.date) = fgp.fiscal_year
where 
	customer_code=90002002 and
	get_fiscal_year(date)='2021'
order by date ;




