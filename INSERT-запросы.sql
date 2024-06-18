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
INSERT INTO albums (title, release_year) VALUES
('Album One', 2001),
('Album Two', 2003),
('Album Three', 2005),
('Album Four', 2020), 
('Album Five', 2019);

-- Вставка данных в таблицу artists_albums
INSERT INTO artists_albums (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(4, 5);

-- Вставка данных в таблицу tracks
INSERT INTO tracks (title, duration, album_id) VALUES
('Track One', '00:03:45', 1),
('Track Two', '00:04:05', 1),
('Track Three', '00:02:34', 2),
('Track Four', '00:05:12', 2),
('Track Five', '00:03:15', 3),
('Track Six', '00:04:50', 3),
('My Favorite Track', '00:04:00', 1),
('Track Seven', '00:04:00', 4),
('Track Eight', '00:03:30', 4),
('Track Nine', '00:04:00', 5), 
('Track Eleven', '00:03:30', 5),
('my own', '00:03:00', 1),
('own my', '00:03:00', 1),
('my', '00:03:00', 1),
('oh my god', '00:03:00', 1),
('myself', '00:03:00', 1),
('by myself', '00:03:00', 1),
('bemy self', '00:03:00', 1),
('myself by', '00:03:00', 1),
('by myself by', '00:03:00', 1),
('beemy', '00:03:00', 1),
('premyne', '00:03:00', 1);

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

-- Вставка данных в таблицу tracks_collections
INSERT INTO tracks_collections (track_id, collection_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 5),
(9, 4),
(10, 4);
