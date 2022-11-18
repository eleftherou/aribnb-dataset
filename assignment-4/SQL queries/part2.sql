/*returns the listing id and neighbourhood of rooms who can accomodate exactly 4 persons and their bed type is real bed.
output: 3697 lines*/
SELECT location.listing_id, location.neighbourhood
FROM Location
INNER JOIN Room
ON Location.listing_id = Room.listing_id
WHERE (Room.bed_type='Real Bed' and Room.accommodates='4')
GROUP BY Location.listing_id, location.neighbourhood ;