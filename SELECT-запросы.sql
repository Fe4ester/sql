--SELECT запросы(2 задание)


--Название и продолжительность самого длинного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

--Названия треков продолжительность которых не менее 3.5 минут
SELECT title
FROM tracks
WHERE (CAST(split_part(duration, ':', 1) AS INT) * 60 + CAST(split_part(duration, ':', 2) AS INT)) >= 210;

--Названия сборников, вышедших в период с 2018 до 2020 года включительно
SELECT title
FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM tracks
WHERE title ILIKE '%мой%' OR title ILIKE '%my%';


--SELECT запросы(3 задание)

--Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genres g
JOIN artists_genres ag ON g.id = ag.genre_id
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов 
SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, 
       AVG(CAST(split_part(t.duration, ':', 1) AS INT) * 60 + CAST(split_part(t.duration, ':', 2) AS INT)) AS avg_duration_seconds
FROM tracks t
JOIN albums a ON t.album_id = a.id
GROUP BY a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM artists ar
WHERE NOT EXISTS (
    SELECT 1
    FROM albums al
    WHERE ar.id = al.artist_id
    AND al.release_year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберем исполнителя с id = 1)
SELECT DISTINCT c.title
FROM collections c
JOIN albums_collections ac ON c.id = ac.collection_id
JOIN albums a ON ac.album_id = a.id
WHERE a.artist_id = 1;