--
-- PostgreSQL database dump
--

-- Dumped from database version 11.20
-- Dumped by pg_dump version 11.19

-- Started on 2023-07-10 22:51:03 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 388669)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 388973)
-- Name: advertisements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advertisements (
    advertisement_id integer NOT NULL,
    title character varying(200) NOT NULL,
    detail_information text,
    bid_active boolean,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    created_at date
);


ALTER TABLE public.advertisements OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 388991)
-- Name: bid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bid (
    bid_id integer NOT NULL,
    bid_status character varying(100) NOT NULL,
    bid_price integer NOT NULL,
    user_id integer NOT NULL,
    advertisement_id integer NOT NULL,
    created_at date
);


ALTER TABLE public.bid OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 388955)
-- Name: car_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_products (
    product_id integer NOT NULL,
    model character varying(100) NOT NULL,
    body_type character varying(200) NOT NULL,
    brand character varying(100) NOT NULL,
    price integer NOT NULL,
    year character varying(100),
    created_at date
);


ALTER TABLE public.car_products OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 388950)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(100) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    created_at date
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 388963)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    fullname character varying(200) NOT NULL,
    phone_number character varying(100) NOT NULL,
    city_id integer NOT NULL,
    created_at date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3265 (class 0 OID 388973)
-- Dependencies: 199
-- Data for Name: advertisements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advertisements (advertisement_id, title, detail_information, bid_active, user_id, product_id, created_at) FROM stdin;
1	dijual mobil murah	mobil lagi BU	t	1	1	2023-07-10
2	dijual mobil murah	mobil lagi BU	t	1	2	2023-07-10
\.


--
-- TOC entry 3266 (class 0 OID 388991)
-- Dependencies: 200
-- Data for Name: bid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bid (bid_id, bid_status, bid_price, user_id, advertisement_id, created_at) FROM stdin;
1	Sent	1000000	1	1	2023-07-10
2	Sent	2500000	3	2	2023-07-10
\.


--
-- TOC entry 3263 (class 0 OID 388955)
-- Dependencies: 197
-- Data for Name: car_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_products (product_id, model, body_type, brand, price, year, created_at) FROM stdin;
1	Toyota Yaris	Hatchback	Toyota	175000000	2016	2023-07-10
2	Toyota Yaris	Hatchback	Toyota	215000000	2018	2023-07-10
3	Toyota Yaris	Hatchback	Toyota	162000000	2014	2023-07-10
4	Toyota Yaris	Hatchback	Toyota	220000000	2020	2023-07-10
5	Toyota Yaris	Hatchback	Toyota	124000000	2012	2023-07-10
6	Toyota Agya	Hatchback	Toyota	114000000	2019	2023-07-10
7	Toyota Agya	Hatchback	Toyota	97000000	2014	2023-07-10
8	Toyota Agya	Hatchback	Toyota	110000000	2016	2023-07-10
9	Toyota Agya	Hatchback	Toyota	155500000	2022	2023-07-10
10	Toyota Agya	Hatchback	Toyota	115500000	2017	2023-07-10
11	Toyota Calya	Wagon	Toyota	130000000	2019	2023-07-10
12	Toyota Calya	Wagon	Toyota	137000000	2019	2023-07-10
13	Toyota Calya	Wagon	Toyota	115500000	2017	2023-07-10
14	Toyota Calya	Wagon	Toyota	104000000	2016	2023-07-10
15	Toyota Calya	Wagon	Toyota	107000000	2016	2023-07-10
16	Daihatsu Ayla	Hatchback	Daihatsu	83000000	2016	2023-07-10
17	Daihatsu Ayla	Hatchback	Daihatsu	120000000	2019	2023-07-10
18	Daihatsu Ayla	Hatchback	Daihatsu	96000000	2015	2023-07-10
19	Daihatsu Ayla	Hatchback	Daihatsu	115000000	2017	2023-07-10
20	Daihatsu Ayla	Hatchback	Daihatsu	113000000	2017	2023-07-10
21	Daihatsu Terios	SUV	Daihatsu	190000000	2018	2023-07-10
22	Daihatsu Terios	SUV	Daihatsu	223000000	2022	2023-07-10
23	Daihatsu Terios	SUV	Daihatsu	189900000	2019	2023-07-10
24	Daihatsu Terios	SUV	Daihatsu	166000000	2017	2023-07-10
25	Daihatsu Terios	SUV	Daihatsu	201000000	2018	2023-07-10
26	Daihatsu Xenia	MPV	Daihatsu	170000000	2019	2023-07-10
27	Daihatsu Xenia	MPV	Daihatsu	220500000	2022	2023-07-10
28	Daihatsu Xenia	MPV	Daihatsu	135000000	2017	2023-07-10
29	Daihatsu Xenia	MPV	Daihatsu	100000000	2014	2023-07-10
30	Daihatsu Xenia	MPV	Daihatsu	159000000	2018	2023-07-10
31	Honda Jazz	Hatchback	Honda	236000000	2018	2023-07-10
32	Honda Jazz	Hatchback	Honda	250000000	2019	2023-07-10
33	Honda Jazz	Hatchback	Honda	216000000	2018	2023-07-10
34	Honda Jazz	Hatchback	Honda	192000000	2015	2023-07-10
35	Honda Jazz	Hatchback	Honda	178000000	2013	2023-07-10
36	Honda CR-V	SUV	Honda	415000000	2018	2023-07-10
37	Honda CR-V	SUV	Honda	345000000	2017	2023-07-10
38	Honda CR-V	SUV	Honda	116000000	2009	2023-07-10
39	Honda CR-V	SUV	Honda	269000000	2016	2023-07-10
40	Honda CR-V	SUV	Honda	398500000	2018	2023-07-10
41	Honda Civic	Hatchback	Honda	350000000	2018	2023-07-10
42	Honda Civic	Sedan	Honda	165000000	2010	2023-07-10
43	Honda Civic	Sedan	Honda	186000000	2013	2023-07-10
44	Honda Civic	Sedan	Honda	179000000	2013	2023-07-10
45	Honda Civic	Hatchback	Honda	397500000	2019	2023-07-10
46	Suzuki Ertiga	MPV	Suzuki	125000000	2015	2023-07-10
47	Suzuki Ertiga	MPV	Suzuki	178000000	2018	2023-07-10
48	Suzuki Ertiga	MPV	Suzuki	168000000	2016	2023-07-10
49	Suzuki Ertiga	MPV	Suzuki	100000000	2012	2023-07-10
50	Suzuki Ertiga	MPV	Suzuki	167000000	2018	2023-07-10
\.


