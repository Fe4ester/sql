-- Создание таблицы genres
CREATE TABLE IF NOT EXISTS genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Создание таблицы artists
CREATE TABLE IF NOT EXISTS artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Создание таблицы artists_genres
CREATE TABLE IF NOT EXISTS artists_genres (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Создание таблицы albums
CREATE TABLE IF NOT EXISTS albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900),
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- Создание таблицы tracks
CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration VARCHAR(10) NOT NULL CHECK (duration ~ '^[0-9]{1,2}:[0-9]{2}$'),
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Создание таблицы collections
CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900)
);

-- Создание таблицы albums_collections
CREATE TABLE IF NOT EXISTS albums_collections (
    album_id INT NOT NULL,
    collection_id INT NOT NULL,
    PRIMARY KEY (album_id, collection_id),
    FOREIGN KEY (album_id) REFERENCES albums(id),
    FOREIGN KEY (collection_id) REFERENCES collections(id)
);

-- Создание таблицы tracks_collections
CREATE TABLE IF NOT EXISTS tracks_collections (
    track_id INT NOT NULL,
    collection_id INT NOT NULL,
    PRIMARY KEY (track_id, collection_id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    FOREIGN KEY (collection_id) REFERENCES collections(id)
);
