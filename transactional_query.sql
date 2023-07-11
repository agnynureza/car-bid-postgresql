-- Transactional Query --
-- no.1
select product_id , brand, model, year, price from car_products cp where year >= '2015'

--no. 2
select product_id, user_id as buyer_id, created_at as date_bid, bid_price, bid_status from bid;
INSERT INTO bid(product_id, user_id, created_at, bid_price, bid_status, bid_id)
VALUES (50, 2, '2023-07-10', 185500000, 'Sent', 3);
select product_id, user_id as buyer_id, created_at as date_bid, bid_price, bid_status from bid;

--no.3
--seller name = 'reza'
select a.product_id , cp.brand, cp.model, cp."year" , cp.price, a.created_at as date_post from advertisements a
join users u on u.user_id = a.user_id 
join car_products cp on cp.product_id = a.product_id 
where u.fullname = 'reza'

--no.4
-- advertisement only dummy 2 data
select cp.product_id , cp.brand , cp.model , cp."year" , cp.price  from advertisements a 
join car_products cp on cp.product_id = a.product_id
where cp.model  like '%Yaris%'
order by cp.price asc

--no.5 
--formula haversine
 CREATE FUNCTION haversine_distance(point_a POINT, point_b POINT)
    RETURNS float 
    LANGUAGE plpgsql
    
    AS 
    $$
    DECLARE
        lon_a float := radians(point_a[0]);
        lat_a float := radians(point_a[1]);
        lon_b float := radians(point_b[0]);
        lat_b float := radians(point_b[1]);
	
        d_lon float := lon_b - lon_a;
        d_lat float := lat_b - lat_a;
        a float;
        c float;
        r float := 6371;
        jarak float;
    BEGIN
        -- haversine formula
        a := sin(d_lat/2)^2 + cos(lat_a) * cos(lat_b) * sin(d_lon/2)^2;
        c := 2 * asin(sqrt(a));
        jarak := r * c;
        
        RETURN jarak;
    END
    $$