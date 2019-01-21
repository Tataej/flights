--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2019-01-21 17:16:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2159 (class 1262 OID 16416)
-- Name: fms_db; Type: DATABASE; Schema: -; Owner: Teiana Chuchko
--

CREATE DATABASE fms_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE fms_db OWNER TO "Teiana Chuchko";

\connect fms_db

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
-- TOC entry 2162 (class 0 OID 0)
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
-- TOC entry 2163 (class 0 OID 0)
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
-- TOC entry 2164 (class 0 OID 0)
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
-- TOC entry 2165 (class 0 OID 0)
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
-- TOC entry 2166 (class 0 OID 0)
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
-- TOC entry 2167 (class 0 OID 0)
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
-- TOC entry 2168 (class 0 OID 0)
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
-- TOC entry 2169 (class 0 OID 0)
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
-- TOC entry 2170 (class 0 OID 0)
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
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-01-21 17:16:24

--
-- PostgreSQL database dump complete
--

