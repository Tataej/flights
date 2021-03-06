--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2019-01-22 01:06:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 16570)
-- Name: aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aircrafts (
    aircraft_id smallint NOT NULL,
    aircraft_grade character varying(50),
    capacity smallint,
    year_issue smallint
);


ALTER TABLE aircrafts OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16568)
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aircrafts_aircraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aircrafts_aircraft_id_seq OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 191
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aircrafts_aircraft_id_seq OWNED BY aircrafts.aircraft_id;


--
-- TOC entry 183 (class 1259 OID 16468)
-- Name: airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE airlines (
    airline_name character(20) NOT NULL,
    year_of_foundation smallint,
    airline_id bigint NOT NULL,
    president_person_id smallint,
    adress_main_office_amo_id smallint
);


ALTER TABLE airlines OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16542)
-- Name: airlines_airline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE airlines_airline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE airlines_airline_id_seq OWNER TO postgres;

--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 187
-- Name: airlines_airline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE airlines_airline_id_seq OWNED BY airlines.airline_id;


--
-- TOC entry 188 (class 1259 OID 16554)
-- Name: amo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE amo (
    country_id bigint,
    city_id bigint,
    street character(20),
    house smallint,
    flat smallint,
    amo_id smallint NOT NULL,
    postcode integer
);


ALTER TABLE amo OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16629)
-- Name: amo_amo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE amo_amo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amo_amo_id_seq OWNER TO postgres;

--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 195
-- Name: amo_amo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE amo_amo_id_seq OWNED BY amo.amo_id;


--
-- TOC entry 182 (class 1259 OID 16423)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cities (
    city_name character varying(40),
    population integer,
    mayor_person_id character varying(300),
    country_id smallint NOT NULL,
    city_id smallint NOT NULL
);


ALTER TABLE cities OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16615)
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_city_id_seq OWNER TO postgres;

--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 194
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;


--
-- TOC entry 193 (class 1259 OID 16588)
-- Name: cities_coutry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_coutry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_coutry_id_seq OWNER TO postgres;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 193
-- Name: cities_coutry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_coutry_id_seq OWNED BY cities.country_id;


--
-- TOC entry 184 (class 1259 OID 16476)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    country_name character(30),
    country_id bigint NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16481)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_country_id_seq OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 185
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;


--
-- TOC entry 181 (class 1259 OID 16417)
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE flights (
    price numeric(11,2),
    flight_id bigint NOT NULL,
    aircraft_id smallint,
    departure_city_id smallint,
    arrival_city_id smallint,
    airline_id smallint,
    time_departure character(10),
    time_arrival character(10),
    flight_time character(10),
    flight_name character varying(60)
);


ALTER TABLE flights OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16523)
-- Name: flights_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flights_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flights_flight_id_seq OWNER TO postgres;

--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 186
-- Name: flights_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flights_flight_id_seq OWNED BY flights.flight_id;


--
-- TOC entry 190 (class 1259 OID 16562)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persons (
    person_id smallint NOT NULL,
    first_name character(20),
    middle_name character(20),
    last_name character(50)
);


ALTER TABLE persons OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16560)
-- Name: persons_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persons_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persons_person_id_seq OWNER TO postgres;

--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 189
-- Name: persons_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persons_person_id_seq OWNED BY persons.person_id;


