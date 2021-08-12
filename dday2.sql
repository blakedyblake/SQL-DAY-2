--Joins
SELECT * FROM invoice WHERE invoice_id IN(
    SELECT invoice_id FROM invoice_line WHere unit_price > 0.99
);

SELECT invoice_date, first_name, last_name, total FROM invoice
    JOIN customer ON customer.customer_id = invoice.invoice_id;


SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer Join employee 
ON customer.support_rep_id = employee.employee_id;

SELECT album.title "Album Name", artist.name "Band/Artist" from album 
join artist ON album.artist_id = artist.artist_id;

SELECT playlist_track.track_id FROM playlist_track WHERE playlist_id IN(
    SELECT playlist_id FROM playlist WHERE name = 'Music'
);

SELECT track.name, playlist.playlist_id FROM track Join playlist_track
ON track.track_id = playlist_track.track_id
Join playlist ON playlist.playlist_id = playlist_track.playlist_id;

SELECT track.name "Track Name", playlist.name "Playlist Name" FROM track Join playlist_track
ON track.track_id = playlist_track.track_id
Join playlist ON playlist.playlist_id = playlist_track.playlist_id;

SELECT track.name, album.title FROM track Join album ON track.album_id = album.album_id
Join genre ON track.genre_id = genre.genre_id WHERE genre.name = 'Alternative & Punk';

---------------------------------------------------------
--subquery
SELECT * FROM invoice WHERE invoice_id IN(
    SELECT invoice_id FROM invoice_line WHERE unit_price >0.99
);

SELECT * FROM playlist_track WHERE playlist_id IN(
    SELECT playlist_id FROM playlist WHERE name = 'Music'
);

SELECT track.name FROM track WHERE track_id IN(
    SELECT track_id FROM playlist_track WHERE playlist_id = 5
);

SELECT * FROM track Join genre ON track.genre_id = genre.genre_id
    WHERE track.genre_id IN(SELECT genre.genre_id FROM genre WHERE genre.name = 'Comedy');

SELECT *FROM track WHERE album_id IN(
    SELECT album_id FROM album WHERE artist_id IN(
        SELECT artist_id FROM artist WHERE artist.name = 'Queen'
    )
);
----------Views
CREATE VIEW Rock AS
SELECT * FROM track where genre_id IN(
    SELECT genre_id FROM genre WHERE genre.name ='Rock'
);

CREATE VIEW classical_count AS
SELECT * FROM track where track_id IN(
    SELECT track_id FROM playlist_track WHERE playlist_id IN(
        SELECT playlist_id FROM playlist WHERE playlist.name = 'Classical'
    ) 
);
-----------
UPDATE customer SET fax = NULL WHERE fax IS NOT NULL;

UPDATE customer SET company = 'Self' WHERE company IS NULL;

UPDATE customer Set last_name = 'Thompson' WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer SET support_rep_id = 4 WHERE email = 'luisrojas@yahoo.cl';

UPDATE track SET composer = 'The darkness around us' WHERE composer IS NULL AND genre_ID IN(
    SELECT genre_Id FROM genre where genre.name = 'Metal'
);

CREATE TABLE animals (
id SERIAL PRIMARY KEY, name VARCHAR(50), type TEXT, age INTEGER

);

INSERT INTO animals ( name, type, age ) VALUES ('Leo', 'lion', 12), ('Jerry', 'mouse', 4), ('Marty', 'zebra', 10), ('Gloria', 'hippo', 8), ('Alex', 'lion', 9), ('Melman', 'giraffe', 15), ('Nala', 'lion', 2), ('Marie', 'cat', 1), ('Flounder', 'fish', 8);

DELETE FROM animals WHERE type = 'lion';
DELETE FROM animals WHERE name like 'M%';
DELETE FROM animals WHERE age < 9;
--------
INSERT INTO animals ( name, type, age ) VALUES ('Leo', 'lion', 12), ('Jerry', 'mouse', 4), ('Marty', 'zebra', 10), ('Gloria', 'hippo', 8), ('Alex', 'lion', 9), ('Melman', 'giraffe', 15), ('Nala', 'lion', 2), ('Marie', 'cat', 1), ('Flounder', 'fish', 8);
ALTER TABLE animals ADD location varchar(40);
ALTEr TABLE animals RENAME COLUMN type species;
ALTER TABLE animals ALTER COLUMN species VARCHAR (40); -- I got an error here. Not sure why


---------
