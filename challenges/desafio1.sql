DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;


CREATE TABLE SpotifyClone.plan (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(255),
    plan_value DECIMAL(10, 2)
) engine = InnoDB;

INSERT INTO SpotifyClone.plan (plan_name, plan_value)
VALUES
    ('Gratuito', 0),
    ('Familiar', 7.99),
    ('Universitário', 5.99),
    ('Pessoal', 6.99);
    
    
    CREATE TABLE SpotifyClone.artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255)
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');



CREATE TABLE SpotifyClone.users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255),
    user_age INT,
    plan_signature_date DATE,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.users (user_name, user_age,plan_signature_date,plan_id)
VALUES
    ('Barbara Liskov',82,20191020,1),
	('Robert Cecil Martin',58,20170106,1),
	('Ada Lovelace',37,20171230,2),
	('Martin Fowler',46,20170117,2),
	('Sandi Metz',58,20180429,2),
	('Paulo Freire',19,20180214,3),
	('Bell Hooks',26,20180105,3),
	('Christopher Alexander',85,20190605,4),
	('Judith Butler',45,20200513,4),
	('Jorge Amado',58,20170217,4);
    

CREATE TABLE SpotifyClone.following_artists (
    following_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    UNIQUE(user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.following_artists (user_id,artist_id)
VALUES
    (1,1),
	(1,2),
    (1,3),
	(2,1),
	(2,3),
    (3,2),
    (4,4),
    (5,5),
    (5,6),
    (6,6),
    (6,1),
    (7,1),
    (8),
    (9,3),
    (10,2);
    


CREATE TABLE SpotifyClone.albums(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255),
    album_release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albums(album_name, album_release_year,artist_id)
VALUES
    ('Renaissance',2022,1),
	('Jazz',1978,2),
    ('Hot Space',1982,2),
    ('Falso Brilhante',1998,3),
    ('Vento de Maio',2001,3),
    ('QVVJFA?',2003,4),
    ('Somewhere Far Beyond',2007,5),
    ('I Put A Spell On You',2012,6);
    
    
    
CREATE TABLE SpotifyClone.songs(
    music_id INT AUTO_INCREMENT PRIMARY KEY,
    music_name VARCHAR(255),
    music_time INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs(music_name, music_time,album_id)
VALUES
    ('BREAK MY SOUL',279,1),
	('VIRGOS GROOVE',369,1),
    ('ALIEN SUPERSTAR',116,1),
    ('Dont Stop Me Now',203,2),
    ('Under Pressure',152,3),
    ('Como Nossos Pais',105,4),
    ('O Medo de Amar é o Medo de Ser Livre',207,5),
    ('Samba em Paris',267,6),
    ('The Bards Song',244,7),
    ('Feeling Good',100,8);
    
    
    
CREATE TABLE SpotifyClone.playback_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    music_id INT,
    reproduction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (music_id) REFERENCES songs(music_id),
    UNIQUE(user_id, music_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.playback_history (user_id,reproduction_date,music_id)
VALUES
	('1', '2022-02-28 10:45:55', '1'),
	('1', '2020-05-02 05:30:35', '2'),
	('1', '2020-03-06 11:22:33', '3'),
	('2', '2022-08-05 08:05:17', '3'),
	('2', '2020-01-02 07:40:33', '6'),
	('3', '2020-11-13 16:55:13', '3'),
	('3', '2020-12-05 18:38:30', '2'),
	('4', '2021-08-15 17:10:10', '1'),
	('5', '2022-01-09 01:44:33', '1'),
	('5', '2020-08-06 15:23:43', '5'),
	('6', '2017-01-24 00:31:17', '6'),
	('6', '2017-10-12 12:35:20', '7'),
	('7', '2011-12-15 22:30:49', '8'),
	('8', '2012-03-17 14:56:41', '8'),
	('9', '2022-02-24 21:14:22', '9'),
	('10', '2015-12-13 08:30:22', '10');
