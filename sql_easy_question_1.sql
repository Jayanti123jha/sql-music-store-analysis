Q1: Which countries have the most invoices?

SELECT invoice.billing_country, 
COUNT(invoice.total)
 AS total FROM invoice
 GROUP BY invoice.billing_country
ORDER BY total desc;


