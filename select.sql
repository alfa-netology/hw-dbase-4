-- название и год выхода альбомов, вышедших в 2018 году
SELECT title, year
FROM albums
WHERE year = 2018;

-- название и продолжительность самого длительного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1

-- название треков, продолжительность которых не менее 3,5 минуты;
SELECT title, duration
FROM tracks
WHERE duration < '00:03:30'

-- названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT title, year
FROM collections
WHERE year BETWEEN 2018 and 2020;

-- исполнители, чье имя состоит из 1 слова;
SELECT name
FROM performers
WHERE name NOT LIKE '% %'

-- название треков, которые содержат слово "мой"/"my"
SELECT title, duration
FROM tracks
WHERE title ~* '(my |мой )';


-- many-to-many
-- select albums by performer
SELECT performers.name, albums.title
FROM PerformerAlbum
INNER JOIN Performers ON Performers.id = PerformerAlbum.performer_id
INNER JOIN Albums ON Albums.id = PerformerAlbum.Album_id
WHERE performers.name = 'The XX';

-- select performer by genre
SELECT performers.name, genres.title
FROM PerformerGenre
INNER JOIN Performers ON Performers.id = PerformerGenre.performer_id
INNER JOIN Genres ON Genres.id = PerformerGenre.genre_id
WHERE genres.title = 'Hip-Hop';

-- select track list by collection title
SELECT Tracks.title, Collections.title
FROM TrackCollection
INNER JOIN Tracks ON Tracks.id = TrackCollection.track_id
INNER JOIN Collections ON Collections.id = TrackCollection.collection_id
WHERE Collections.title = 'Nirvana Collection';