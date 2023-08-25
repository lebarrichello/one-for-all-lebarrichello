SELECT
    COUNT(*) AS cancoes,
    (SELECT COUNT(*) FROM artists) AS artistas,
    (SELECT COUNT(*) FROM albums) AS albuns
FROM songs;
