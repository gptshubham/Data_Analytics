# exploring fact_sales_monthly
SELECT * FROM gdb0041.fact_sales_monthly;

# exploring dim_customer
SELECT * FROM gdb0041.dim_customer;

select distinct market from dim_customer;
select distinct channel from dim_customer;
select distinct region from dim_customer;

# exploring dim_product
SELECT * FROM gdb0041.dim_product;

select distinct division from dim_product;
select distinct segment from dim_product;
select distinct category from dim_product;
-- Hierarchy (Breakdown): division -> segment -> category -> product -> variant

# exploring fact_gross_price
SELECT * FROM gdb0041.fact_gross_price;

select * from dim_product where product_code='A0118150101';

# exploring fact_pre_invoice_deductions
SELECT * FROM gdb0041.fact_pre_invoice_deductions;

# exploring fact_post_invoice_deductions
SELECT * FROM gdb0041.fact_post_invoice_deductions;

# exploring fact_manufacturing_cost
SELECT * FROM gdb0041.fact_manufacturing_cost;

# exploring fact_freight_cost 
SELECT * FROM gdb0041.fact_freight_cost;
