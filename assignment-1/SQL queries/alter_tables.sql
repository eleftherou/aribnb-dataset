ALTER TABLE Listings
	ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Geolocation(properties_neighbourhood);

ALTER TABLE ListingsSummary
	ADD FOREIGN KEY (id) REFERENCES Listings(id);
	
ALTER TABLE Reviews
	ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);
	
ALTER TABLE ReviewsSummary
	ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);
	
ALTER TABLE Calendar
	ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);
	
ALTER TABLE Neighbourhoods
	ADD FOREIGN KEY (neighbourhood) REFERENCES Geolocation(properties_neighbourhood);