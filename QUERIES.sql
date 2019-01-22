SELECT * FROM cities;

SELECT * FROM airlines;

SELECT * FROM flights;




INSERT INTO persons(
            first_name, middle_name, last_name)
    VALUES ('Evgen', 'Evgenovych', 'Evtushenko');


INSERT INTO airlines(
            airline_name, year_of_foundation, president_person_id, 
            adress_main_office_amo_id)
    VALUES ('UNO', 1950, 8, 2);

INSERT INTO flights(
            	price, aircraft_id, departure_city_id, arrival_city_id, 
           	 airline_id, time_departure, time_arrival, flight_time, flight_name)
    VALUES (1000, 2, 3, 6, 5, '01:20', '2:50', '1:30', '234 SOF-TXL');



INSERT INTO cities(
	city_name, population, mayor_person_id, country_id)
	VALUES ('Lviv', 950000, 13, 1);


UPDATE airlines
	SET airline_name='Hub'
	WHERE airline_id=2;


DELETE FROM flights
  	 WHERE flight_id=23;


DELETE FROM cities
 	WHERE city_id=9;


SELECT * FROM cities
	WHERE city_name LIKE 'B%';


SELECT * FROM flights
	WHERE flight_name LIKE '%K%';


SELECT * FROM airlines
	WHERE airline_name LIKE '%ai%';


SELECT * FROM persons 
	ORDER BY first_name ASC;


SELECT * FROM persons 
	ORDER BY first_name DESC;


SELECT DISTINCT A.airline_name, C.aircraft_grade AS craft_model
	FROM flights F
	JOIN airlines A ON (F.airline_id=A.airline_id)
	JOIN aircrafts C ON (F.aircraft_id=C.aircraft_id);


SELECT DISTINCT city_name AS arrival_city, airline_name FROM flights AS F
	JOIN cities AS C ON F.arrival_city_id=C.city_id
	JOIN airlines AS A ON F.airline_id=A.airline_id
	WHERE A.airline_name IN
	(SELECT airline_name FROM airlines WHERE airline_name='Wizzair');


SELECT F.flight_name, F.price, F.time_departure, F.time_arrival, c1.city_name AS departure_city_name, c2.city_name AS arrival_city_name FROM flights AS F
	 JOIN cities AS c1 ON (arrival_city_id=c1.city_id)
	 JOIN cities AS c2 ON (departure_city_id=c2.city_id)
	WHERE (departure_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Kyiv')) 
	AND (arrival_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Berlin'));


SELECT F.flight_name, F.time_departure, F.time_arrival, c1.city_name AS departure_city_name, c2.city_name AS arrival_city_name FROM flights AS F
 	JOIN cities AS c1 ON (arrival_city_id=c1.city_id)
	 JOIN cities AS c2 ON (departure_city_id=c2.city_id)
	WHERE (departure_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name LIKE '%k%')) 
	AND (arrival_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name LIKE '%k%'));



SELECT f.flight_name, a.airline_name, c1.city_name AS departure_city, c2.city_name AS arrival_city FROM flights AS f
	 JOIN cities AS c1 ON (arrival_city_id=c1.city_id)
	 JOIN cities AS c2 ON (departure_city_id=c2.city_id)
	 JOIN airlines AS a ON (f.airline_id=a.airline_id)
	WHERE (f.departure_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Krakow')) 
	AND (f.arrival_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Munich'))
	AND (a.airline_id IN
		(SELECT airline_id FROM airlines WHERE airlines.airline_name= 'LOT'));




SELECT f.flight_name, a.airline_name, c1.city_name AS departure_city, c2.city_name AS arrival_city, ac.aircraft_grade AS aircraft_model FROM flights AS f
	 JOIN cities AS c1 ON (arrival_city_id=c1.city_id)
	 JOIN cities AS c2 ON (departure_city_id=c2.city_id)
	 JOIN aircrafts AS ac ON (f.aircraft_id=ac.aircraft_id)
	 JOIN airlines AS a ON (f.airline_id=a.airline_id)

	WHERE (f.departure_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Kyiv')) 
	AND (f.arrival_city_id IN
		(SELECT city_id FROM cities WHERE cities.city_name = 'Berlin'))
	AND (a.airline_id IN
		(SELECT airline_id FROM airlines WHERE airlines.airline_name = 'MAU'))
	AND (ac.aircraft_id IN
		(SELECT aircraft_id FROM aircrafts WHERE aircraft_grade = 'Boeing 737-900ER')) ;



