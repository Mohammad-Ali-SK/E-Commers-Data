select * from customers
select * from delivery
select * from geolocation
select * from orders
select *  from payments
select * from products
select * from sales
select * from order_item



select products.product_category as Category, round(sum(payments.payment_value)::numeric,2) as sales from delivery as dv
join orders on orders.order_id = dv.order_id
join payments on payments.order_id = orders.order_id
join products on products.product_id = dv.product_id
group by Category order by sales desc;


-- 4. Calculate the percentage of orders that were paid in installments.


select (sum(case when payment_installments >= 1 then 1 else 0 end))*100/count(*) as installment_per from payments





SELECT 
    (COUNT(CASE WHEN payments.payment_type = 'installment' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_installments
FROM 
    payments;


select customer_state, count(customer_id) from customers group by customer_state



1. Calculate the number of orders per month in 2018.



2. Find the average number of products per order, grouped by customer city.

select * from order_it

-- Drop the view if it exists
DROP VIEW IF EXISTS product_count;

-- Create the view to calculate the count of products per order
CREATE VIEW product_count AS (
    SELECT 
        orders.order_id, 
        delivery.product_id, 
        COUNT(delivery.product_id) AS p_count 
    FROM 
        orders
    JOIN 
        delivery ON delivery.order_id = orders.order_id
    GROUP BY 
        orders.order_id, delivery.product_id
);

-- Calculate the average number of products per order, grouped by customer city
SELECT 
    customers.customer_city AS cus_city, 
    round(AVG(product_count.p_count),2) AS avg_products_per_order
FROM 
    customers
JOIN 
    orders ON orders.customer_id = customers.customer_id
JOIN 
    product_count ON orders.order_id = product_count.order_id
GROUP BY 
    cus_city
ORDER BY 
    avg_products_per_order DESC;


select * from product_count





2. Find the average number of products per order, grouped by customer city.
drop view if exists product_cc
create view product_cc as (select orders.order_id,delivery.product_id, count(delivery.product_id) as p_count from orders
join delivery on delivery.order_id = orders.order_id
group by orders.order_id,delivery.product_id)



select customers.customer_city,
round(avg(pc.p_count),2) as ord_per_pr from product_cc as pc
join orders on orders.order_id = pc.order_id
join customers on customers.customer_id = orders.customer_id
group by customers.customer_city
order by ord_per_pr desc




--3. Calculate the percentage of total revenue contributed by each product category.

-- 3. Find the total sales per category.

select UPPER(products.product_category) as category,
round((round(sum(payments.payment_value)::numeric,2)/(select sum(payment_value)
from payments))*100) as percentage_of_revenue
from products
join delivery on delivery.product_id = products.product_id
join payments on payments.order_id = delivery.order_id
group by category
order by percentage_of_revenue desc


-- 4. Identify the correlation between product price and the number of times a product has been purchased.

select order_item.price as price, count(products.product_id) as purchased_product from order_item
join products on products.product_id = order_item.product_id
group by order_item.price order by purchased_product desc limit 20














































































