--Запросы SELECT(2 задание)

-- Название и продолжительность самого длинного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Названия треков продолжительность которых не менее 3.5 минут
SELECT title
FROM tracks
WHERE (EXTRACT(EPOCH FROM duration) / 60) >= 3.5;

-- Названия сборников, вышедших в период с 2018 до 2020 года включительно
SELECT title
FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM tracks
WHERE title ~* '\yмой\y' OR title ~* '\ymy\y';

-- SELECT запросы (3 задание)

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genres g
JOIN artists_genres ag ON g.id = ag.genre_id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов 
SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, 
       AVG(EXTRACT(EPOCH FROM t.duration)) AS avg_duration_seconds
FROM tracks t
JOIN albums a ON t.album_id = a.id
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM artists ar
WHERE NOT EXISTS (
    SELECT 1
    FROM albums al
    JOIN artists_albums aa ON al.id = aa.album_id
    WHERE aa.artist_id = ar.id
    AND al.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберем исполнителя с id = 1)
SELECT DISTINCT c.title
FROM collections c
JOIN tracks_collections tc ON c.id = tc.collection_id
JOIN tracks t ON tc.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artists_albums aa ON a.id = aa.album_id
WHERE aa.artist_id = 1;
