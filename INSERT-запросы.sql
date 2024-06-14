-- Вставка данных в таблицу genres
INSERT INTO genres (name) VALUES
('Rock'),
('Pop'),
('Jazz');

-- Вставка данных в таблицу artists
INSERT INTO artists (name) VALUES
('ArtistOne'),
('ArtistTwo'),
('ArtistThree'),
('ArtistFour');

-- Вставка данных в таблицу albums
INSERT INTO albums (title, release_year, artist_id) VALUES
('Album One', 2001, 1),
('Album Two', 2003, 2),
('Album Three', 2005, 3),
('Album Four', 2020, 4), 
('Album Five', 2019, 4);  

-- Вставка данных в таблицу tracks
INSERT INTO tracks (title, duration, album_id) VALUES
('Track One', '03:45', 1),
('Track Two', '04:05', 1),
('Track Three', '02:34', 2),
('Track Four', '05:12', 2),
('Track Five', '03:15', 3),
('Track Six', '04:50', 3),
('My Favorite Track', '04:00', 1),
('Track Seven', '04:00', 4),
('Track Eight', '03:30', 4),
('Track Nine', '04:00', 5), 
('Track Eleven', '03:30', 5); 

-- Вставка данных в таблицу collections
INSERT INTO collections (title, release_year) VALUES
('Collection One', 2010),
('Collection Two', 2011),
('Collection Three', 2012),
('Collection Four', 2019),
('Collection Five', 2020);

-- Вставка данных в таблицу artists_genres
INSERT INTO artists_genres (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2);

-- Вставка данных в таблицу albums_collections
INSERT INTO albums_collections (album_id, collection_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

-- Вставка данных в таблицу tracks_collections
INSERT INTO tracks_collections (track_id, collection_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 5);