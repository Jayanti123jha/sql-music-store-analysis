Q3: Who is the best customer? The customer who has spent the most money will be declared the best customer.
Write a query to return the person who has spent the most money.


SELECT customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total_money_spend from customer
JOIN invoice on
invoice.customer_id = customer.customer_id
group by 
customer.customer_id, 
customer.first_name,
customer.last_name
order by total_money_spend desc
limit 1;