--
-- TOC entry 2026 (class 2604 OID 16573)
-- Name: aircraft_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aircrafts ALTER COLUMN aircraft_id SET DEFAULT nextval('aircrafts_aircraft_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 16544)
-- Name: airline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY airlines ALTER COLUMN airline_id SET DEFAULT nextval('airlines_airline_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 16631)
-- Name: amo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amo ALTER COLUMN amo_id SET DEFAULT nextval('amo_amo_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 16590)
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN country_id SET DEFAULT nextval('cities_coutry_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 16617)
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 16483)
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 16525)
-- Name: flight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flights ALTER COLUMN flight_id SET DEFAULT nextval('flights_flight_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 16565)
-- Name: person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persons ALTER COLUMN person_id SET DEFAULT nextval('persons_person_id_seq'::regclass);


--
-- TOC entry 2166 (class 0 OID 16570)
-- Dependencies: 192
-- Data for Name: aircrafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aircrafts (aircraft_id, aircraft_grade, capacity, year_issue) FROM stdin;
1	Airbus 310	183	2001
2	ТУ-154	152	1998
3	Airbus 330	295	2006
4	Boeing 737-600	122	1997
5	Boeing 737-900ER	192	2008
\.


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 191
-- Name: aircrafts_aircraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aircrafts_aircraft_id_seq', 5, true);


--
-- TOC entry 2157 (class 0 OID 16468)
-- Dependencies: 183
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airlines (airline_name, year_of_foundation, airline_id, president_person_id, adress_main_office_amo_id) FROM stdin;
Ryanair             	2005	1	9	1
LOT                 	2004	5	13	5
Air Berlin          	1985	3	10	3
MAU                 	1993	4	12	4
Wizzair             	1995	2	11	2
\.


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 187
-- Name: airlines_airline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airlines_airline_id_seq', 5, true);


--
-- TOC entry 2162 (class 0 OID 16554)
-- Dependencies: 188
-- Data for Name: amo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY amo (country_id, city_id, street, house, flat, amo_id, postcode) FROM stdin;
5	7	Santa               	35	6	1	22874
2	3	Gorna               	29	432	2	43152
3	8	Westriver           	24	1	3	31035
1	1	Golovna             	177	37	4	11008
4	5	Maevska             	79	21	5	53129
\.


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 195
-- Name: amo_amo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('amo_amo_id_seq', 5, true);


--
-- TOC entry 2156 (class 0 OID 16423)
-- Dependencies: 182
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (city_name, population, mayor_person_id, country_id, city_id) FROM stdin;
Kyiv	3000000	1	1	1
Chernivtsi	250000	2	1	2
Sofia	1500000	3	2	3
Varna	900000	4	2	4
Helsinki	900000	14	5	7
Krakow	850000	15	4	5
Berlin	1500000	17	3	8
Munich	2700000	16	3	6
\.


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 194
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_city_id_seq', 9, true);


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 193
-- Name: cities_coutry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_coutry_id_seq', 4, true);


--
-- TOC entry 2158 (class 0 OID 16476)
-- Dependencies: 184
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (country_name, country_id) FROM stdin;
Ukraine                       	1
Bulgaria                      	2
Germany                       	3
Poland                        	4
Finland                       	5
\.


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 185
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_country_id_seq', 6, true);


--
-- TOC entry 2155 (class 0 OID 16417)
-- Dependencies: 181
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flights (price, flight_id, aircraft_id, departure_city_id, arrival_city_id, airline_id, time_departure, time_arrival, flight_time, flight_name) FROM stdin;
2980.00	5	1	8	3	1	15:55     	19:10     	2:30      	136 TXL-SOF
3052.00	3	5	1	8	4	13:20     	14:30     	2:10      	374 KBP-TXL
3074.00	4	5	8	1	4	15:20     	18:30     	2:10      	375 TXL-KBP
6537.00	6	5	3	8	1	21:45     	23:15     	2:30      	137 SOF-TXL
3176.00	7	5	6	8	3	14:10     	15:15     	1:05      	781 MUC-TXL
2719.00	8	5	8	6	3	10:00     	11:05     	1:05      	782 TXL-MUC
3478.00	9	3	5	7	1	12:25     	15:35     	2:10      	435 KRK-HEL
6815.00	10	3	7	5	1	10:25     	13:15     	1:50      	436 HEL-KRK
1631.00	11	4	4	3	2	8:35      	9:25      	0:50      	263 VAR-SOF
1631.00	12	4	3	4	2	16:20     	17:10     	0:50      	264 SOF-VAR
4678.00	13	1	4	7	1	11:45     	14:40     	2:55      	197 VAR-HEL
4726.00	14	1	7	4	1	17:40     	20:40     	3:00      	198 HEL-VAR
5074.00	15	3	5	3	5	7:15      	10:50     	2:35      	301 KRK-SOF
4873.00	16	3	3	5	5	12:50     	15:25     	2:35      	302 SOF-KRK
4565.00	17	4	6	5	5	22:05     	23:20     	1:15      	274 MUC-KRK
3893.00	18	4	5	6	5	6:00      	7:15      	1:15      	275 KRK-MUC
3373.00	19	1	3	1	2	4:10      	7:40      	2:30      	154 SOF-KBP
5336.00	20	1	1	3	2	20:35     	22:15     	2:40      	155 KBP-SOF
7643.00	21	5	6	4	3	10:05     	12:50     	1:45      	283 MUC-VAR
6756.00	22	5	4	6	3	19:40     	21:35     	1:55      	284 VAR-MUC
1700.00	1	2	2	1	4	7:30      	8:45      	1:15      	298 CWC-KBP
1680.00	2	2	1	2	4	19:45     	21:00     	1:15      	299 KBP-CWC
\.


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 186
-- Name: flights_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flights_flight_id_seq', 23, true);


--
-- TOC entry 2164 (class 0 OID 16562)
-- Dependencies: 190
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persons (person_id, first_name, middle_name, last_name) FROM stdin;
1	Petro               	Petrovych           	Petrov                                            
3	Ivan                	Ivanovych           	Ivanov                                            
4	Sergii              	Sergievyh           	Sergienko                                         
2	Taras               	Tarasovych          	Tarasov                                           
8	Mykhailo            	Oleksievych         	Kot                                               
9	Maksym              	Petrovych           	Kajan                                             
10	Oleg                	Vasyliovych         	Tsemko                                            
11	Andirii             	Omelianovych        	Voronko                                           
12	Oleksii             	Ivanovych           	Marko                                             
13	Denys               	Vasyliovych         	Shpak                                             
14	Elisa               	Olegivna            	Kosenko                                           
15	Evgen               	Dmytrovych          	Nalyvaiko                                         
16	Iryna               	Viktorivna          	Sontseva                                          
17	Mykola              	Antonovych          	Solovei                                           
\.


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 189
-- Name: persons_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persons_person_id_seq', 17, true);


--
-- TOC entry 2040 (class 2606 OID 16575)
-- Name: aircraft-primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aircrafts
    ADD CONSTRAINT "aircraft-primary_key" PRIMARY KEY (aircraft_id);


--
-- TOC entry 2032 (class 2606 OID 16624)
-- Name: airline_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airline_primary_key PRIMARY KEY (airline_id);


--
-- TOC entry 2036 (class 2606 OID 16636)
-- Name: amo_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amo
    ADD CONSTRAINT amo_primary_key PRIMARY KEY (amo_id);


--
-- TOC entry 2030 (class 2606 OID 16622)
-- Name: city_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT city_primary_key PRIMARY KEY (city_id);


--
-- TOC entry 2034 (class 2606 OID 16488)
-- Name: contry_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT contry_primary_key PRIMARY KEY (country_id);


--
-- TOC entry 2028 (class 2606 OID 16533)
-- Name: flight_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flight_primary_key PRIMARY KEY (flight_id);


--
-- TOC entry 2038 (class 2606 OID 16567)
-- Name: person_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT person_primary_key PRIMARY KEY (person_id);


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-01-22 01:06:17

--
-- PostgreSQL database dump complete
--

