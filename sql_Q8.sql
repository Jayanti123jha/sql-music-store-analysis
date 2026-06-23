Q.8.Write a query that determines the customer that has spent the most 
on music for each country. Write a query that returns the country
along with the top customer and how much they spent. For countries
where the top amount spent is shared, provide all customers with that amount.



WITH customer_spend AS (
    SELECT
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        customer.country,
        SUM(invoice.total) AS total_spent,
        RANK() OVER (
            PARTITION BY customer.country
            ORDER BY SUM(invoice.total) DESC
        ) AS rank_no
    FROM customer
    JOIN invoice
        ON customer.customer_id = invoice.customer_id
    GROUP BY
        customer.country,
        customer.customer_id,
        customer.first_name,
        customer.last_name
)

SELECT
    country,
    first_name,
    last_name,
    total_spent
FROM customer_spend
WHERE rank_no = 1
ORDER BY country;
