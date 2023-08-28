CREATE TABLE
    SpotifyClone.favorites(
        favorites_id INTEGER auto_increment PRIMARY KEY NOT NULL,
        user_id INTEGER NOT NULL,
        music_id INTEGER NOT NULL,
        CONSTRAINT UNIQUE(user_id, music_id),
        FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
        FOREIGN KEY (music_id) REFERENCES SpotifyClone.songs (music_id)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.favorites (user_id, music_id)
VALUES ('1', '3'), ('1', '6'), ('1', '10'), ('2', '4'), ('3', '1'), ('3', '3'), ('4', '7'), ('4', '4'), ('5', '10'), ('5', '2'), ('8', '4'), ('9', '7'), ('10', '3');