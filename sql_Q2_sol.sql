Q2: Which city has the best customers? We would like to throw a promotional
Music Festival in the city where we made the most money. Write a query that
returns one city that has the highest sum of invoice totals. Return both the
city name and the sum of all invoice totals.


select billing_city,
SUM(invoice.total) as invoice_total from invoice
group by billing_city
order by invoice_total desc;
