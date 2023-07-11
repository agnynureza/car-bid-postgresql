CREATE DATABASE car_bid;

CREATE TABLE cities(
	city_id INT not NULL PRIMARY KEY,
 	city_name VARCHAR(100) not NULL,
 	latitude float not NULL,
  	longitude float not NULL,
  	created_at DATE 
);

CREATE TABLE car_products(
	product_id INT NOT NULL PRIMARY KEY,
 	model VARCHAR(100) not NULL,
 	body_type varchar(200) not NULL,
 	brand varchar(100) not NULL,
 	price int not NULL,
  	year varchar(100),
  	created_at DATE
);

CREATE TABLE users(
	user_id INT NOT NULL PRIMARY KEY,
 	fullname VARCHAR(200) not NULL,
 	phone_number VARCHAR(100) not NULL,
  	city_id INT not NULL,
  	created_at DATE,
  	FOREIGN KEY (city_id) REFERENCES cities(city_id)
);


CREATE TABLE advertisements(
	advertisement_id INT NOT NULL PRIMARY KEY,
 	title VARCHAR(200) not NULL,
 	detail_information TEXT,
  	bid_active boolean,
 	user_id INT not NULL,
  	product_id INT not NULL,
  	created_at DATE,
  	FOREIGN KEY (product_id) REFERENCES car_products(product_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE bid (
	bid_id INT NOT NULL PRIMARY KEY,
 	bid_status VARCHAR(100) not NULL,
 	bid_price INT not NULL,
  	user_id INT not NULL,
  	advertisement_id INT not NULL,
  	created_at DATE,
  	FOREIGN KEY (advertisement_id) REFERENCES advertisements(advertisement_id),
  	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

