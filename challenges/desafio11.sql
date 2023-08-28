SELECT
    A.album_name AS album,
    COUNT(F.music_id) AS favoritadas
FROM
    SpotifyClone.favorites AS F
    JOIN SpotifyClone.songs AS S ON F.music_id = S.music_id
    JOIN SpotifyClone.albums AS A ON A.album_id = S.album_id
GROUP BY album
ORDER BY
    favoritadas DESC,
    album
LIMIT 3;