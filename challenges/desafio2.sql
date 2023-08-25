SELECT
    COUNT(*) AS cancoes,
    (SELECT COUNT(*) FROM SpotifyClone.artists) AS artistas,
    (SELECT COUNT(*) FROM SpotifyClone.albums) AS albuns
FROM SpotifyClone.songs;
