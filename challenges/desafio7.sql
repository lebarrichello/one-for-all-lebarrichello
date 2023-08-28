SELECT
    a.artist_name AS artista,
    al.album_name AS album,
    COUNT(fa.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists a
LEFT JOIN SpotifyClone.albums al ON a.artist_id = al.artist_id
LEFT JOIN SpotifyClone.following_artists fa ON a.artist_id = fa.artist_id
GROUP BY a.artist_name, al.album_name
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;