--
-- TOC entry 3262 (class 0 OID 388950)
-- Dependencies: 196
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (city_id, city_name, latitude, longitude, created_at) FROM stdin;
3171	Kota Jakarta Pusat	-6.18648600000000037	106.834091000000001	2023-07-10
3172	Kota Jakarta Utara	-6.12143499999999996	106.774124	2023-07-10
3173	Kota Jakarta Barat	-6.13520000000000021	106.813300999999996	2023-07-10
3174	Kota Jakarta Selatan	-6.30064099999999971	106.814094999999995	2023-07-10
3175	Kota Jakarta Timur	-6.26445100000000021	106.895859000000002	2023-07-10
3573	Kota Malang	-7.9818939999999996	112.626503	2023-07-10
3578	Kota Surabaya	-7.28916599999999981	112.734397999999999	2023-07-10
3471	Kota Yogyakarta	-7.79722399999999993	110.368797000000001	2023-07-10
3273	Kota Bandung	-6.91474440000000001	107.609811100000002	2023-07-10
1371	Kota Padang	-0.949999999999999956	100.353055600000005	2023-07-10
1375	Kota Bukittinggi	-0.305555599999999983	100.369166699999994	2023-07-10
6471	Kota Balikpapan	-1.26353889999999991	116.827883299999996	2023-07-10
6472	Kota Samarinda	-0.502183000000000046	117.153801000000001	2023-07-10
7371	Kota Makassar	-5.13333330000000032	119.416666699999993	2023-07-10
5171	Kota Denpasar	-8.65629000000000026	115.222099	2023-07-10
\.


--
-- TOC entry 3264 (class 0 OID 388963)
-- Dependencies: 198
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, fullname, phone_number, city_id, created_at) FROM stdin;
1	reza	0899999	3171	2023-07-10
2	jamil	08777777	3172	2023-07-10
3	rahma	08329327	3173	2023-07-10
\.


--
-- TOC entry 3133 (class 2606 OID 388980)
-- Name: advertisements advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_pkey PRIMARY KEY (advertisement_id);


--
-- TOC entry 3135 (class 2606 OID 388995)
-- Name: bid bid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (bid_id);


--
-- TOC entry 3129 (class 2606 OID 388962)
-- Name: car_products car_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_products
    ADD CONSTRAINT car_products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3127 (class 2606 OID 388954)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 3131 (class 2606 OID 388967)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3137 (class 2606 OID 388981)
-- Name: advertisements advertisements_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.car_products(product_id);


--
-- TOC entry 3138 (class 2606 OID 388986)
-- Name: advertisements advertisements_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3139 (class 2606 OID 388996)
-- Name: bid bid_advertisement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_advertisement_id_fkey FOREIGN KEY (advertisement_id) REFERENCES public.advertisements(advertisement_id);


--
-- TOC entry 3140 (class 2606 OID 389001)
-- Name: bid bid_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3136 (class 2606 OID 388968)
-- Name: users users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


-- Completed on 2023-07-10 22:51:03 WIB

--
-- PostgreSQL database dump complete
--

