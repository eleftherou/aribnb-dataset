CREATE TABLE Location
	AS (SELECT listing_id, street, neighbourhood, neighbourhood_cleansed, city, state,
		zipcode, market, smart_location, country_code, country, latitude, longitude,
		is_location_exact
	FROM Listings);
	
	
ALTER TABLE Listings
	DROP COLUMN listing_id, 
	DROP COLUMN street, 
	DROP COLUMN neighbourhood,
	DROP COLUMN neighbourhood_cleansed, 
	DROP COLUMN city, 
	DROP COLUMN state,
	DROP COLUMN zipcode, 
	DROP COLUMN market, 
	DROP COLUMN smart_location, 
	DROP COLUMN country_code, 
	DROP COLUMN country, 
	DROP COLUMN latitude, 
	DROP COLUMN longitude,
	DROP COLUMN is_location_exact;
	

/* afairesi sisxetishs*/
ALTER TABLE Listings DROP CONSTRAINT listings_neighbourhood_cleansed_fkey;


/*dilwsi neou foreign key*/
ALTER TABLE Location
	ADD FOREIGN KEY (listings_id) REFERENCES Listings(id);