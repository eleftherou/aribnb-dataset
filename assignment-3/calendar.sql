UPDATE Calendar
SET price = REPLACE(price, '$', '');

UPDATE Calendar
SET adjusted_price = REPLACE(adjusted_price, '$', '');


/*allagi typou*/
ALTER TABLE Calendar
ALTER COLUMN price TYPE decimal;

ALTER TABLE Calendar
ALTER COLUMN adjusted_price TYPE decimal;