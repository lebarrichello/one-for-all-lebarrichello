SELECT
    Ar.artist_name AS artista,
    CASE
        WHEN COUNT(F.music_id) >= 5 THEN 'A'
        WHEN COUNT(F.music_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(F.music_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM SpotifyClone.artists AS Ar
    JOIN SpotifyClone.albums AS Al ON Ar.artist_id = Al.artist_id
    JOIN SpotifyClone.songs AS S ON Al.album_id = S.album_id
    LEFT JOIN SpotifyClone.favorites AS F ON S.music_id = F.music_id
GROUP BY artista
ORDER BY
    CASE
        WHEN ranking = '-' THEN 1
        ELSE 0
    END,
    ranking,
    artista;