/*dhmiourgia pinaka kai afairesi dolariwn*/
CREATE TABLE Price
	AS (SELECT id as listing_id,0 REPLACE(price,'$','') AS price,REPLACE(weekly_price,'$','') AS weekly_price, 
		REPLACE(monthly_price,'$','') AS monthly_price,REPLACE(security_deposit,'$','') AS security_deposit,
		REPLACE(cleaning_fee,'$','') AS cleaning_fee,guests_included, REPLACE(extra_people,'$','') AS extra_people,
		minimum_nights, maximum_nights, minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
		maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
	FROM Listings);



/*aferesi kommatwn*/	 
UPDATE Price
SET price = REPLACE(price, ',', '');

UPDATE Price
SET weekly_price = REPLACE(weekly_price, ',', '');

UPDATE Price
SET monthly_price = REPLACE(monthly_price, ',', '');

UPDATE Price
SET security_deposit = REPLACE(security_deposit, ',', '');

UPDATE Price
SET cleaning_fee = REPLACE(cleaning_fee, ',', '');

UPDATE Price
SET extra_people = REPLACE(extra_people, ',', '');



/*allagh typou*/
ALTER TABLE Price
ALTER COLUMN price TYPE decimal USING price::numeric;

ALTER TABLE Price
ALTER COLUMN weekly_price TYPE decimal USING weekly_price::numeric;

ALTER TABLE Price
ALTER COLUMN monthly_price TYPE decimal USING monthly_price::numeric;

ALTER TABLE Price
ALTER COLUMN security_deposit TYPE decimal USING security_deposit::numeric;

ALTER TABLE Price
ALTER COLUMN cleaning_fee TYPE decimal USING cleaning_fee::numeric;

ALTER TABLE Price
ALTER COLUMN extra_people TYPE decimal USING extra_people::numeric;



/*****afairesi stoixeiwn apo ton listings*****/
ALTER TABLE Listings
	DROP COLUMN price, 
	DROP COLUMN weekly_price,
	DROP COLUMN monthly_price, 
	DROP COLUMN security_deposit,
	DROP COLUMN cleaning_fee,
	DROP COLUMN guests_included, 
	DROP COLUMN extra_people, 
	DROP COLUMN minimum_nights, 
	DROP COLUMN maximum_nights,
	DROP COLUMN minimum_minimum_nights, 
	DROP COLUMN maximum_minimum_nights, 
	DROP COLUMN minimum_maximum_nights,
	DROP COLUMN maximum_maximum_nights,
	DROP COLUMN minimum_nights_avg_ntm, 
	DROP COLUMN maximum_nights_avg_ntm;
	
	
ALTER TABLE Price
	ADD FOREIGN KEY (listings_id) REFERENCES Listings(id);