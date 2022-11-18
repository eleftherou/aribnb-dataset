/* Finds all the houses whose price are 55$ on 9/4/2020
Output: 282 rows
*/
SELECT listings.id, listings.listing_url
FROM listings
INNER JOIN calendar
ON listings.id = calendar.listing_id
WHERE calendar.price = '$51.00' AND calendar.date='2020-4-9';


/* Shows all the names of people who have reviewd the house with id = 10595
Output: 24 rows
*/
SELECT reviewer_name
FROM reviews
INNER JOIN listings
ON listings.id = reviews.listing_id
WHERE listings.id = '10595'
ORDER BY reviewer_name;



/* Finds all the neighbourhoods whose names stare with 'P'
Output: 9 rows
*/
SELECT neighbourhood
FROM neighbourhoods
INNER JOIN geolocation
ON geolocation.properties_neighbourhood = neighbourhoods.neighbourhood
WHERE geolocation.properties_neighbourhood LIKE 'Π%';



/* Shows the id of the houses whose price is beetwen $50-$70
Output: 2850 rows
*/
SELECT listings.id, listings.listing_url FROM Listings
WHERE price BETWEEN '$50.00' AND '$70.00'
ORDER BY price;



/* Shows the lowest and the highest price for 1 night of all houses in the area of Ampelokipoi
Output: 1 row
*/
SELECT 
	MIN(listingssummary.price) AS LowestPrice, MAX(listingssummary.price) AS HighestPrice 
FROM 
	ListingsSummary
INNER JOIN Geolocation
	ON ListingsSummary.neighbourhood = Geolocation.properties_neighbourhood
WHERE Geolocation.properties_neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ';



/* Finds the number of the houses which exist in every neighbourhood
Output: 45 rows
*/
SELECT 
	ListingsSummary.neighbourhood, COUNT(ListingsSummary.id) AS NumberOfHouses
FROM 
	ListingsSummary
LEFT JOIN Neighbourhoods
	ON ListingsSummary.neighbourhood = Neighbourhoods.neighbourhood
GROUP BY ListingsSummary.neighbourhood
ORDER BY ListingsSummary.neighbourhood;


/* Finds the reviews average of houses which have been rented more than 5 times until now
Output: 1 row
*/
SELECT AVG(number_of_reviews)
FROM listingssummary
WHERE calculated_host_listings_count >= 5;


/* For each review it finds the id of the person who reviewd the house, the id and the price of the house
Output: 416794
*/
SELECT reviews.reviewer_name, reviews.listing_id, listingssummary.price
FROM reviews
FULL OUTER JOIN listingssummary 
ON reviews.listing_id = listingssummary.id
ORDER BY listingssummary.id;



/* Finds the first 20 reviews for the house with id = 10990
Output: 20 rows
*/
SELECT 
	Reviews.id, Reviews.date, Reviews.reviewer_name, Reviews.comments
FROM 
	Reviews
INNER JOIN ListingsSummary
	ON Reviews.listing_id = ListingsSummary.id 
WHERE ListingsSummary.id = '10990'
LIMIT 20;


/* Finds in every neighbourhood the name of the host of each house
Output: 11541 rows
*/
SELECT neighbourhoods.neighbourhood, listingssummary.host_name
FROM listingssummary
FULL OUTER JOIN neighbourhoods ON neighbourhoods.neighbourhood=listingssummary.neighbourhood
ORDER BY neighbourhoods.neighbourhood;




/* Finds all the houses which were not available on 18/3/2020
Output: 5896 rows
*/
SELECT listings.id, listings.listing_url, calendar.date
FROM listings
INNER JOIN calendar
ON listings.id = calendar.listing_id
WHERE calendar.date = '2020-3-18' AND calendar.available='f';


/* Finds all the id of houses which have been reviews on 22/11/2013
Output: 5 rows
*/
SELECT DISTINCT calendar.listing_id
FROM calendar
INNER JOIN reviews
ON calendar.listing_id = reviews.listing_id
WHERE reviews.date = '2013-11-22';