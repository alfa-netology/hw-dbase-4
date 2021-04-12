--drop tables
DROP TABLE IF EXISTS
	Albums,
	Genres,
	Performers,
    PerformerAlbum,
    PerformerGenre,
	Tracks,
    Collections,
    TrackCollection
CASCADE;

--create tables
create table Performers(
    id serial primary key,
    name varchar(150) not null
);

create table Albums(
    id serial primary key,
    title varchar(200) not null,
    year numeric(4,0) not null
);

create table PerformerAlbum(
    performer_id integer references Performers(id),
    album_id integer references Albums(id),
    constraint pa_pk primary key (performer_id, album_id)
);

create table Genres(
    id serial primary key,
    title varchar(100) not null
);

create table PerformerGenre(
    performer_id integer references Performers(id),
    genre_id integer references Genres(id),
    constraint pg_pk primary key (performer_id, genre_id)
);

create table Tracks(
    id serial primary key,
    title text not null,
    duration time not null ,
    album_id integer not null references Albums(id)
);

create table Collections(
    id serial primary key,
    title varchar(200) not null,
    year numeric(4,0) not null
);

create table TrackCollection(
    track_id integer references Tracks(id),
    collection_id integer not null references Collections(id),
    constraint tc_pk primary key (track_id, collection_id)
);

