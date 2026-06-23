
Q.4.Write a query to return the email, first name, last name, and Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email, starting with A.



SELECT DISTINCT 
customer.first_name, customer.last_name,
customer.email, genre.name as Rock_Music_listeners
from customer 

JOIN invoice 
on customer.customer_id = invoice.customer_id 

JOIN invoice_line
on  invoice.invoice_id = invoice_line.invoice_id 

JOIN track
on invoice_line.track_id = track.track_id 

JOIN genre
on track.genre_id = genre.genre_id 

WHERE genre.name = 'Rock'

ORDER BY customer.email asc;





 
