#Query 01 "Know the number of customers."
SELECT COUNT(customer_id) as number_of_customer FROM customer;

#Query 02 "Know the number of customers per city."
SELECT city.city_name, COUNT(customer_id) as number_of_customer 
FROM customer 
INNER JOIN address ON customer.address_id_delivered_to=address_id
INNER JOIN city ON address.city_id=city.city_id
GROUP BY city.city_id;

#Query 03 "Know the average cost of travel."
SELECT  composed_of.travel_id, AVG(tariff.amount) as average_cost
FROM tariff
INNER JOIN stage ON tariff.id_tariff=stage.id_tariff
INNER JOIN composed_of ON stage.stage_id=composed_of.stage_id
GROUP BY composed_of.travel_id;

#Query 04 "Know the most popular cities."
SELECT city.city_name, COUNT(stage.city_id_Arrive) as number_of_visits
FROM city
INNER JOIN stage ON city.city_id=stage.city_id_Arrive
GROUP BY stage.city_id_Arrive
ORDER BY COUNT(stage.city_id_Arrive) DESC;


#Query 05 "Know the proportion of intra-city and inter-city trips."
SELECT travel.travel_type, COUNT(travel_type)*100/(SELECT COUNT(travel_type) FROM travel) AS Proportion
FROM travel 
GROUP BY travel.travel_type;

#Query 06 "Know the number of trips where the means of transportation is by air."
SELECT COUNT(composed_of.travel_id) AS Number_of_travel_by_plane 
FROM composed_of 
INNER JOIN characterized_by ON composed_of.stage_id = characterized_by.stage_id 
INNER JOIN means_of_transport ON characterized_by.means_of_transport_id = means_of_transport.means_of_transport_id
WHERE means_of_transport.means_of_transport_type = "Plane";

#Query 07 "Know the number of trips where the means of transportation are air and bus."
SELECT COUNT(travel_id) AS number_of_travel_by_plane_and_coach
FROM (
SELECT travel_id
FROM (SELECT composed_of.travel_id, means_of_transport.means_of_transport_type
	FROM composed_of
	INNER JOIN characterized_by ON composed_of.stage_id = characterized_by.stage_id 
	INNER JOIN means_of_transport ON characterized_by.means_of_transport_id = means_of_transport.means_of_transport_id
    ) AS A
WHERE NOT EXISTS(
				SELECT means_of_transport_type
                FROM (SELECT means_of_transport_type
					FROM means_of_transport
                    WHERE means_of_transport.means_of_transport_type='Plane' OR means_of_transport.means_of_transport_type='Coach') AS C
                WHERE NOT EXISTS (
								SELECT *
                                FROM (SELECT composed_of.travel_id, means_of_transport.means_of_transport_type
									FROM composed_of
									INNER JOIN characterized_by ON composed_of.stage_id = characterized_by.stage_id 
									INNER JOIN means_of_transport ON characterized_by.means_of_transport_id = means_of_transport.means_of_transport_id
									) AS B
								WHERE A.travel_id=B.travel_id
                                AND B.means_of_transport_type=C.means_of_transport_type
								)
				)
GROUP BY travel_id
HAVING COUNT(*)=(SELECT COUNT(DISTINCT means_of_transport_type) FROM (SELECT means_of_transport_type
					FROM means_of_transport
                    WHERE means_of_transport.means_of_transport_type='Plane' OR means_of_transport.means_of_transport_type='Train') AS D)) AS E;
	

#Query 08 "Know the most attractive time of the year for travel sales."
SELECT MONTH(travel.travel_reservation_date), COUNT(travel.travel_id)
FROM travel
GROUP BY MONTH(travel.travel_reservation_date);

#Query 09 "Know the most used means of transportation over the last 3 months."
SELECT means_of_transport.means_of_transport_type, COUNT(means_of_transport.means_of_transport_id) AS use_means_of_transport
FROM means_of_transport
INNER JOIN characterized_by ON means_of_transport.means_of_transport_id=characterized_by.means_of_transport_id
INNER JOIN stage ON characterized_by.stage_id=stage.stage_id
WHERE stage.departure_date>=DATE_SUB(now(), INTERVAL 3 MONTH)
GROUP BY means_of_transport.means_of_transport_id
ORDER BY use_means_of_transport DESC;

