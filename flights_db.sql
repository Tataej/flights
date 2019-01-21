PGDMP     6                      w            fms_db    9.5.3    9.5.3 =    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ~           1262    16416    fms_db    DATABASE     �   CREATE DATABASE fms_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE fms_db;
             Teiana Chuchko    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16570 	   aircrafts    TABLE     �   CREATE TABLE aircrafts (
    aircraft_id smallint NOT NULL,
    aircraft_grade character varying(50),
    capacity smallint,
    year_issue smallint
);
    DROP TABLE public.aircrafts;
       public         postgres    false    6            �            1259    16568    aircrafts_aircraft_id_seq    SEQUENCE     {   CREATE SEQUENCE aircrafts_aircraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.aircrafts_aircraft_id_seq;
       public       postgres    false    6    192            �           0    0    aircrafts_aircraft_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE aircrafts_aircraft_id_seq OWNED BY aircrafts.aircraft_id;
            public       postgres    false    191            �            1259    16468    airlines    TABLE     �   CREATE TABLE airlines (
    airline_name character(20) NOT NULL,
    year_of_foundation smallint,
    airline_id bigint NOT NULL,
    president_person_id smallint,
    adress_main_office_amo_id smallint
);
    DROP TABLE public.airlines;
       public         postgres    false    6            �            1259    16542    airlines_airline_id_seq    SEQUENCE     y   CREATE SEQUENCE airlines_airline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.airlines_airline_id_seq;
       public       postgres    false    6    183            �           0    0    airlines_airline_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE airlines_airline_id_seq OWNED BY airlines.airline_id;
            public       postgres    false    187            �            1259    16554    amo    TABLE     �   CREATE TABLE amo (
    country_id bigint,
    city_id bigint,
    street character(20),
    house smallint,
    flat smallint,
    amo_id smallint NOT NULL,
    postcode integer
);
    DROP TABLE public.amo;
       public         postgres    false    6            �            1259    16629    amo_amo_id_seq    SEQUENCE     p   CREATE SEQUENCE amo_amo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.amo_amo_id_seq;
       public       postgres    false    6    188            �           0    0    amo_amo_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE amo_amo_id_seq OWNED BY amo.amo_id;
            public       postgres    false    195            �            1259    16423    cities    TABLE     �   CREATE TABLE cities (
    city_name character varying(40),
    population integer,
    mayor_person_id character varying(300),
    country_id smallint NOT NULL,
    city_id smallint NOT NULL
);
    DROP TABLE public.cities;
       public         postgres    false    6            �            1259    16615    cities_city_id_seq    SEQUENCE     t   CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cities_city_id_seq;
       public       postgres    false    6    182            �           0    0    cities_city_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;
            public       postgres    false    194            �            1259    16588    cities_coutry_id_seq    SEQUENCE     v   CREATE SEQUENCE cities_coutry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.cities_coutry_id_seq;
       public       postgres    false    182    6            �           0    0    cities_coutry_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE cities_coutry_id_seq OWNED BY cities.country_id;
            public       postgres    false    193            �            1259    16476 	   countries    TABLE     [   CREATE TABLE countries (
    country_name character(30),
    country_id bigint NOT NULL
);
    DROP TABLE public.countries;
       public         postgres    false    6            �            1259    16481    countries_country_id_seq    SEQUENCE     z   CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.countries_country_id_seq;
       public       postgres    false    184    6            �           0    0    countries_country_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;
            public       postgres    false    185            �            1259    16417    flights    TABLE     J  CREATE TABLE flights (
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
    DROP TABLE public.flights;
       public         postgres    false    6            �            1259    16523    flights_flight_id_seq    SEQUENCE     w   CREATE SEQUENCE flights_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.flights_flight_id_seq;
       public       postgres    false    6    181            �           0    0    flights_flight_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE flights_flight_id_seq OWNED BY flights.flight_id;
            public       postgres    false    186            �            1259    16562    persons    TABLE     �   CREATE TABLE persons (
    person_id smallint NOT NULL,
    first_name character(20),
    middle_name character(20),
    last_name character(50)
);
    DROP TABLE public.persons;
       public         postgres    false    6            �            1259    16560    persons_person_id_seq    SEQUENCE     w   CREATE SEQUENCE persons_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.persons_person_id_seq;
       public       postgres    false    190    6            �           0    0    persons_person_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE persons_person_id_seq OWNED BY persons.person_id;
            public       postgres    false    189            �           2604    16573    aircraft_id    DEFAULT     p   ALTER TABLE ONLY aircrafts ALTER COLUMN aircraft_id SET DEFAULT nextval('aircrafts_aircraft_id_seq'::regclass);
 D   ALTER TABLE public.aircrafts ALTER COLUMN aircraft_id DROP DEFAULT;
       public       postgres    false    192    191    192            �           2604    16544 
   airline_id    DEFAULT     l   ALTER TABLE ONLY airlines ALTER COLUMN airline_id SET DEFAULT nextval('airlines_airline_id_seq'::regclass);
 B   ALTER TABLE public.airlines ALTER COLUMN airline_id DROP DEFAULT;
       public       postgres    false    187    183            �           2604    16631    amo_id    DEFAULT     Z   ALTER TABLE ONLY amo ALTER COLUMN amo_id SET DEFAULT nextval('amo_amo_id_seq'::regclass);
 9   ALTER TABLE public.amo ALTER COLUMN amo_id DROP DEFAULT;
       public       postgres    false    195    188            �           2604    16590 
   country_id    DEFAULT     g   ALTER TABLE ONLY cities ALTER COLUMN country_id SET DEFAULT nextval('cities_coutry_id_seq'::regclass);
 @   ALTER TABLE public.cities ALTER COLUMN country_id DROP DEFAULT;
       public       postgres    false    193    182            �           2604    16617    city_id    DEFAULT     b   ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public       postgres    false    194    182            �           2604    16483 
   country_id    DEFAULT     n   ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public       postgres    false    185    184            �           2604    16525 	   flight_id    DEFAULT     h   ALTER TABLE ONLY flights ALTER COLUMN flight_id SET DEFAULT nextval('flights_flight_id_seq'::regclass);
 @   ALTER TABLE public.flights ALTER COLUMN flight_id DROP DEFAULT;
       public       postgres    false    186    181            �           2604    16565 	   person_id    DEFAULT     h   ALTER TABLE ONLY persons ALTER COLUMN person_id SET DEFAULT nextval('persons_person_id_seq'::regclass);
 @   ALTER TABLE public.persons ALTER COLUMN person_id DROP DEFAULT;
       public       postgres    false    190    189    190            v          0    16570 	   aircrafts 
   TABLE DATA               O   COPY aircrafts (aircraft_id, aircraft_grade, capacity, year_issue) FROM stdin;
    public       postgres    false    192   z?       �           0    0    aircrafts_aircraft_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('aircrafts_aircraft_id_seq', 5, true);
            public       postgres    false    191            m          0    16468    airlines 
   TABLE DATA               y   COPY airlines (airline_name, year_of_foundation, airline_id, president_person_id, adress_main_office_amo_id) FROM stdin;
    public       postgres    false    183   �?       �           0    0    airlines_airline_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('airlines_airline_id_seq', 5, true);
            public       postgres    false    187            r          0    16554    amo 
   TABLE DATA               R   COPY amo (country_id, city_id, street, house, flat, amo_id, postcode) FROM stdin;
    public       postgres    false    188   k@       �           0    0    amo_amo_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('amo_amo_id_seq', 5, true);
            public       postgres    false    195            l          0    16423    cities 
   TABLE DATA               V   COPY cities (city_name, population, mayor_person_id, country_id, city_id) FROM stdin;
    public       postgres    false    182   �@       �           0    0    cities_city_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('cities_city_id_seq', 8, true);
            public       postgres    false    194            �           0    0    cities_coutry_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('cities_coutry_id_seq', 4, true);
            public       postgres    false    193            n          0    16476 	   countries 
   TABLE DATA               6   COPY countries (country_name, country_id) FROM stdin;
    public       postgres    false    184   �A       �           0    0    countries_country_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('countries_country_id_seq', 5, true);
            public       postgres    false    185            k          0    16417    flights 
   TABLE DATA               �   COPY flights (price, flight_id, aircraft_id, departure_city_id, arrival_city_id, airline_id, time_departure, time_arrival, flight_time, flight_name) FROM stdin;
    public       postgres    false    181   �A       �           0    0    flights_flight_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('flights_flight_id_seq', 22, true);
            public       postgres    false    186            t          0    16562    persons 
   TABLE DATA               I   COPY persons (person_id, first_name, middle_name, last_name) FROM stdin;
    public       postgres    false    190   D       �           0    0    persons_person_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('persons_person_id_seq', 17, true);
            public       postgres    false    189            �           2606    16575    aircraft-primary_key 
   CONSTRAINT     `   ALTER TABLE ONLY aircrafts
    ADD CONSTRAINT "aircraft-primary_key" PRIMARY KEY (aircraft_id);
 J   ALTER TABLE ONLY public.aircrafts DROP CONSTRAINT "aircraft-primary_key";
       public         postgres    false    192    192            �           2606    16624    airline_primary_key 
   CONSTRAINT     [   ALTER TABLE ONLY airlines
    ADD CONSTRAINT airline_primary_key PRIMARY KEY (airline_id);
 F   ALTER TABLE ONLY public.airlines DROP CONSTRAINT airline_primary_key;
       public         postgres    false    183    183            �           2606    16636    amo_primary_key 
   CONSTRAINT     N   ALTER TABLE ONLY amo
    ADD CONSTRAINT amo_primary_key PRIMARY KEY (amo_id);
 =   ALTER TABLE ONLY public.amo DROP CONSTRAINT amo_primary_key;
       public         postgres    false    188    188            �           2606    16622    city_primary_key 
   CONSTRAINT     S   ALTER TABLE ONLY cities
    ADD CONSTRAINT city_primary_key PRIMARY KEY (city_id);
 A   ALTER TABLE ONLY public.cities DROP CONSTRAINT city_primary_key;
       public         postgres    false    182    182            �           2606    16488    contry_primary_key 
   CONSTRAINT     [   ALTER TABLE ONLY countries
    ADD CONSTRAINT contry_primary_key PRIMARY KEY (country_id);
 F   ALTER TABLE ONLY public.countries DROP CONSTRAINT contry_primary_key;
       public         postgres    false    184    184            �           2606    16533    flight_primary_key 
   CONSTRAINT     X   ALTER TABLE ONLY flights
    ADD CONSTRAINT flight_primary_key PRIMARY KEY (flight_id);
 D   ALTER TABLE ONLY public.flights DROP CONSTRAINT flight_primary_key;
       public         postgres    false    181    181            �           2606    16567    person_primary_key 
   CONSTRAINT     X   ALTER TABLE ONLY persons
    ADD CONSTRAINT person_primary_key PRIMARY KEY (person_id);
 D   ALTER TABLE ONLY public.persons DROP CONSTRAINT person_primary_key;
       public         postgres    false    190    190            v   i   x�3�t�,J*-V064�4�0�4200�2⼰��b]CSNCS#NCKK.c�JcN#KS�J3.N���̼tscs]3�F`��\��2��A@q#�.�=... I�      m   h   x�e��� ����'p.�D�:7��X6G��ӋM��u�9�x�7`�,��h�B�JJ�S?��ϣ��%_��~1}Z��4��n(4X����~�R      r   }   x�e�11��+x��'/�����&E
�H�S�O�;�X���18e������H�H����GIFT��fR$<��������R(5⹗�m���C��E�s�<Cx��,�^W"�/�#�      l   �   x�=̻
�@��z�È{��V�@H%X�,��!aM����L�q��/d�ۑ�<N}̉��̤��Z\�<�9�rekD.!�@�BVȢ���i��*K�<��i������1�ӿ��dkt�ķ���j%Z����%�      n   E   x��.J��KU�8��Js��2q(0�rO-�M̫�e�1W@~Nb^
yN.��<<*8M�b���� ��J      k     x�m�In#1EץS��IC��F7p�4�S��9BR%���P�#��'�����6�`��7�.��A�!�Gܩ?�[�������ۏ@I�p:
����� Hq8��o�.ZB���U�u�x}��w�!ó��v>�G�A_�޻CɆ�sW�S�2pؓx�_�^�����g�Ӟ>�{}x-�K5��yŜ�ev�9������~����r1����k���izY|��^�F�L༹�Z�:zƭ�JqK��L���'?yt�����+��;��|�8w�@���_�i<��1
���M?��@wFi�֦J�F&�W�o��X=��3�E�R�揷���7�\9o�-����Ay���7�Yr��f��#Ν����POǶ�x����~=V!/�g)g��7u�2�צM'�Gz~v{B��c2�}����x:>^���%��G���8����ʱZ����r����~~m�sX���}L?��|&�
.�u�<ۧ�s�u����f�������Az��z->�B_���G      t   0  x����j�0�����:?�9�CN
>����V$KE2�}-��je�q�?�vF.�F��u���Rq���**Ob���Y�-�̴��$2�TT��u��+���$�b�������\$6��Ǉ�2��*����l�'��1-���ഥ:4h���	p��Ϙ��/�M}qC҅K�$'��F�m�'M��ݬ�����3���Χ�Qd�p��"�P�S�>��fU?�wpp-���}���w�sW�G�U��b�&��Z�9�y�����䛱T���|�#��e��CQ?��F     