
/*FULL DATA ANALYTICS PROJECT (SQL,Tableau,Excel)
---The project is for a Bikestore company. I'm going to use SQL to retrieve data from the company's database, Import the data to excel and use Pivot chart to create visualizations and continue with tableau---
--THE DATA ANALYSIS PROCESS;
1. Understand the Problem:Management wants to gain insights into the sales trend of the company over a two year period; They want to know the Revenue per Region,Per Store, Per Product Category,Per Brand,Top 10 customers and Sales Rep
with most revenue.
A list of the Top Customers and Sales Representatives.
2.Collect and gather the data:The dataset is stored according to tables so we will use SQL to query for the columns that we need and form a complete dataset with it. The columns we need are; order_id,customer_name,
city,state,total units,revenue,product_name,category_name,store_name,sales_rep.
3.Clean the data:The data seems okay for now. Lets see if it the same in excel and tableau.
4.Gather and Analyze the data:Now that we have the final dataset with the columns we need, we will export the dataset from SQL server to excel for analysis. 
Create Pivot tables:Total revenue per Year, Total Revenue per month for each year, 
5.Interpret the results*/

SELECT
sales.orders.order_id,
CONCAT(sales.customers.first_name,',',sales.customers.last_name) AS customer_name,       
sales.customers.city,
sales.customers.state,
sales.orders.order_date,
SUM(sales.order_items.quantity) AS total_units,
SUM(sales.order_items.quantity*sales.order_items.list_price) AS revenue,
production.products.product_name,
production.categories.category_name,
sales.stores.store_name,
CONCAT(sales.staffs.first_name,',',sales.staffs.last_name) AS sales_rep,
production.brands.brand_name
FROM sales.orders 
JOIN sales.customers 
ON sales.orders.customer_id = sales.customers.customer_id
JOIN sales.order_items
ON sales.orders.order_id = sales.order_items.order_id
JOIN production.products
ON sales.order_items.product_id = production.products.product_id
JOIN production.categories 
ON production.products.category_id = production.categories.category_id
JOIN sales.stores
ON sales.orders.store_id = sales.stores.store_id
JOIN sales.staffs
ON sales.orders.staff_id = sales.staffs.staff_id
JOIN production.brands
ON production.products.brand_id = production.brands.brand_id
GROUP BY 
 sales.orders.order_id,
 CONCAT(sales.customers.first_name,',',sales.customers.last_name),       
 sales.customers.city,
 sales.customers.state,
 sales.orders.order_date,
 production.products.product_name,
 production.categories.category_name,
 sales.stores.store_name,
 CONCAT(sales.staffs.first_name,',',sales.staffs.last_name),
 production.brands.brand_name;
 
