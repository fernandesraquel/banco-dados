CREATE TABLE products (
 	id INTEGER NOT NULL,
 	name varchar(100) NOT NULL,
  	amount INTEGER DEFAULT NULL,
  	price INTEGER DEFAULT NULL,
 	PRIMARY KEY (id)	
);

# Carga inicial

insert into products
(id, name, amount, price)
values (1, 'Two-door wardrobe', 100, 80);

insert into products
(id, name, amount, price)
values (2, 'Dining table', 1000, 560);

insert into products
(id, name, amount, price)
values (3, 'Towel holder', 10000, 5.50);

insert into products
(id, name, amount, price)
values (4, 'Computer desk', 350, 100);

insert into products
(id, name, amount, price)
values (5, 'Chair', 3000, 210.64);

insert into products
(id, name, amount, price)
values (6, 'Single bed', 750, 99);

/*SELECT id, name FROM products 
WHERE price < 10 OR price > 100*/