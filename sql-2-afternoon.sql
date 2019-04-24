-- SELECT * FROM invoice
-- JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
-- WHERE invoice_line.unit_price > 0.99

-- SELECT i.invoice_date, c.first_name, c.last_name, i.total
-- FROM invoice i
-- JOIN customer c ON i.customer_id = c.customer_id

-- SELECT c.first_name, c.last_name, e.first_name, e.last_name
-- FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id

-- SELECT al.title, ar.name
-- FROM album al
-- JOIN artist ar ON al.artist_id = ar.artist_id

-- SELECT pt.track_id
-- FROM playlist_track pt
-- JOIN playlist p ON p.playlist_id = pt.playlist_id
-- WHERE p.name = 'Music'

-- SELECT t.name
-- FROM track t
-- JOIN playlist_track pt ON pt.track_id = t.track_id
-- WHERE pt.playlist_id = 5

-- SELECT t.name, p.name
-- FROM track t
-- JOIN playlist_track pt ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;

-- SELECT t.name, a.title
-- FROM track t
-- JOIN album a ON t.album_id = a.album_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Alternative & Punk';


-- SELECT * FROM invoice
-- WHERE invoice_id IN 
-- (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99)

-- SELECT *
-- FROM playlist_track
-- WHERE playlist_id IN 
-- (SELECT playlist_id FROM playlist WHERE name = 'Music')

-- SELECT name
-- FROM track
-- WHERE track_id IN 
-- (SELECT track_id FROM playlist_track WHERE playlist_id = 5)

-- SELECT *
-- FROM track
-- WHERE genre_id IN 
-- (SELECT genre_id FROM genre WHERE name = 'Comedy')

-- SELECT *
-- FROM track
-- WHERE album_id IN 
-- (SELECT album_id FROM album WHERE title = 'Fireball')

-- SELECT *
-- FROM track
-- WHERE album_id IN 
-- (SELECT album_id FROM album WHERE artist_id IN 
-- (SELECT artist_id FROM artist WHERE name = 'Queen')
-- )

-- UPDATE ROWS

-- UPDATE customer
-- SET fax = null
-- WHERE fax IS NOT null

-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS null

-- UPDATE customer 
-- SET last_name = 'Thompson' 
-- WHERE first_name = 'Julia' AND last_name = ‘Barnett'

-- UPDATE customer
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl’

-- UPDATE track
-- SET composer = 'The darkness around us'
-- WHERE genre_id = ( SELECT genre_id FROM genre WHERE name = 'Metal' )
-- AND composer IS null

-- GROUP BY


-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Pop' OR g.name = 'Rock'
-- GROUP BY g.name

-- SELECT ar.name, COUNT(*)
-- FROM album al
-- JOIN artist ar ON ar.artist_id = al.artist_id
-- GROUP BY ar.name

-- DISTINCT

-- SELECT DISTINCT composer
-- FROM track

-- SELECT DISTINCT billing_postal_code
-- FROM invoice

-- SELECT DISTINCT company
-- FROM customer

-- DELETE ROWS

-- CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

-- SELECT * FROM practice_delete;

-- DELETE 
-- FROM practice_delete 
-- WHERE type = ‘bronze'

-- DELETE 
-- FROM practice_delete 
-- WHERE type = ‘silver'

-- DELETE 
-- FROM practice_delete 
-- WHERE value = 150


-- —//—lame part that took 2 years postgres is stupid


-- -- CREATE TABLE users (
-- -- user_id serial PRIMARY KEY,
-- -- name varchar(50),
-- -- email varchar(50)
-- -- );

-- -- INSERT INTO users (name,email)
-- -- VALUES
-- -- ('Bryan', 'bryan@fmail.com'),
-- -- ('Mary', 'mary@fmail.com'),
-- -- ('Devon', 'devon@fmail.com')
 
-- -- SELECT * FROM users

-- -- CREATE TABLE products (
-- -- product_id serial PRIMARY KEY,
-- -- name varchar(50),
-- -- price integer
-- -- )

-- -- INSERT INTO products (name,price)
-- -- VALUES
-- -- ('Toyota 4 Runner TRD Pro', 45000),
-- -- ('Shoes', 50),
-- -- ('Airpods', 160)

-- -- SELECT * FROM products

-- -- CREATE TABLE orders (
-- --   order_id serial PRIMARY KEY,
-- --   order_state varchar(50),
-- --   product_id integer
-- --   )

-- -- INSERT INTO orders (order_state,product_id)
-- -- VALUES
-- -- ('Texas', 3),
-- -- ('Despair', 2),
-- -- ('Depression', 1)

-- -- SELECT * FROM orders

-- --GET ALL PRODUCTS FOR THE FIRST ORDER

-- -- SELECT orders.order_id, products.name
-- -- FROM orders
-- -- INNER JOIN products ON orders.product_id = product.product_id;

-- -- Get all orders

-- -- SELECT* FROM orders
-- -- INNER JOIN products ON orders.product_id = products.product_id;

-- -- Get the total cost of an order ( sum the price of all products on an order ).

-- -- SELECT sum(products.price)
-- -- FROM orders
-- -- INNER JOIN products ON orders = products.product_id
-- -- WHERE orders.order_id = 1;

-- -- Add a foreign key reference from orders to users.

-- -- ALTER TABLE orders ADD COLUMN user_id INT REFERENCES users(user_id);

-- -- Update the orders table to link a user to each order.

-- -- UPDATE orders
-- -- SET user_id = 1
-- -- where order_id = 3;

-- -- UPDATE orders
-- -- SET user_id = 2
-- -- where order_id = 2;

-- -- UPDATE orders
-- -- SET user_id = 3
-- -- where order_id = 1;

-- -- Get all orders for a user

-- -- SELECT orders.order_name
-- -- FROM orders
-- -- INNER JOIN users on orders.user_id = users.user_id
-- -- WHERE users.user_id = 1;

-- -- Get how many orders each user has

-- -- SELECT COUNT(orders.order_name)
-- -- FROM orders
-- -- INNER JOIN users on orders.user_id = users.user_id
-- -- GROUP BY users.name;
