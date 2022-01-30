USE SAKILA;

SELECT Store.store_id, city.city, country.country
FROM sakila.store
INNER JOIN sakila.address
ON store.address_id = address.address_id
INNER JOIN sakila.city
ON address.city_id = city.city_id
INNER JOIN sakila.country
ON city.country_id = country.country_id;

select store.store_id, SUM(payment.amount) AS payment 
FROM sakila.store
INNER JOIN sakila.staff
ON store.store_id = staff.store_id
INNER JOIN sakila.payment 
ON staff.staff_id = payment.staff_id
GROUP BY store_id;

SELECT film.length, category.name
FROM sakila.film_category
INNER JOIN sakila.film
ON film_category.film_id = film.film_id
INNER JOIN sakila.category
ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY film.length DESC ;

SELECT film.title, COUNT(rental.rental_id) AS rented
FROM sakila.film
INNER JOIN sakila.inventory
ON film.film_id = inventory.film_id
INNER JOIN sakila.rental
ON inventory.inventory_id = rental.inventory_id
GROUP BY title
ORDER BY rented DESC;