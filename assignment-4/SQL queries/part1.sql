CREATE TABLE Amenity AS
	(SELECT DISTINCT UNNEST(amenities::text[]) AS amenity_name FROM Room );
 
ALTER  TABLE Amenity
	ADD COLUMN amenity_id SERIAL PRIMARY KEY;

 
CREATE TABLE Room_Amenity_Connection AS
	(SELECT temp.listing_id , amenity.amenity_id FROM amenity,
	(SELECT room.listing_id, UNNEST(amenities::text[]) AS amenity_name FROM Room ) AS temp
	WHERE temp.amenity_name = amenity.amenity_name);
 


ALTER TABLE Room_Amenity_Connection
ADD FOREIGN KEY(listing_id) REFERENCES Listing(id),
ADD FOREIGN KEY(amenity_id) REFERENCES Amenity(amenity_id);


ALTER TABLE Room
DROP COLUMN amenities;
 
 
 