#Query 10 "Know the average fare of the tickets according to the transport."
SELECT means_of_transport.means_of_transport_type, AVG(tariff.amount)
FROM tariff
INNER JOIN stage ON tariff.id_tariff=stage.id_tariff
INNER JOIN characterized_by ON stage.stage_id=characterized_by.stage_id
INNER JOIN means_of_transport ON characterized_by.means_of_transport_id=means_of_transport.means_of_transport_id
GROUP BY means_of_transport.means_of_transport_id;

SELECT means_of_transport.means_of_transport_type, AVG(tariff.amount)
FROM tariff
INNER JOIN stage ON tariff.id_tariff=stage.id_tariff
INNER JOIN characterized_by ON stage.stage_id=characterized_by.stage_id
INNER JOIN means_of_transport ON characterized_by.means_of_transport_id=means_of_transport.means_of_transport_id
INNER JOIN composed_of ON stage.stage_id=composed_of.stage_id
INNER JOIN travel ON composed_of.travel_id=travel.travel_id
WHERE travel.travel_type='inter-ville'
GROUP BY means_of_transport.means_of_transport_id;

#Query 11 "Know the average number of people by gender who travelled in the last 6 months."
SELECT customer.customer_gender, COUNT(customer.customer_id)*100/(SELECT COUNT(customer.customer_id) FROM customer) AS proportion_of_customer_who_travelled_in_the_last_6_months
FROM customer
INNER JOIN travel ON customer.customer_id=travel.customer_id
WHERE travel_departure_date>DATE_SUB(now(), INTERVAL 6 MONTH)
GROUP BY customer.customer_gender;


#Query 12 "Know the average number of seniors who travelled in the last 6 months."
SELECT COUNT(customer.customer_id)*100/(SELECT COUNT(customer.customer_id) FROM customer) AS number_of_seniors_who_travelled_in_the_last_6_months
FROM customer
INNER JOIN travel ON customer.customer_id=travel.customer_id
WHERE travel.travel_departure_date>DATE_SUB(now(), INTERVAL 6 MONTH) AND TIMESTAMPDIFF(YEAR, customer.customer_birthdate, now())>=60;


#Query 13 "Know the average number of children traveling in the last 6 months."
SELECT COUNT(customer.customer_id)*100/(SELECT COUNT(customer.customer_id) FROM customer) AS number_of_children_who_travelled_in_the_last_6_months
FROM customer
INNER JOIN travel ON customer.customer_id=travel.travel_id
WHERE travel.travel_departure_date>DATE_SUB(now(), INTERVAL 6 MONTH) AND TIMESTAMPDIFF(YEAR, customer.customer_birthdate, now())<=18;

#Query 14 "Know the preferred payment method of customers since "X date"."
DROP PROCEDURE IF EXISTS proc;
DELIMITER //
CREATE PROCEDURE proc (IN xdate DATE)
BEGIN
SELECT payment.means_of_payment, COUNT(payment.means_of_payment) AS number_use_means_of_payment
FROM payment
WHERE payment.payment_date>=xdate
GROUP BY payment.means_of_payment
ORDER BY number_use_means_of_payment DESC;
END//

DELIMITER ;
CALL proc ("2021-02-09");

#Query 15 "Know the most senior staff in the agency."
SELECT staff_id, staff_last_name, staff_first_name, staff_phone_number, staff_company_email_address, staff_hire_date, staff.address_id
FROM staff
WHERE staff_hire_date=(SELECT MIN(staff_hire_date) FROM staff);

#Query 16 "Know the different information for a trip: trip number, price, departure date, number of cities crossed."
SELECT travel.travel_id, SUM(tariff.amount) AS travel_price, travel.travel_departure_date, COUNT(stage.city_id_Arrive) AS number_of_cities_crossed
FROM travel
INNER JOIN composed_of ON travel.travel_id=composed_of.travel_id
INNER JOIN stage ON composed_of.stage_id=stage.stage_id
INNER JOIN tariff ON stage.id_tariff=tariff.id_tariff
GROUP BY travel_id;