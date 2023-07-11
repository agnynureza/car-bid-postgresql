-- no.1
select cp.model, count(b.product_id) as count_product, count(b.bid_id) as count_bid from bid b
join car_products cp on cp.product_id = b.product_id
group by cp.model

-- no.2
create temporary table car_cities as
 select c.city_name,cp.brand , cp.model, cp."year" , cp.price from advertisements a 
 join users u on a.user_id = u.user_id
 join cities c on c.city_id = u.city_id
 join car_products cp on cp.product_id = a.product_id;
 
select city_name, price,
	AVG(price) over (partition by city_name order by price desc
	range between unbounded preceding and current row) as avg_price
from car_cities;
 
-- no.3
select 
	cp.model,
	b.user_id,
	first_value(b.created_at) over(partition by b.user_id) as first_bid_date,
	lead(b.created_at) OVER(PARTITION BY b.user_id) AS next_bid_date,
	first_value(b.bid_price) over(partition by b.user_id) as first_bid_price,
	lead(b.bid_price) OVER(PARTITION BY b.user_id) AS next_bid_price
from bid b
join car_products cp on cp.product_id = b.product_id
where cp.model = 'Toyota Yaris';

select * from bid b2 
-- no.4
select 
	cp.model,
	avg(cp.price) as avg_price,
	avg(b.bid_price) as avg_bid_6_month,
	avg(cp.price) - avg(b.bid_price) as difference,
	((avg(cp.price) - avg(b.bid_price)) / avg(cp.price))::float * 100 AS difference_percent
from 
	bid b 
join 
	car_products cp on cp.product_id = b.product_id
where
	b.created_at >= current_timestamp  - interval '6 months'
group by
	cp.model

--no 5
WITH yaris AS (	
	select
		cp.brand,
		cp.model,
		b.created_at,
		b.bid_price
   from bid b
   join car_products cp on cp.product_id = b.bid_id   
   where cp.model = 'Toyota Yaris'
) select
	brand,
	model,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '6 months') AS m_min_6,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '5 months') AS m_min_5,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '4 months') AS m_min_4,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '3 months') AS m_min_3,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '2 months') AS m_min_2,
		(select AVG(bid_price) from yaris 
                WHERE created_at >= CURRENT_TIMESTAMP - interval '1 months') AS m_min_1 
from 
	yaris
group by brand, model;