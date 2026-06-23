Q.7.We want to find out the most popular music Genre for each country. 
We determine the most popular genre as the genre with the highest amount
of purchases. Write a query that returns each country along with the top
Genre. For countries where the maximum number of purchases is shared, return all Genres.


music country genre hight amount 

WITH popular_genre AS (
    SELECT
        customer.country,
        genre.name AS genre_name,
        COUNT(invoice_line.quantity) AS purchases,
        RANK() OVER (
            PARTITION BY customer.country
            ORDER BY COUNT(invoice_line.quantity) DESC
        ) AS rank_no
    FROM invoice_line
    JOIN invoice
        ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer
        ON customer.customer_id = invoice.customer_id
    JOIN track
        ON track.track_id = invoice_line.track_id
    JOIN genre
        ON genre.genre_id = track.genre_id
    GROUP BY
        customer.country,
        genre.name
)

SELECT
    country,
    genre_name,
    purchases
FROM popular_genre
WHERE rank_no = 1
ORDER BY country;
