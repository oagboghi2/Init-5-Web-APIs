DROP TABLE IF EXISTS album;
CREATE TABLE album(
id SERIAL PRIMARY KEY,
album_title VARCHAR(255),
song_count INTEGER,
genre VARCHAR(255),
artist VARCHAR(255)
);

DROP TABLE IF EXISTS artist;
CREATE TABLE artist(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
band_members VARCHAR(255),
genre VARCHAR(255),
artist_album VARCHAR(255)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs(
id SERIAL PRIMARY KEY,
song_title VARCHAR(255),
length INTEGER,
song_count INTEGER,
artist VARCHAR(255)
);

INSERT INTO album( album_title, song_count, genre, artist ) VALUES('The Search for Everything', 12, 'Rock and Roll/Blues', 'John Mayer' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Where does this door go', 12, 'Neo-Soul', 'Mayer hawthorne' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Good Kid/Mad City', 16, 'Rap/HipHop', 'Kendrick Lamarr' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Radius', 13, 'Neo-Soul', 'Allen Stone' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Black Holes and Revelations', 12, 'Rock and Roll', 'Muse' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Cool Uncle', 13, 'Neo-Soul', 'Bobby Caldwell & Jack Splash' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('The College Dropout', 21, 'Rap/HipHop', 'Kanye West');
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Girl', 12, 'Pop/R&B', 'Pharrell' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('Lionese/Hidden treasures' , 13, 'Pop/Neo-Soul', 'Amy Winehouse' );
INSERT INTO album( album_title, song_count, genre, artist ) VALUES('The 20/20 Experience', 13, 'Pop/R&B', 'Justin Timberlake' );

INSERT INTO artist( name, band_members, genre, artist_album ) VALUES('John Mayer', 'Dead and Company', 'Rock and Roll/Blues', 'The Search for Everything');
INSERT INTO artist( name, band_members, genre, artist_album ) VALUES('Mayer Hawthorne', 'The County', 'Neo-Soul', 'Where does this door go' );
INSERT INTO artist( name, band_members, genre, artist_album ) VALUES('Kendrick Lamarr', 'Black Hippy', 'Rap/HipHop', 'The Search for Everything' );

INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Rosie', 4, 12, 'John Mayer' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Backseat Lover', 3, 12, 'Mayer Hawthorne' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Drink', 6, 16, 'Kendrick Lamarr' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Viva La Gadda', 17, 2, 'Mars Volta' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Helpless', 3, 12, 'John Mayer' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Take a Bow', 4, 3, 'Muse' );
INSERT INTO songs( song_title, length, song_count, artist ) VALUES('Supermassice Black Hole', 4, 6, 'Muse' );


-- SELECT albumTitle FROM album;
-- SELECT * FROM playlist;
-- SELECT * FROM songs;
-- SELECT * FROM artist;
--
-- SELECT song_title FROM songs WHERE length < 4 AND songCount > 10;
-- SELECT songs FROM playlist ORDER BY songs;
-- SELECT song_Title FROM songs ;
--
-- SELECT artist FROM album WHERE genre IN ('Neo-Soul');
--
--
-- SELECT albumTitle, songCount FROM album
-- ORDER BY songCount DESC
-- LIMIT 3;
--
-- SELECT songs, SUM(songs) AS total_songs FROM playlists
--         GROUP BY Playlist_name
--         HAVING total_num_songs > 15;
