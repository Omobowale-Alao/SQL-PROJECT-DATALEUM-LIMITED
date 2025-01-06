create database dataleum_2;

use dataleum_2;

show tables;

select * from sales_data;

#To check for null values in columns "orderid" or "Productname"

select * from sales_data where orderid is null or OrderDate is null;
select * from sales_data where orderid or OrderDate is not null;

 /* After running this query, 969 records were returned, implying that no missing values were detected in the columns 
 This suggests that any data cleaning or preprocessing steps to address missing values are not needed for these columns.*/

/*This query was executed to transform numeric channel identifiers 
into more meaningful textual categories for easier interpretation and reporting. */
select *,
case
when chanelkey = 1 then "Store"
when chanelkey = 2 then "Online"
when chanelkey = 3 then "Mobile_Outlet"
when chanelkey = 4 then "Reseller"
else "others"
end as Channel_Category
from sales_data;

#To view imported tables
select * from sales_channel;
select * from sales_data;
select * from sales_product;
select * from sales_product_cat;
select * from sales_promotion;
select * from sales_state;

/* Each query below adds a column from a related table (state, channelname, productname, productsubcategory, or promotionname) 
to the sales_data table based on matching keys. */

select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state = "Enugu"; #To show orders from Enugu only

select sales_data.*, sales_channel.channelname
from sales_data
left join sales_channel
on sales_data.chanelkey = sales_channel.channelkey;

select sales_data.*, sales_product.productname
from sales_data
left join sales_product
on sales_data.productkey = sales_product.productkey;

select sales_data.*, sales_product_cat.productsubcategory
from sales_data
left join sales_product_cat
on sales_data.productsubcategorykey = sales_product_cat.productsubcategorykey;

select sales_data.*, sales_promotion.promotionname
from sales_data
left join sales_promotion
on sales_data.promotionkey = sales_promotion.promotionkey;


#To count number of orders per sales channel
select sales_channel.channelname,
count(orderqty) as Total_orders from sales_data
left join sales_channel
on sales_data.chanelkey = sales_channel.channelkey
group by sales_channel.channelname;


/*This query summarizes the total number of orders for each state
 and sorts the states based on the total order count in descending order */
select sales_state.state,
count(orderqty) as Total_Order from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
group by sales_state.state
order by Total_Order DESC;

#To get the maximum price per sales channel
select sales_channel.channelname,
max(sales_data.price) as Peak_Price from sales_data
left join sales_channel
on sales_data.chanelkey = sales_channel.channelkey
group by sales_channel.channelname
order by channelname desc;

#To wrap query that counts orders by channel inside a procedure named "ShowOrders"
select sales_channel.channelname,
count(sales_data.orderid) as No_of_orders from sales_data
left join sales_channel
on sales_data.chanelkey = sales_channel.channelkey
where sales_channel.channelname = channelname
group by sales_channel.channelname;

call ShowOrders("Online"); #To fetch the number of orders for channelname "Online"

#To return all rows for a specific state "Lagos" 
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state = "Lagos";

#To return all rows for other states aside "Lagos"
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state <>"Lagos";

#To show all rows for "Lagos","Oyo" and "Ekiti" only
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state in ("Lagos","Oyo","Ekiti");

#To show all rows for other states, excluding "Lagos","Oyo" and "Ekiti"
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state not in ("Lagos","Oyo","Ekiti");

#To show rows where orders are either from Lagos OR price is greater than N700
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state = "Lagos" or price > 700;

#To return all rows from sales data, but only for records where the state is Lagos AND the price is greater than N700
select sales_data.*, sales_state.state
from sales_data
left join sales_state
on sales_data.stateid = sales_state.stateid
where state = "Lagos" and price > 700;


#To return orders with prices between N200 and N500 only
select orderid,orderdate,price,orderqty from sales_data where price between 200 and 500;

#To return distinct products containing keyword "bluetooth" 
select distinct productname from sales_product where productname like "%bluetooth%";

#To count distinct products containing keyword "bluetooth"
select count(distinct productname) as Distinct_Product_Count from sales_product where productname like "%bluetooth%";

#To return max orderdate
select max(orderdate) as MaxOrderDate from sales_data;

#To return difference (in days) between current date and max orderdate
select datediff(curdate(),"2014-9-30");
