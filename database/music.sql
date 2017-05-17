DROP DATABASE IF EXISTS music;
CREATE DATABASE music;

CREATE TABLE album(ID INTEGER PRIMARY KEY,
albumTitle VARCHAR,
songCount INTEGER,
genre VARCHAR,
artist VARCHAR
);

CREATE TABLE artist(ID INTEGER PRIMARY KEY,
name VARCHAR,
bandmembers VARCHAR,
genre VARCHAR,
Artist_Album VARCHAR
);

CREATE TABLE songs(ID INTEGER PRIMARY KEY,
song_Title VARCHAR,
length INTEGER,
song_Count INTEGER
);

INSERT INTO album VALUES(1, 'The Search for Everything', 12, 'Rock and Roll/Blues', 'John Mayer' );
INSERT INTO album VALUES(2, 'Where does this door go' , 12,'Neo-Soul', 'Mayer hawthorne' );
INSERT INTO album VALUES(3, 'Good Kid/Mad City', 16, 'Rap/HipHop', 'Kendrick Lamarr' );
INSERT INTO album VALUES(4, 'Radius' , 13,'Neo-Soul', 'Allen Stone' );
INSERT INTO album VALUES(5, 'Black Holes and Revelations' , 12,'Rock and Roll', 'Muse' );
INSERT INTO album VALUES(6, 'Cool Uncle' , 13,'Neo-Soul', 'Bobby Caldwell & Jack Splash' );
INSERT INTO album VALUES(7, 'The College Dropout' , 21,'Rap/HipHop', 'Kanye West');
INSERT INTO album VALUES(8, 'Girl' , 12,'Pop/R&B', 'Pharrell' );
INSERT INTO album VALUES(9, 'Lionese/Hidden treasures' , 13,'Pop/Neo-Soul', 'Amy Winehouse' );
INSERT INTO album VALUES(10, 'The 20/20 Experience' , 13,'Pop/R&B', 'Justin Timberlake' );






INSERT INTO artist VALUES(1, 'John Mayer', 'Dead and Company', 'Rock and Roll/Blues', 'The Search for Everything');
INSERT INTO artist VALUES(2, 'Mayer Hawthorne', 'The County', 'Neo-Soul','Where does this door go' );
INSERT INTO artist VALUES(3, 'Kendrick Lamarr', NULL, 'Rap/HipHop','The Search for Everything' );

INSERT INTO songs VALUES(1, 'Rosie', 4, 12 );
INSERT INTO songs VALUES(2, 'Backseat Lover', 3, 12 );
INSERT INTO songs VALUES(3, 'Drink', 6, 16 );
INSERT INTO songs VALUES(4, 'Viva La Gadda', 17, 2 );
INSERT INTO songs VALUES(5, 'Helpless', 3, 12 );
INSERT INTO songs VALUES(6, 'Take a Bow', 4, 3 );
INSERT INTO songs VALUES(7, 'Supermassice Black Hole', 4, 6 );



INSERT INTO playlists VALUES(1, 'Blues',36 );
INSERT INTO playlists VALUES(2, 'Soul/R&B',76 );
INSERT INTO playlists VALUES(3, 'Rap',22 );



SELECT albumTitle FROM album;
SELECT * FROM playlist;
SELECT * FROM songs;
SELECT * FROM artist;

SELECT song_title FROM songs WHERE length < 4 AND songCount > 10;
SELECT songs FROM playlist ORDER BY songs;
SELECT song_Title FROM songs ;

SELECT artist FROM album WHERE genre IN ('Neo-Soul');


SELECT albumTitle, songCount FROM album
ORDER BY songCount DESC
LIMIT 3;

SELECT songs, SUM(songs) AS total_songs FROM playlists
        GROUP BY Playlist_name
        HAVING total_num_songs > 15;
