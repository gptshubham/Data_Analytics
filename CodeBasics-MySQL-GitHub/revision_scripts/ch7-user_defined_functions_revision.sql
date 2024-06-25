# user defined function - Revision

-- fetching customer code of chroma
select * from dim_customer
where customer like "%croma%" and market = 'India';

-- fetching transactions related to croma India
select * from fact_sales_monthly
where 
	customer_code=90002002
order by date 
;

-- fetching FY from CY
select date_add(date, INTERVAL 4 MONTH) FROM fact_sales_monthly;

-- fetching transactions related to croma India FY 2021
select * from fact_sales_monthly
where 
	customer_code = 90002002 and
    YEAR(DATE_ADD(date, INTERVAL 4 MONTH)) = 2021
;

-- Alternatively : using get_fiscal_year()
select * from fact_sales_monthly
where 
	customer_code = 90002002 and
    get_fiscal_year(date) = 2021
;

# Exercise - sales report of fy 2021 Q4 related to croma India
select * from fact_sales_monthly
where 
	customer_code = 90002002 and
    get_fiscal_year(date) = 2021 and
    get_fiscal_quarter(date) = "Q4"
;
